namespace dbo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Urunler")]
    public partial class Urunler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Urunler()
        {
            tbl_siparisler2 = new HashSet<tbl_siparisler2>();
        }

        [Key]
        public int UrunID { get; set; }

        [StringLength(100)]
        public string UrunAdi { get; set; }

        public string Aciklama { get; set; }

        public decimal? Fiyat { get; set; }

        public int? KategoriID { get; set; }

        public int? MusteriID { get; set; }

        public int? StokMiktari { get; set; }

        public int? PlatformId { get; set; }

        [StringLength(255)]
        public string ResimURL { get; set; }

        public virtual Kategoriler Kategoriler { get; set; }

        public virtual Musteriler Musteriler { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_siparisler2> tbl_siparisler2 { get; set; }
    }
}
