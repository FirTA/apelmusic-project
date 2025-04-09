using apelmusic.Models;
using System.Data.SqlClient;
using System.Data;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;
using Npgsql;
using NpgsqlTypes;

namespace apelmusic.Logics
{
    public class UserLogic
    {
        #region config FrontURL
        private static string FrontUrl = "";
        public static void GetConfiguration(IConfiguration configuration)
        {
            FrontUrl = configuration["FrontUrl"];
        }
        #endregion

        #region registrasi user
        public static void regisUser(User user)
        {
            // create hash
            byte[] passwordHash = Array.Empty<byte>();
            byte[] passwordSalt = Array.Empty<byte>();

            
            CryptoLogic.GenerateHash(user.password, out passwordHash, out passwordSalt); 


            string query = @"INSERT INTO apelmusic.user(
                        nama_user, email, role, password_salt, password_hash)
                        VALUES(@nama_user, @email, @role, @password_salt, @password_hash)";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter{ParameterName="@nama_user", NpgsqlDbType = NpgsqlDbType.Varchar, Value = user.nama_user },
            new NpgsqlParameter("@email", NpgsqlDbType.Varchar) { Value = user.email },
            new NpgsqlParameter("@role", NpgsqlDbType.Varchar) { Value = "peserta" },
            new NpgsqlParameter("@password_hash", NpgsqlDbType.Bytea) { Value = passwordHash },
            new NpgsqlParameter("@password_salt", NpgsqlDbType.Bytea) { Value = passwordSalt }
            };
            CRUD.ExecuteNonQuery(query, sqlParams);

            string token = Guid.NewGuid().ToString();
            query = @"INSERT 
                    INTO apelmusic.Token(token, expire_date, usage_type, email) 
                    VALUES (@token, null, @usage_type, @email)";
            sqlParams = new NpgsqlParameter[]
                {
                    new NpgsqlParameter("@token", SqlDbType.VarChar) { Value = token },
                    
                    new NpgsqlParameter("@usage_type", SqlDbType.VarChar) { Value = "register" },
                    new NpgsqlParameter("@email", SqlDbType.VarChar) { Value = user.email ?? "" },
                };
            CRUD.ExecuteNonQuery(query, sqlParams);

            string emailTo = user.email ?? "";
            string emailSubject = "Account activation";
            string verificationUrl = FrontUrl + "/emailconfirmsuccess/" + token;
            string emailBody = @$"<div><h4 style='text-align:center'><b>Welcome to apelmusic</b></h3>
                        <p>Please click <a href='{verificationUrl}'>{verificationUrl}</a> to activate your accout.</p>
                        </div>";
            EmailLogic.SendEmail(emailTo, emailSubject, emailBody);
        }

        public static List<Admin> GetAdmin()
        {
            List<Admin> result = new List<Admin>(); // initialisasi array kosong

            #region query process to database
            // handle query
            string query = "SELECT * FROM apelmusic.user WHERE [role] = 'admin' ORDER BY nama_user ASC";

            // execute query and map the data to result
            DataTable dataTable = CRUD.ExecuteQuery(query);

            foreach (DataRow row in dataTable.Rows)
            {
                Admin tempData = new Admin
                {
                    id_user = (int)row["id_user"],
                    nama_user = (string)row["nama_user"],
                    email = (string)row["email"],
                    status = (bool)row["status"]
                };

                result.Add(tempData);
            }
            #endregion

            return result;
        }

        public static void InsertAdmin(Admin user)
        {
            // create hash
            byte[] passwordHash = Array.Empty<byte>();
            byte[] passwordSalt = Array.Empty<byte>();


            CryptoLogic.GenerateHash(user.password, out passwordHash, out passwordSalt);


            string query = @"INSERT INTO apelmusic.user(
                        nama_user, email, password_salt, password_hash, role, status)
                        VALUES(@nama_user, @email, @password_salt, @password_hash, @role, @status)";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter{ParameterName="@nama_user", NpgsqlDbType = NpgsqlDbType.Varchar, Value = user.nama_user },
                new NpgsqlParameter("@email", NpgsqlDbType.Varchar) { Value = user.email },
                new NpgsqlParameter("@password_hash", NpgsqlDbType.Bytea) { Value = passwordHash },
                new NpgsqlParameter("@password_salt", NpgsqlDbType.Bytea) { Value = passwordSalt },
                new NpgsqlParameter("@role", NpgsqlDbType.Varchar) { Value = "admin" },
                new NpgsqlParameter("@status", NpgsqlDbType.Bit) { Value = 1 },
            };
            CRUD.ExecuteNonQuery(query, sqlParams);
        }

        public static void ChangeStatusAdmin(int id_user, Admin user)
        {
            bool status = false;
            if (user.status == true)
            {
                status = true;
            }

            string query = "UPDATE apelmusic.user SET [status] = @status WHERE id_user = @id_user";

            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                new NpgsqlParameter("@id_user", NpgsqlDbType.Integer) { Value = id_user },
                new NpgsqlParameter("@status", NpgsqlDbType.Bit) { Value = status }
            };

            CRUD.ExecuteNonQuery(query, sqlParams); // ExecuteNonQuery untuk query yang tidak return apa-apa
        }

        public static void UpdateAdmin(int id_user, Admin user)
        {
            string query = "";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[] { };

            if (user.password != "")
            {
                // create hash
                byte[] passwordHash = Array.Empty<byte>();
                byte[] passwordSalt = Array.Empty<byte>();

                CryptoLogic.GenerateHash(user.password, out passwordHash, out passwordSalt);

                query = @"UPDATE apelmusic.user SET
                            nama_user = @nama_user, email = @email, password_salt = @password_salt, password_hash = @password_hash WHERE id_user = @id_user";

                sqlParams = new NpgsqlParameter[]
                {
                    new NpgsqlParameter("@id_user", NpgsqlDbType.Integer) { Value = id_user },
                    new NpgsqlParameter("@nama_user", NpgsqlDbType.Varchar) { Value = user.nama_user},
                    new NpgsqlParameter("@email", NpgsqlDbType.Varchar) { Value = user.email },
                    new NpgsqlParameter("@password_hash", NpgsqlDbType.Bytea) { Value = passwordHash },
                    new NpgsqlParameter("@password_salt", NpgsqlDbType.Bytea) { Value = passwordSalt },
                };

            } else
            {
                query = @"UPDATE apelmusic.user SET nama_user = @nama_user, email = @email WHERE id_user = @id_user";

                sqlParams = new NpgsqlParameter[]
                {
                    new NpgsqlParameter("@id_user", NpgsqlDbType.Integer) { Value = id_user },
                    new NpgsqlParameter("@nama_user", NpgsqlDbType.Varchar) { Value = user.nama_user},
                    new NpgsqlParameter("@email", NpgsqlDbType.Varchar) { Value = user.email },
                };
            }

            CRUD.ExecuteNonQuery(query, sqlParams); // ExecuteNonQuery untuk query yang tidak return apa-apa
        }

        #endregion

        #region check email reset
        
        public static bool checkemailreset(Email user)
        {
            string query = "SELECT email FROM apelmusic.user WHERE email = @email LIMIT 1";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                    new NpgsqlParameter("@email", NpgsqlDbType.Varchar){Value = user.email }
            };

            object emailObj = CRUD.ExecuteScalar(query, sqlParams);
            string isEmail = emailObj == DBNull.Value ? "" : (string)emailObj;
            
            if (String.IsNullOrEmpty(isEmail))
            {
                return false;
            }

            #region check account is activate
            query = "SELECT * FROM apelmusic.user WHERE email = @email LIMIT 1";
            sqlParams = new NpgsqlParameter[]
            {
                    new NpgsqlParameter("@email", NpgsqlDbType.Varchar){Value = user.email ?? ""}
            };

            DataTable userTable = CRUD.ExecuteQuery(query, sqlParams);

            if (userTable.Rows.Count == 0)
            {
                throw new Exception("Email tidak terdaftar");
            }

            bool isActive = false;
            foreach (DataRow userRow in userTable.Rows)
            {

                isActive = (bool)userRow["status"];
            }

            if (isActive == false)
            {
                throw new Exception("Akun belum diaktivasi");
            }
            #endregion


            #region update isReset
            query = "UPDATE apelmusic.user SET isReset=1 WHERE email=@email;";
            sqlParams = new NpgsqlParameter[]
            {
                    new NpgsqlParameter("@email", NpgsqlDbType.Varchar) { Value = user.email },
            };
            CRUD.ExecuteNonQuery(query, sqlParams);

            #endregion


            #region send email token
            string token = Guid.NewGuid().ToString();
            query = @"INSERT 
                    INTO apelmusic.Token(token, expire_date, usage_type, email) 
                    VALUES (@token, null, @usage_type, @email)";
            sqlParams = new NpgsqlParameter[]
                {
                    new NpgsqlParameter("@token", NpgsqlDbType.Varchar) { Value = token },

                    new NpgsqlParameter("@usage_type", NpgsqlDbType.Varchar) { Value = "reset_password" },
                    new NpgsqlParameter("@email", NpgsqlDbType.Varchar) { Value = user.email ?? "" },
                };
            CRUD.ExecuteNonQuery(query, sqlParams);

            string emailTo = user.email ?? "";
            string emailSubject = "Reset Password";
            string verificationUrl = FrontUrl + "/resetpassword-newpass/" + token;
            string emailBody = @$"<div><h4 style='text-align:center'><b>Welcome to apelmusic</b></h3>
                        <p>Please click <a href='{verificationUrl}'>{verificationUrl}</a> to reset your password.</p>
                        </div>";
            EmailLogic.SendEmail(emailTo, emailSubject, emailBody);

            #endregion

            return true;
            
        }

        public static bool checkemail(Email user)
        {
            string query = "SELECT email FROM apelmusic.user WHERE email = @email LIMIT 1";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                    new NpgsqlParameter("@email", NpgsqlDbType.Varchar){Value = user.email }
            };

            object emailObj = CRUD.ExecuteScalar(query, sqlParams);
            string isEmail = emailObj == DBNull.Value ? "" : (string)emailObj;

            if (String.IsNullOrEmpty(isEmail))
            {
                return false;
            }
            return true;
        }

        #endregion

        #region login user
        public static UserOutputLogin login(Login user)
        {
            if (String.IsNullOrEmpty(user.email))
            {
                throw new Exception("Email tidak boleh kosong");
            }
            if (String.IsNullOrEmpty(user.password))
            {
                throw new Exception("Password tidak boleh kosong");
            }


            string query = "SELECT * FROM apelmusic.User WHERE email = @email LIMIT 1";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                    new NpgsqlParameter("@email", NpgsqlDbType.Varchar){Value = user.email ?? ""}
            };

            DataTable userTable = CRUD.ExecuteQuery(query, sqlParams);

            if (userTable.Rows.Count == 0)
            {
                throw new Exception("Email tidak terdaftar");
            }

            bool isActive = false;
            string nama_user = "";
            string role = "";
            int id_user = 0;
            byte[] passwordHash = Array.Empty<byte>();
            byte[] passwordSalt = Array.Empty<byte>();
            foreach (DataRow userRow in userTable.Rows)
            {
                id_user = (int)userRow["id_user"];
                nama_user = (string)userRow["nama_user"];
                role = (string)userRow["role"];
                passwordHash = userRow["password_hash"] == DBNull.Value ? Array.Empty<byte>() : (byte[])userRow["password_hash"];
                passwordSalt = userRow["password_salt"] == DBNull.Value ? Array.Empty<byte>() : (byte[])userRow["password_salt"];
                isActive = (bool)userRow["status"];
            }

            if (isActive == false)
            {
                throw new Exception("Akun belum diaktivasi");
            }
            bool isPasswordValid = CryptoLogic.CompareStringVsHash(user.password, passwordHash, passwordSalt);
            /*if (isPasswordValid == false)
            {
                throw new Exception("Wrong Password");
            }*/


            // create jwt token
            string jwtToken = JwtLogic.GenerateJwtToken(new[]
            {
                    new Claim("nama_user", nama_user ?? ""),
                    new Claim("email", user.email ?? ""),
                    new Claim(ClaimTypes.Role, role ?? "")
            });

            // return output data untuk consume di frontend
            if (isPasswordValid)
            {
                UserOutputLogin userOutput = new UserOutputLogin();
                userOutput.token = jwtToken;
                userOutput.nama_user = nama_user;
                userOutput.email = user.email;
                userOutput.role = role;
                userOutput.id_user = id_user;
                return userOutput;
            }
            else
            {
                throw new Exception("Salah password");
            }
        }
        #endregion


        #region aktivasi user
        public static void activateUser(string token)
        {
            string query = "SELECT email FROM apelmusic.Token WHERE token = @token LIMIT 1";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                    new NpgsqlParameter("@token", NpgsqlDbType.Varchar){Value = token ?? ""}
            };

            object emailObj = CRUD.ExecuteScalar(query, sqlParams);
            string email = emailObj == DBNull.Value ? "" : (string)emailObj;
            if (String.IsNullOrEmpty(email))
            {
                throw new Exception("Cannot activate the user, either the user is already active, or the user is not found");
            }

            // activate the user
            query = "UPDATE apelmusic.user SET status=1 WHERE email=@email;";
            sqlParams = new NpgsqlParameter[]
            {
                    new NpgsqlParameter("@email", NpgsqlDbType.Varchar) { Value = email },
            };
            CRUD.ExecuteNonQuery(query, sqlParams);
        }
        #endregion

        #region reset password user
        public static void resetPassword(ResetUserPassword user)
        {

            string query = "SELECT email FROM Apelmusic.Token WHERE token = @token LIMIT 1";
            NpgsqlParameter[] sqlParams = new NpgsqlParameter[]
            {
                    new NpgsqlParameter("@token", NpgsqlDbType.Varchar){Value = user.token ?? ""}
            };

            object emailObj = CRUD.ExecuteScalar(query, sqlParams);
            string email = emailObj == DBNull.Value ? "" : (string)emailObj;


            byte[] passwordHash = Array.Empty<byte>();
            byte[] passwordSalt = Array.Empty<byte>();


            CryptoLogic.GenerateHash(user.password, out passwordHash, out passwordSalt);

            query = "UPDATE Apelmusic.user SET password_hash=@passwordHash, password_salt=@passwordSalt, isreset=0 WHERE email=@email;";
            sqlParams = new NpgsqlParameter[]
            {
                    new NpgsqlParameter("@passwordHash", NpgsqlDbType.Bytea) { Value = passwordHash },
                    new NpgsqlParameter("@passwordSalt", NpgsqlDbType.Bytea) { Value = passwordSalt },
                    new NpgsqlParameter("@email", NpgsqlDbType.Varchar) { Value = email },
            };
            CRUD.ExecuteNonQuery(query, sqlParams);
        }
        #endregion

        #region tokenidentity
        
        public static UserOutputLogin tokenidentity(Token token)
        {
            IEnumerable<Claim> ClaimData = JwtLogic.ValidateJwtToken(token.token);
            //String name = ClaimData.FirstOrDefault(x => x.Type == "name")?.Value;

            if (ClaimData == null)
            {
                throw new Exception("token not valid");
            }

            var output = new UserOutputLogin
            {
                email = ClaimData.FirstOrDefault(x => x.Type == "email")?.Value,
                nama_user = ClaimData.FirstOrDefault(x => x.Type == "nama_user")?.Value,
                role = ClaimData.FirstOrDefault(x => x.Type == "role")?.Value

            };

            // create jwt token
            string jwtToken = JwtLogic.GenerateJwtToken(new[]
            {
                    new Claim("email", output.email ?? ""),
                    new Claim("nama_user", output.nama_user ?? ""),
                    new Claim("role", output.role ?? ""),

                });


            //change this to create new access token
            output.token = jwtToken;

            return output;
        }
        #endregion
    }
}
