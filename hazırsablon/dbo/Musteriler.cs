namespace dbo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Musteriler")]
    public partial class Musteriler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Musteriler()
        {
            Mesajlar = new HashSet<Mesajlar>();
            Mesajlar1 = new HashSet<Mesajlar>();
            Urunler = new HashSet<Urunler>();
            tbl_siparisler2 = new HashSet<tbl_siparisler2>();
        }

        [Key]
        public int MusteriID { get; set; }

        [StringLength(100)]
        public string SirketAdi { get; set; }

        [StringLength(50)]
        public string Ad { get; set; }

        [StringLength(50)]
        public string Soyad { get; set; }

        [StringLength(100)]
        public string IletisimEmail { get; set; }

        public string Aciklama { get; set; }

        [StringLength(50)]
        public string OdemeTuru { get; set; }

        public DateTime? LisansYenilemeTarihi { get; set; }

        [StringLength(50)]
        public string LisansNumarasi { get; set; }

        [StringLength(50)]
        public string Sifre { get; set; }

        public int? YeniMesajSayisi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Mesajlar> Mesajlar { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Mesajlar> Mesajlar1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Urunler> Urunler { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_siparisler2> tbl_siparisler2 { get; set; }
    }
}
