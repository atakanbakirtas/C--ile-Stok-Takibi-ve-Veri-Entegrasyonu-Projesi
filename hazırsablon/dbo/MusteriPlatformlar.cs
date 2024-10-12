namespace dbo
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MusteriPlatformlar")]
    public partial class MusteriPlatformlar
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MusteriPlatformlar()
        {
            tbl_siparisler2 = new HashSet<tbl_siparisler2>();
        }

        [Key]
        public int MusteriPlatformID { get; set; }

        public int? MusteriID { get; set; }

        public int? PlatformID { get; set; }

        public virtual Platformlar Platformlar { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_siparisler2> tbl_siparisler2 { get; set; }
    }
}
