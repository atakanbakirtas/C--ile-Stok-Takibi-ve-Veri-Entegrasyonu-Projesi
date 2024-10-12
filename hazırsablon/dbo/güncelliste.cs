namespace dbo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class güncelliste
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UrunID { get; set; }

        [StringLength(100)]
        public string UrunAd { get; set; }

        public decimal? Fiyat { get; set; }

        public int? StokMiktari { get; set; }

        public string Aciklama { get; set; }

        [StringLength(100)]
        public string KategoriAd { get; set; }

        [StringLength(100)]
        public string PlatformAdı { get; set; }

        [StringLength(255)]
        public string ResimURL { get; set; }

        public int? PlatformId { get; set; }

        public int? MusteriID { get; set; }

        public int? KategoriID { get; set; }
    }
}
