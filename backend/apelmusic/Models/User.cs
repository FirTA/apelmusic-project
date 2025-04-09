using System.Security.Principal;

namespace apelmusic.Models
{
    public class User
    {
        public int id_user { get; set; }
        public string nama_user { get; set; }
        public string email{ get; set; }
        public string password { get; set; }
    }

    public class Login
    {
        public string email { get; set; }
        public string password { get; set; }
    }

    public class ResetUserPassword
    {
        public string token { get; set; }
        public string password { get; set; }
    }

    //untuk menampilkan user admin
    public class Admin
    {
        public int? id_user { get; set; }
        public string? nama_user { get; set; }
        public string? email { get; set; }
        public bool? status { get; set; }
        public string? password { get; set; }
    }
    
    public class UserOutputLogin
    {
        public int id_user { get; set; }
        public string nama_user { get; set; }
        public string email { get; set; }
        public string role { get; set; }
        public string token { get; set; }
    }

    public class Email
    {
        public string email { get; set; }
    }

    public class Token
    {
        public string token{ get; set; }
    }

}
