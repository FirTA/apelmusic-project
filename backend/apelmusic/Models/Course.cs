namespace apelmusic.Models
{
    public class Course
    {
        public int id_course { get; set; }
        public int fk_id_category { get; set; }
        public string nama_course { get; set; }
        public string nama_category { get; set; }
        public decimal harga { get; set; }
        public string image_course { get; set; }
        public string deskripsi_course { get; set; }
        public bool favorit { get; set; }
    }

    public class CourseUser
    {
        public int id_course_user { get; set; }
        public int fk_id_course { get; set; }
        public int fk_id_user { get; set; }
        public int? harga { get; set; }
        public string? waktu { get; set; }
        public string? nama_course { get; set; }
        public string? image_course { get; set; }
        public string? nama_category { get; set; }
        public string? status { get; set; }
        public bool? check { get; set; }
    }

    //public class KelasKu
    //{
    //    public int fk_id_course { get; set; }
    //    public int fk_id_course { get; set; }
    //    public int fk_id_user { get; set; }
    //    public string waktu { get; set; }
    //    public string nama_course { get; set; }
    //    public string image_course { get; set; }

    //}
}
