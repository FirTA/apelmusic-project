using System.Data.SqlClient;
using System.Data;
using System.Threading.Tasks;
using apelmusic.Models;
using System.Xml.Linq;
using Npgsql;
using NpgsqlTypes;

namespace apelmusic.Logics
{
    public class InvoiceLogic
    {
        private static string conString = "";

        public static void GetConfiguration(IConfiguration configuration)
        {
            conString = configuration["ConnectionStrings:Default"];
        }

        public static string AddInvoice(Invoice invoice)
        {
            using (NpgsqlConnection con = new NpgsqlConnection(conString))
            {
                con.Open();

                using (NpgsqlCommand cmd = new NpgsqlCommand())
                {
                    cmd.Connection = con;
                    cmd.Transaction = con.BeginTransaction();

                    try
                    {
                        cmd.CommandText = "SELECT MAX(no_invoice) FROM Apelmusic.Invoice";
                        NpgsqlDataReader reader = cmd.ExecuteReader();
                        int no_invoice = 0;
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    no_invoice = reader.GetInt32(0);
                                    // Access other columns of the current row using reader.GetXXX() methods
                                }

                            }
                        }
                        reader.Close();

                        cmd.CommandText = "INSERT INTO Apelmusic.Invoice(fk_id_user, fk_id_payment_method, no_invoice, tgl_invoice) VALUES (@fk_id_user, @fk_id_payment_method, @no_invoice, @tgl_invoice) RETURNING id_invoice;";
                        cmd.Parameters.Add(new NpgsqlParameter("@fk_id_user", NpgsqlDbType.Integer) { Value = invoice.fk_id_user });
                        cmd.Parameters.Add(new NpgsqlParameter("@fk_id_payment_method", NpgsqlDbType.Integer) { Value = invoice.fk_id_payment_method });
                        cmd.Parameters.Add(new NpgsqlParameter("@no_invoice", NpgsqlDbType.Integer) { Value = no_invoice + 1 });
                        cmd.Parameters.Add(new NpgsqlParameter("@tgl_invoice", NpgsqlDbType.Date) { Value = DateTime.Parse(invoice.tgl_invoice) });

                        int pk_id_invoice = (int)cmd.ExecuteScalar(); // SCOPE_IDENTITY() type is decimal
                        cmd.Parameters.Clear();

                        foreach (DetailInvoice detailInvoice in invoice.detailInvoice)
                        {
                            cmd.CommandText = "INSERT INTO Apelmusic.DetailInvoice(fk_id_invoice, fk_id_course_user, harga) VALUES (@fk_id_invoice, @fk_id_course_user, @harga)";
                            cmd.Parameters.Add(new NpgsqlParameter("@fk_id_invoice", NpgsqlDbType.Integer) { Value = pk_id_invoice });
                            cmd.Parameters.Add(new NpgsqlParameter("@fk_id_course_user", NpgsqlDbType.Integer) { Value = detailInvoice.fk_id_course_user });
                            cmd.Parameters.Add(new NpgsqlParameter("@harga", NpgsqlDbType.Integer) { Value = detailInvoice.harga });

                            cmd.ExecuteNonQuery();
                            cmd.Parameters.Clear();

                            cmd.CommandText = "UPDATE Apelmusic.CourseUser SET status = 'purchased' WHERE id_course_user = @id_course_user";
                            cmd.Parameters.Add(new NpgsqlParameter("@id_course_user", NpgsqlDbType.Integer) { Value = detailInvoice.fk_id_course_user });
                            cmd.ExecuteNonQuery();
                            cmd.Parameters.Clear();
                        }

                        cmd.CommandText = "UPDATE Apelmusic.DetailInvoice di SET nama_category = ca.nama_category, nama_course = co.nama_course, waktu = cu.waktu FROM Apelmusic.CourseUser cu JOIN Apelmusic.Courses co ON co.id_course = cu.fk_id_course\r\nJOIN Apelmusic.categories ca ON ca.id_category = co.fk_id_category\r\nWHERE di.fk_id_course_user = cu.id_course_user AND di.fk_id_invoice = @fk_id_invoice";
                        cmd.Parameters.Add(new NpgsqlParameter("@fk_id_invoice", NpgsqlDbType.Integer) { Value = pk_id_invoice });
                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();


                        cmd.Transaction.Commit();
                        con.Close();
                        return "" + pk_id_invoice;
                    }
                    catch
                    {
                        cmd.Transaction.Rollback();
                        con.Close();
                        throw;
                    }

                } // end NpgsqlCommand

            } // end NpgsqlConnection
        }

        public static List<Invoice> GetInvoice(int? id_user)
        {
            List<Invoice> result = new List<Invoice>(); // initialisasi array kosong

            #region query process to database
            // handle query
            string query = "SELECT id_invoice, fk_id_user, fk_id_payment_method, no_invoice, tgl_invoice FROM Apelmusic.Invoice";
            if (!id_user.HasValue)
            {
                query += " WHERE fk_id_user = @fk_id_user";
            }

            // create sql params
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter("@fk_id_user", NpgsqlDbType.Integer) { Value = id_user }
            };

            // execute query and map the data to result
            DataTable dataTable = CRUD.ExecuteQuery(query, sqlParams);

            foreach (DataRow row in dataTable.Rows)
            {
                DateTime waktu = (DateTime)row["tgl_invoice"];
                string tgl_invoice = waktu.ToString("yyyy-MM-dd");

                Invoice tempData = new Invoice
                {
                    id_invoice = (int)row["id_invoice"],
                    fk_id_user = (int)row["fk_id_user"],
                    fk_id_payment_method = (int)row["fk_id_payment_method"],
                    no_invoice = (int)row["no_invoice"],
                    tgl_invoice = tgl_invoice,
                    detailInvoice = new List<DetailInvoice>(),
                    total_harga = 0,
                };

                // select all task with id
                query = "SELECT * FROM Apelmusic.DetailInvoice DetailInvoice JOIN Apelmusic.CourseUser CourseUser ON DetailInvoice.fk_id_course_user = CourseUser.id_course_user WHERE fk_id_invoice = @fk_id_invoice";

                // create sql params
                sqlParams = new NpgsqlParameter[]
                {
                    new NpgsqlParameter("@fk_id_invoice", NpgsqlDbType.Integer) { Value = tempData.id_invoice }
                };

                // execute query and map the data to result
                DataTable dataTableDetailInvoice = CRUD.ExecuteQuery(query, sqlParams);
                foreach (DataRow rowDetail in dataTableDetailInvoice.Rows)
                {
                    tempData.total_harga = tempData.total_harga + (int)rowDetail["harga"];

                    //get category 
                    query = "SELECT * FROM Apelmusic.Courses Course JOIN Apelmusic.Categories Category ON Course.fk_id_category = Category.id_category WHERE id_course = @fk_id_course LIMIT 1";
                    sqlParams = new NpgsqlParameter[]
                    {
                    new NpgsqlParameter{ ParameterName = "@fk_id_course", NpgsqlDbType = NpgsqlDbType.Integer, Value = rowDetail["fk_id_course"] },
                    };
                    // execute query and map the data to result
                    DataTable category = CRUD.ExecuteQuery(query, sqlParams);
                    string nama_category = "";
                    string nama_course = "";

                    DateTime waktuCourse = (DateTime)rowDetail["waktu"];
                    string jadwal = waktuCourse.ToString("yyyy-MM-dd");

                    foreach (DataRow categoryRow in category.Rows)
                    {
                        nama_category = (string)categoryRow["nama_category"];
                        nama_course = (string)categoryRow["nama_course"];
                    }

                    tempData.detailInvoice.Add(new DetailInvoice { 
                        id_detail = (int)rowDetail["id_detail"],
                        fk_id_course_user = (int)rowDetail["fk_id_course_user"],
                        harga = (int)rowDetail["harga"],
                        nama_course = nama_course,
                        nama_category = nama_category,
                        waktu = jadwal,

                    });
                };

                result.Add(tempData);
            }
            #endregion

            return result;
        }

        public static List<Invoice> GetDetailInvoice(int? id_invoice)
        {
            List<Invoice> result = new List<Invoice>(); // initialisasi array kosong

            #region query process to database
            // handle query
            string query = "SELECT id_invoice, fk_id_user, fk_id_payment_method, no_invoice, tgl_invoice FROM Apelmusic.Invoice WHERE id_invoice = @id_invoice";

            // create sql params
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter("@id_invoice", NpgsqlDbType.Integer) { Value = id_invoice }
            };

            // execute query and map the data to result
            DataTable dataTable = CRUD.ExecuteQuery(query, sqlParams);

            foreach (DataRow row in dataTable.Rows)
            {
                DateTime waktu = (DateTime)row["tgl_invoice"];
                string tgl_invoice = waktu.ToString("yyyy-MM-dd");

                Invoice tempData = new Invoice
                {
                    id_invoice = (int)row["id_invoice"],
                    fk_id_user = (int)row["fk_id_user"],
                    fk_id_payment_method = (int)row["fk_id_payment_method"],
                    no_invoice = (int)row["no_invoice"],
                    tgl_invoice = tgl_invoice,
                    detailInvoice = new List<DetailInvoice>(),
                    total_harga = 0,
                };

                // select all task with id
                query = "SELECT * FROM Apelmusic.DetailInvoice DetailInvoice JOIN Apelmusic.CourseUser CourseUser ON DetailInvoice.fk_id_course_user = CourseUser.id_course_user WHERE fk_id_invoice = @fk_id_invoice";

                // create sql params
                sqlParams = new NpgsqlParameter[]
                {
                    new NpgsqlParameter("@fk_id_invoice", NpgsqlDbType.Integer) { Value = tempData.id_invoice }
                };

                // execute query and map the data to result
                DataTable dataTableDetailInvoice = CRUD.ExecuteQuery(query, sqlParams);
                foreach (DataRow rowDetail in dataTableDetailInvoice.Rows)
                {
                    tempData.total_harga = tempData.total_harga + (int)rowDetail["harga"];

                    //get category 
                    query = "SELECT * FROM Apelmusic.Courses Course JOIN Apelmusic.Categories Category ON Course.fk_id_category = Category.id_category WHERE id_course = @fk_id_course LIMIT 1";
                    sqlParams = new NpgsqlParameter[]
                    {
                    new NpgsqlParameter{ ParameterName = "@fk_id_course", NpgsqlDbType = NpgsqlDbType.Integer, Value = rowDetail["fk_id_course"] },
                    };
                    // execute query and map the data to result
                    DataTable category = CRUD.ExecuteQuery(query, sqlParams);
                    string nama_category = "";
                    string nama_course = "";

                    DateTime waktuCourse = (DateTime)rowDetail["waktu"];
                    string jadwal = waktuCourse.ToString("yyyy-MM-dd");

                    foreach (DataRow categoryRow in category.Rows)
                    {
                        nama_category = (string)categoryRow["nama_category"];
                        nama_course = (string)categoryRow["nama_course"];
                    }

                    tempData.detailInvoice.Add(new DetailInvoice
                    {
                        id_detail = (int)rowDetail["id_detail"],
                        fk_id_course_user = (int)rowDetail["fk_id_course_user"],
                        harga = (int)rowDetail["harga"],
                        nama_course = nama_course,
                        nama_category = nama_category,
                        waktu = jadwal,

                    });
                };

                result.Add(tempData);
            }
            #endregion

            return result;
        }
    }
}
