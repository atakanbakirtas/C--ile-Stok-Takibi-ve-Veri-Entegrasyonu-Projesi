namespace dbo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class müsteriplatformadıları
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MusteriPlatformID { get; set; }

        public int? MusteriID { get; set; }

        public int? PlatformID { get; set; }

        [StringLength(100)]
        public string PlatformAdi { get; set; }
    }
}
