namespace dbo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Platformlar")]
    public partial class Platformlar
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Platformlar()
        {
            MusteriPlatformlar = new HashSet<MusteriPlatformlar>();
        }

        [Key]
        public int PlatformID { get; set; }

        [StringLength(100)]
        public string PlatformAdi { get; set; }

        [StringLength(255)]
        public string LogoUrl { get; set; }

        public int? NotificationCount { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MusteriPlatformlar> MusteriPlatformlar { get; set; }
    }
}
