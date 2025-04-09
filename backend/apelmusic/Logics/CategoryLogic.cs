using System.Data;
using System.Data.SqlClient;
using System.Net.NetworkInformation;
using System.Threading.Tasks;
using apelmusic.Models;
using apelmusic.Models;

namespace apelmusic.Logics
{
    public class CategoryLogic
    {
        private static string conString = "";

        public static void GetConfiguration(IConfiguration configuration)
        {
            conString = configuration["ConnectionStrings:Default"];
        }

        public static List<Category> GetCategory()
        {
            List<Category> result = new List<Category>(); // initialisasi array kosong

            #region query process to database
            // handle query
            string query = "SELECT * FROM Apelmusic.Categories";

            // execute query and map the data to result
            DataTable dataTable = CRUD.ExecuteQuery(query);

            foreach (DataRow row in dataTable.Rows)
            {
                Category tempData = new Category
                {
                    id_category = (int)row["id_category"],
                    nama_category = (string)row["nama_category"],
                    image_category = (string)row["image_category"],
                    cover_category = (string)row["cover_category"],
                    profesi_category = (string)row["profesi_category"],
                    deskripsi_category = (string)row["deskripsi_category"],
                };

                result.Add(tempData);
            }
            #endregion

            return result;
        }
    }
}
