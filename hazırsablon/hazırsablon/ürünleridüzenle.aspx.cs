using dbo;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class ürünleridüzenle : System.Web.UI.Page
    {
        dbo.modelyeni context=new dbo.modelyeni();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Oturumdan kullanıcı ID'sini al
                int userId = Convert.ToInt32(Session["UserId"]);

                // Kullanıcının ait olduğu platformları veritabanından al
                using (var context = new modelyeni()) // Veritabanı bağlamı
                {
                    var platforms = context.müsteriplatformadıları
                        .Where(x => x.MusteriID == userId)
                        .ToList();

                    // DropDownList'i doldur
                    ddlPlatforms.DataSource = platforms;
                    ddlPlatforms.DataTextField = "PlatformAdi"; // Görünen metin
                    ddlPlatforms.DataValueField = "PlatformID"; // Değer
                    ddlPlatforms.DataBind();
                    // İlk öğeyi seçili yap (isteğe bağlı)
                    ddlPlatforms.Items.Insert(0, new ListItem("Seçiniz", ""));

                }

                // ürünleri çekme 

                using (var contex = new modelyeni())
                {
                    var ürünler = contex.güncelliste.Where(k=>k.MusteriID==userId).ToList();
                    gridProductList.DataSource = ürünler;
                    gridProductList.DataBind();
                }

                //ekleme için platformları görüntüle
                using (var context = new modelyeni()) // Veritabanı bağlamı
                {
                    var platforms = context.müsteriplatformadıları
                        .Where(x => x.MusteriID == userId)
                        .ToList();

                    // DropDownList'i doldur
                    dropürünekle.DataSource = platforms;
                    dropürünekle.DataTextField = "PlatformAdi"; // Görünen metin
                    dropürünekle.DataValueField = "PlatformID"; // Değer
                    dropürünekle.DataBind();
                    

                }


                // kategorileri çekme 
                using (var context = new modelyeni()) // Veritabanı bağlamı
                {
                    var kategori = context.Kategoriler
                        
                        .ToList();

                    // DropDownList'i doldur
                    dropkategori.DataSource = kategori;
                    dropkategori.DataTextField = "KategoriAdi"; // Görünen metin
                    dropkategori.DataValueField = "KategoriID"; // Değer
                    dropkategori.DataBind();
                    

                }




            }

        }

        protected void ddlPlatforms_SelectedIndexChanged(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            if (ddlPlatforms.SelectedValue != "")
            {
                int selectedPlatformId = Convert.ToInt32(ddlPlatforms.SelectedValue);

                using (var context = new modelyeni())
                {
                    var products = context.güncelliste
                        .Where(p => p.PlatformId == selectedPlatformId && p.MusteriID==userId) // PlatformId ile filtreleme
                        .ToList();

                    if (products.Any())
                    {
                        gridProductList.DataSource = products;
                        gridProductList.DataBind();
                        lblmesaj.Visible = false;
                    }
                    else
                    {
                        gridProductList.DataSource = null;
                        gridProductList.DataBind();
                        lblmesaj.Visible = true;
                    }
                }
            }
            else
            {
                gridProductList.DataSource = null;
                gridProductList.DataBind();
                lblmesaj.Visible = false;
            }
        }

        protected void btnSearchProduct_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            // Kullanıcının girdiği ürün adını al
            string productName = txtSearchProduct.Text.Trim();

            // Veritabanından ürünleri filtrele
            using (var context = new modelyeni()) // DbContext'inizi buraya ekleyin
            {
                var products = context.güncelliste
                    .Where(p => p.UrunAd.Contains(productName) && p.MusteriID==userId)
                    .ToList();

                if (products.Any())
                {
                    gridProductList.DataSource = products;
                    gridProductList.DataBind();
                    lblmesaj.Visible = false;
                }
                else
                {
                    gridProductList.DataSource = null;
                    gridProductList.DataBind();
                    lblmesaj.Visible = true;
                }
            }
        }

        

        protected void gridProductList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string cn=e.CommandName.ToString();
            string ca=e.CommandArgument.ToString();

            switch (cn)
            {

                case "güncelle":
                    Response.Redirect("ürünolayları.aspx?p1=" + ca);
                    break;
                case "sil":
                    Response.Redirect("ürünolayları.aspx?p1=" + ca + "&sil=1");
                    break;

            }


        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            // Oturumdan kullanıcı ID'sini al
            int userId = Convert.ToInt32(Session["UserId"]);
            using (var context = new modelyeni())
            {
                // Kullanıcıdan alınan veriler
                string productName = txtürün.Text.Trim();
                string description = txtaçıklama.Text.Trim();
                int stockQuantity = int.Parse(txtstok.Text.Trim());
                decimal price = decimal.Parse(txtfiyat.Text.Trim());
                int selectedPlatformId = int.Parse(dropürünekle.SelectedValue); // Seçilen platform
                int selectedCategoryId = int.Parse(dropkategori.SelectedValue); // Seçilen kategori
                string imagePath = null;

                // Resim Yükleme Kontrolü
                if (fileUploadResim.HasFile)
                {
                    // Dosya adını ve uzantısını al
                    string fileName = Path.GetFileName(fileUploadResim.PostedFile.FileName);

                    // Sunucudaki dosya yolu
                    string uploadFolder = Server.MapPath("~/Uploads/");
                    string filePath = Path.Combine(uploadFolder, fileName);

                    // Klasör mevcut değilse oluştur
                    if (!Directory.Exists(uploadFolder))
                    {
                        Directory.CreateDirectory(uploadFolder);
                    }

                    // Dosyayı kaydet
                    fileUploadResim.SaveAs(filePath);

                    // Veritabanına kaydedilecek yol
                    imagePath = "~/Uploads/" + fileName;
                }

                // Yeni ürün oluşturuluyor
                var newProduct = new Urunler
                {
                    UrunAdi = productName,
                    Aciklama = description,
                    StokMiktari = stockQuantity,
                    Fiyat = price,
                    PlatformId = selectedPlatformId,
                    KategoriID = selectedCategoryId,
                    ResimURL = imagePath, // Resim yolunu kaydet
                    MusteriID = userId
                };

                // Veritabanına ekle
                context.Urunler.Add(newProduct);
                context.SaveChanges();

                // Ekleme işlemi başarılı mesajı
                Label1.Text = "Ürün başarıyla eklendi.";
                Label1.ForeColor = System.Drawing.Color.Green;

                // Formu temizle
                txtürün.Text = string.Empty;
                txtaçıklama.Text = string.Empty;
                txtstok.Text = string.Empty;
                txtfiyat.Text = string.Empty;
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            using (var contex = new modelyeni())
            {
                var ürünler = contex.güncelliste.Where(l=>l.MusteriID==userId).ToList();
                gridProductList.DataSource = ürünler;
                gridProductList.DataBind();
            }
        }





        public class Resim
        {
            public int Id { get; set; }
            public string ResimYolu { get; set; }
        }
        public class ApplicationDbContext : DbContext
        {
            public DbSet<Resim> Resimler { get; set; }

            // Diğer DbSet ve yapılandırmalar
        }
        private void temizle()
        {
            dropkategori.SelectedIndex = 0;
            dropürünekle.SelectedIndex = 0;
            txtaçıklama.Text = "";
            txtfiyat.Text = "";
            txtstok.Text = "";
            txtürün.Text = "";
            fileUploadResim.Controls.Clear();
        }
        protected void bttemizle_Click(object sender, EventArgs e)
        {
           
                temizle();
            
        }
    }
}