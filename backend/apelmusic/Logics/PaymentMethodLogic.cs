using apelmusic.Models;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using NpgsqlTypes;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace apelmusic.Logics
{
    public class PaymentMethodLogic
    {
        private static string conString = "";

        public static void GetConfiguration(IConfiguration configuration)
        {
            conString = configuration["ConnectionStrings:Default"];
        }

        public static List<PaymentMethod> GetPayment()
        {
            List<PaymentMethod> result = new List<PaymentMethod>(); // initialisasi array kosong

            #region query process to database
            // handle query
            string query = "SELECT id_payment_method, nama, logo, status FROM apelmusic.PaymentMethod ORDER BY nama ASC";

            // execute query and map the data to result
            DataTable dataTable = CRUD.ExecuteQuery(query);

            foreach (DataRow row in dataTable.Rows)
            {
                PaymentMethod tempData = new PaymentMethod
                {
                    id_payment_method = (int)row["id_payment_method"],
                    nama = (string)row["nama"],
                    logo = (string)row["logo"],
                    status = (bool)row["status"]
                };

                result.Add(tempData);
            }
            #endregion

            return result;
        }

        public static void InsertPayment(PaymentMethod payment)
        {
            string query = "INSERT INTO apelmusic.PaymentMethod(nama, logo) VALUES (@nama, @logo)";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter{ ParameterName = "@nama", NpgsqlDbType = NpgsqlDbType.Varchar, Value = payment.nama },
                new NpgsqlParameter{ ParameterName = "@logo", NpgsqlDbType = NpgsqlDbType.Varchar, Value = payment.logo },
            };

            CRUD.ExecuteNonQuery(query, sqlParams); // ExecuteNonQuery untuk query yang tidak return apa-apa
        }

        public static void ChangeStatusPayment(int id_payment_method, PaymentMethod payment)
        {
            bool status = false;
            if(payment.status == true)
            {
                status = true;
            }

            string query = "UPDATE apelmusic.PaymentMethod SET status = @status WHERE id_payment_method = @id_payment_method";

            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter("@id_payment_method", NpgsqlDbType.Integer) { Value = id_payment_method },
                new NpgsqlParameter("@status", NpgsqlDbType.Bit) { Value = status },
            };

            CRUD.ExecuteNonQuery(query, sqlParams); // ExecuteNonQuery untuk query yang tidak return apa-apa
        }

        public static void UpdatePayment(int id_payment_method, PaymentMethod payment)
        {
            string query = "UPDATE apelmusic.PaymentMethod SET nama = @nama, logo = @logo WHERE id_payment_method = @id_payment_method";

            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter("@id_payment_method", NpgsqlDbType.Integer) { Value = id_payment_method },
                new NpgsqlParameter("@nama", NpgsqlDbType.Varchar) { Value = payment.nama },
                new NpgsqlParameter("@logo", NpgsqlDbType.Varchar) { Value = payment.logo ?? "" },
            };

            CRUD.ExecuteNonQuery(query, sqlParams); // ExecuteNonQuery untuk query yang tidak return apa-apa
        }
    }
}
