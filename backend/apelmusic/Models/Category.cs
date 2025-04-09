using static System.Net.Mime.MediaTypeNames;
using System.Security.Principal;

namespace apelmusic.Models
{
    public class Category
    {
        public int id_category { 
            get; set; }
        public string nama_category { get; set; }
        public string image_category { get; set; }
        public string cover_category { get; set; }
        public string profesi_category { get; set; }
        public string deskripsi_category { get; set; }
    }
}
