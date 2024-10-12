namespace dbo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_siparisler2
    {
        [Key]
        public int SiparişID { get; set; }

        public int? Müsteri_id { get; set; }

        public int? Platform_id { get; set; }

        public int? Urün_id { get; set; }

        [StringLength(100)]
        public string Ürün_adı { get; set; }

        public int? Ürün_adet { get; set; }

        public decimal? Ürün_fiyat { get; set; }

        public DateTime? Siparis_tarihi { get; set; }

        public string Bilgiler { get; set; }

        [StringLength(50)]
        public string Siparis_durumu { get; set; }

        public virtual Musteriler Musteriler { get; set; }

        public virtual MusteriPlatformlar MusteriPlatformlar { get; set; }

        public virtual Urunler Urunler { get; set; }
    }
}
