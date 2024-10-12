using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace dbo
{
    public partial class modelyeni : DbContext
    {
        public modelyeni()
            : base("name=modelyeni1")
        {
        }

        public virtual DbSet<Kategoriler> Kategoriler { get; set; }
        public virtual DbSet<Mesajlar> Mesajlar { get; set; }
        public virtual DbSet<Musteriler> Musteriler { get; set; }
        public virtual DbSet<MusteriPlatformlar> MusteriPlatformlar { get; set; }
        public virtual DbSet<Platformlar> Platformlar { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<tbl_siparisler2> tbl_siparisler2 { get; set; }
        public virtual DbSet<Urunler> Urunler { get; set; }
        public virtual DbSet<güncelliste> güncelliste { get; set; }
        public virtual DbSet<müsteriplatformadıları> müsteriplatformadıları { get; set; }
        public virtual DbSet<UrunlerVeMusteriler2> UrunlerVeMusteriler2 { get; set; }
        public virtual DbSet<viewsiparisler> viewsiparisler { get; set; }
        public virtual DbSet<yeni_siparislistesi> yeni_siparislistesi { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Mesajlar>()
                .Property(e => e.Icerik)
                .IsUnicode(false);

            modelBuilder.Entity<Musteriler>()
                .Property(e => e.LisansNumarasi)
                .IsUnicode(false);

            modelBuilder.Entity<Musteriler>()
                .Property(e => e.Sifre)
                .IsUnicode(false);

            modelBuilder.Entity<Musteriler>()
                .HasMany(e => e.Mesajlar)
                .WithRequired(e => e.Musteriler)
                .HasForeignKey(e => e.AliciID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Musteriler>()
                .HasMany(e => e.Mesajlar1)
                .WithRequired(e => e.Musteriler1)
                .HasForeignKey(e => e.GondericiID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Musteriler>()
                .HasMany(e => e.tbl_siparisler2)
                .WithOptional(e => e.Musteriler)
                .HasForeignKey(e => e.Müsteri_id);

            modelBuilder.Entity<MusteriPlatformlar>()
                .HasMany(e => e.tbl_siparisler2)
                .WithOptional(e => e.MusteriPlatformlar)
                .HasForeignKey(e => e.Platform_id);

            modelBuilder.Entity<tbl_siparisler2>()
                .Property(e => e.Ürün_adı)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_siparisler2>()
                .Property(e => e.Bilgiler)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_siparisler2>()
                .Property(e => e.Siparis_durumu)
                .IsUnicode(false);

            modelBuilder.Entity<Urunler>()
                .HasMany(e => e.tbl_siparisler2)
                .WithOptional(e => e.Urunler)
                .HasForeignKey(e => e.Urün_id);

            modelBuilder.Entity<yeni_siparislistesi>()
                .Property(e => e.Siparis_durumu)
                .IsUnicode(false);

            modelBuilder.Entity<yeni_siparislistesi>()
                .Property(e => e.Bilgiler)
                .IsUnicode(false);
        }
    }
}
