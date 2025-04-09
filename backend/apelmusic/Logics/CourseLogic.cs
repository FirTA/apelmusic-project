using apelmusic.Models;
using apelmusic.Models;
using Microsoft.AspNetCore.Identity;
using Npgsql;
using NpgsqlTypes;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace apelmusic.Logics
{
    public class CourseLogic
    {
        private static string conString = "";

        public static void GetConfiguration(IConfiguration configuration)
        {
            conString = configuration["ConnectionStrings:Default"];
        }

        public static List<Course> GetCourse()
        {
            List<Course> result = new List<Course>(); // initialisasi array kosong

            #region query process to database
            // handle query
            string query = "SELECT id_course, fk_id_category, nama_course, harga, image_course, deskripsi_course, nama_category, favorit FROM " +
                "Apelmusic.Courses Course JOIN Apelmusic.Categories Category ON Course.fk_id_category = Category.id_category";

            // execute query and map the data to result
            DataTable dataTable = CRUD.ExecuteQuery(query);

            foreach (DataRow row in dataTable.Rows)
            {
                Course tempData = new Course
                {
                    id_course = (int)row["id_course"],
                    fk_id_category = (int)row["fk_id_category"],
                    nama_category = (string)row["nama_category"],
                    nama_course = (string)row["nama_course"],
                    harga = (decimal)row["harga"],
                    image_course = (string)row["image_course"],
                    deskripsi_course = (string)row["deskripsi_course"],
                    favorit = (bool)row["favorit"],
                };

                result.Add(tempData);
            }
            #endregion

            return result;
        }

        public static List<CourseUser> GetCourseUser(int id_user)
        {
            List<CourseUser> result = new List<CourseUser>(); // initialisasi array kosong

            #region query process to database
            // handle query
            string query = "SELECT id_course_user, fk_id_course, fk_id_category, fk_id_user, nama_course, image_course, waktu, status FROM " +
                "Apelmusic.Courses Course JOIN Apelmusic.CourseUser CourseUser ON Course.id_course = CourseUser.fk_id_course WHERE fk_id_user = @id_user AND status != 'cart'";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter{ ParameterName = "@id_user", NpgsqlDbType = NpgsqlDbType.Integer, Value = id_user },
            };
            // execute query and map the data to result
            DataTable dataTable = CRUD.ExecuteQuery(query, sqlParams);

            foreach (DataRow row in dataTable.Rows)
            {
                DateTime waktu = (DateTime)row["waktu"];
                string waktuStr = waktu.ToString("yyyy-MM-dd");

                query = "SELECT nama_category FROM Apelmusic.Categories WHERE id_category = @fk_id_category LIMIT 1";
                sqlParams = new NpgsqlParameter[]
                {
                    new NpgsqlParameter{ ParameterName = "@fk_id_category", NpgsqlDbType = NpgsqlDbType.Integer, Value = row["fk_id_category"] },
                };
                // execute query and map the data to result
                DataTable category = CRUD.ExecuteQuery(query, sqlParams);
                string nama_category = "";
                foreach (DataRow categoryRow in category.Rows)
                {
                    nama_category = (string)categoryRow["nama_category"];
                }

                CourseUser tempData = new CourseUser
                {
                    id_course_user = (int)row["id_course_user"],
                    fk_id_course = (int)row["fk_id_course"],
                    fk_id_user = (int)row["fk_id_user"],
                    nama_course = (string)row["nama_course"],
                    image_course = (string)row["image_course"],
                    nama_category = nama_category,
                    waktu = (string)waktuStr,
                    status = (string)row["status"],
                };

                result.Add(tempData);
            }
            #endregion

            return result;
        }

        public static List<CourseUser> GetCartUser(int id_user)
        {
            List<CourseUser> result = new List<CourseUser>(); // initialisasi array kosong

            #region query process to database
            // handle query
            string query = "SELECT id_course_user, fk_id_course, fk_id_category, fk_id_user, nama_course, image_course, waktu, status, checked, harga FROM apelmusic.courses Course JOIN apelmusic.CourseUser CourseUser ON Course.id_course = CourseUser.fk_id_course WHERE fk_id_user = @id_user AND status = 'cart'";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter{ ParameterName = "@id_user", NpgsqlDbType = NpgsqlDbType.Integer, Value = id_user },
            };
            // execute query and map the data to result
            DataTable dataTable = CRUD.ExecuteQuery(query, sqlParams);

            foreach (DataRow row in dataTable.Rows)
            {
                DateTime waktu = (DateTime)row["waktu"];
                string waktuStr = waktu.ToString("yyyy-MM-dd");
                

                query = "SELECT nama_category FROM Apelmusic.Categories WHERE id_category = @fk_id_category LIMIT 1";
                sqlParams = new NpgsqlParameter[]
                {
                    new NpgsqlParameter{ ParameterName = "@fk_id_category", NpgsqlDbType = NpgsqlDbType.Integer, Value = row["fk_id_category"] },
                };
                // execute query and map the data to result
                DataTable category = CRUD.ExecuteQuery(query, sqlParams);
                string nama_category = "";
                foreach (DataRow categoryRow in category.Rows)
                {
                    nama_category = (string)categoryRow["nama_category"];
                }

                CourseUser tempData = new CourseUser
                {
                    id_course_user = (int)row["id_course_user"],
                    fk_id_course = (int)row["fk_id_course"],
                    fk_id_user = (int)row["fk_id_user"],
                    harga = (int?)(decimal)row["harga"],
                    nama_course = (string)row["nama_course"],
                    image_course = (string)row["image_course"],
                    nama_category = nama_category,
                    waktu = (string)waktuStr,
                    status = (string)row["status"],
                    check = (bool)row["checked"],
                };

                result.Add(tempData);
            }
            #endregion

            return result;
        }

        public static void InsertCourseUser(CourseUser course)
        {
            string query = "INSERT INTO Apelmusic.CourseUser (fk_id_course, fk_id_user, waktu, checked, status) VALUES (@fk_id_course, @fk_id_user, @waktu, @check,@status)";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter{ ParameterName = "@fk_id_course", NpgsqlDbType = NpgsqlDbType.Integer, Value = course.fk_id_course },
                new NpgsqlParameter{ ParameterName = "@fk_id_user", NpgsqlDbType = NpgsqlDbType.Integer, Value = course.fk_id_user },
                new NpgsqlParameter{ ParameterName = "@waktu", NpgsqlDbType = NpgsqlDbType.Date, Value = Convert.ToDateTime(course.waktu) },
                new NpgsqlParameter{ ParameterName = "@check", NpgsqlDbType = NpgsqlDbType.Boolean, Value = course.check },
                new NpgsqlParameter{ ParameterName = "@status", NpgsqlDbType = NpgsqlDbType.Varchar, Value = "cart"},
            };

            CRUD.ExecuteNonQuery(query, sqlParams); // ExecuteNonQuery untuk query yang tidak return apa-apa
        }

        public static void DeleteCourseUser(int id_course_user)
        {
            string query = "DELETE FROM apelmusic.CourseUser WHERE id_course_user = @id_course_user";

            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter("@id_course_user", NpgsqlDbType.Integer) { Value = id_course_user },
            };

            CRUD.ExecuteNonQuery(query, sqlParams); // ExecuteNonQuery untuk query yang tidak return apa-apa
        }

        public static void ChangeCheckedCourseUser(int id_course_user, CourseUser course)
        {
            bool check = false;
            if (course.check == true)
            {
                check = true;
            }

            string query = "UPDATE Apelmusic.CourseUser SET checked = @check WHERE id_course_user = @id_course_user";

            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter("@id_course_user", NpgsqlDbType.Integer) { Value = id_course_user },
                new NpgsqlParameter("@check", NpgsqlDbType.Bit) { Value = check }
            };

            CRUD.ExecuteNonQuery(query, sqlParams); // ExecuteNonQuery untuk query yang tidak return apa-apa
        }
    }
}
