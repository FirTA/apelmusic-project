using System.Threading.Tasks;

namespace apelmusic.Models
{
    public class Invoice
    {
        public int id_invoice { get; set; }
        public int fk_id_user { get; set; }
        public int fk_id_payment_method { get; set; }
        public int? no_invoice { get; set; }
        public string tgl_invoice { get; set; }
        public int? total_harga { get; set; }
        public List<DetailInvoice>? detailInvoice { get; set; }

    }

    public class DetailInvoice
    {
        public int id_detail { get; set; }
        public int fk_id_invoice { get; set; }
        public int fk_id_course_user { get; set; }
        public int harga { get; set; }
        public string? nama_course { get; set; }
        public string? nama_category { get; set; }
        public string? waktu { get; set; }
    }

    public class insertInvoice
    {
        public int fk_id_user { get; set; }
        public int fk_id_payment_method { get; set; }
        public string tgl_invoice { get; set; }
        public List<int> fk_id_course_user { get; set; }
        public List<int> harga { get; set; }
    }
}
