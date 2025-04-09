using System.Security.Cryptography;
using System.Text;

namespace apelmusic.Logics
{
    public static class CryptoLogic
    {
        public static (byte[] hash, byte[] salt) GenerateHash(string passwordString)
        {
            // hash menggunakan algoritma HMAC
            using (var hmac = new HMACSHA512())
            {
                // prepare key and hash
                byte[] passwordSalt = hmac.Key;
                byte[] passwordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(passwordString));
                return (passwordHash, passwordSalt);
            }
        }

        public static void GenerateHash(string passwordString, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(passwordString));
            }
        }

        public static bool CompareStringVsHash(string passwordString, byte[] passwordHash, byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512(passwordSalt))
            {
                byte[] newPassword = hmac.ComputeHash(Encoding.UTF8.GetBytes(passwordString));
                return newPassword.SequenceEqual(passwordHash);
            }
        }

    }
}

