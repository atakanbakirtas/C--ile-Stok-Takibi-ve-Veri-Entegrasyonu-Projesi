namespace dbo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Mesajlar")]
    public partial class Mesajlar
    {
        [Key]
        public int MesajID { get; set; }

        public int GondericiID { get; set; }

        public int AliciID { get; set; }

        [Required]
        [StringLength(100)]
        public string Konu { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Icerik { get; set; }

        public DateTime GeldigiTarih { get; set; }

        public bool OkunduMu { get; set; }

        public virtual Musteriler Musteriler { get; set; }

        public virtual Musteriler Musteriler1 { get; set; }
    }
}
