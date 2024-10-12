namespace dbo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("viewsiparisler")]
    public partial class viewsiparisler
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Sipariş_No { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UrunID { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int müsteri_id { get; set; }

        [StringLength(100)]
        public string Ürün_Adı { get; set; }

        [Key]
        [Column(Order = 3)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Platform_id { get; set; }

        [StringLength(100)]
        public string platform_Adı { get; set; }

        [StringLength(100)]
        public string Bilgiler { get; set; }

        public DateTime? tarih { get; set; }

        [StringLength(50)]
        public string Durum { get; set; }
    }
}
