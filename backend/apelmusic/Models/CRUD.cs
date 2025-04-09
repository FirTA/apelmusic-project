using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using Npgsql;

namespace apelmusic.Models
{
    public class CRUD
    {
        private static string conString = "";

        public static void GetConfiguration(IConfiguration configuration)
        {
            conString = configuration["ConnectionStrings:Default"];
        }

        #region ExecuteQuery
        /// <summary>
        /// ExecuteQuery untuk menjalankan query yang return banyak data
        /// </summary>
        public static DataTable ExecuteQuery(string query, NpgsqlParameter[] sqlParams = null)
        {
            DataTable result = new DataTable();

            // begin connection
            using (NpgsqlConnection con = new NpgsqlConnection(conString))
            {
                con.Open();

                #region query process to database
                using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                {
                    if (sqlParams != null) cmd.Parameters.AddRange(sqlParams);

                    // mengisi dengan SqlDataAdapter
                    NpgsqlDataAdapter adapter = new NpgsqlDataAdapter(cmd);
                    adapter.Fill(result);
                }
                #endregion

                // close connection
                con.Close();
            }

            return result;
        }
        #endregion

        #region ExecuteScalar
        /// <summary>
        /// ExecuteScalar untuk menjalankan query yang hanya return tepat 1 data
        /// </summary>
        public static object ExecuteScalar(string query, NpgsqlParameter[] sqlParams = null)
        {
            object result = null;

            // begin connection
            using (NpgsqlConnection con = new NpgsqlConnection(conString))
            {
                con.Open();

                #region query process to database
                using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                {
                    if (sqlParams != null) cmd.Parameters.AddRange(sqlParams);
                    result = cmd.ExecuteScalar(); // ExecuteScalar untuk query yang return tepat 1 data saja
                }
                #endregion

                // close connection
                con.Close();
            }

            return result;
        }
        #endregion

        #region ExecuteNonQuery
        /// <summary>
        /// ExecuteNonQuery untuk menjalankan query yang tidak return apa-apa
        /// </summary>
        public static int ExecuteNonQuery(string query, NpgsqlParameter[] sqlParams = null)
        {
            int result = 0;

            // begin connection
            using (NpgsqlConnection con = new NpgsqlConnection(conString))
            {
                con.Open();

                #region query process to database
                using (NpgsqlCommand cmd = new NpgsqlCommand(query, con))
                {
                    if (sqlParams != null) cmd.Parameters.AddRange(sqlParams);
                    result = cmd.ExecuteNonQuery(); // ExecuteNonQuery untuk query yang tidak return apa-apa
                }
                #endregion

                // close connection
                con.Close();
            }

            return result;
        }
        #endregion

    }
}
