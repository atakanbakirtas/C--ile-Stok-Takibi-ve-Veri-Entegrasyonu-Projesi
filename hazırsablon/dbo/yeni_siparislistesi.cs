namespace dbo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class yeni_siparislistesi
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int SiparişID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UrunID { get; set; }

        public int? MusteriID { get; set; }

        [StringLength(100)]
        public string UrunAdi { get; set; }

        public decimal? Fiyat { get; set; }

        public int? Ürün_adet { get; set; }

        [StringLength(100)]
        public string PlatformAdi { get; set; }

        public DateTime? Siparis_tarihi { get; set; }

        [StringLength(50)]
        public string Siparis_durumu { get; set; }

        public int? PlatformID { get; set; }

        public string Bilgiler { get; set; }
    }
}
