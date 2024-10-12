using dbo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class rapor : System.Web.UI.Page
    {
        private void navbarplatformlar()
        {
            if (Session["UserId"] != null)
            {
                int userId = (int)Session["UserId"];
                using (dbo.modelyeni context = new modelyeni())
                {
                    // Kullanıcının kayıtlı olduğu platformları alıyoruz
                    var userPlatforms = context.müsteriplatformadıları
                                               .Where(p => p.MusteriID == userId)
                                               .ToList();
                    // Kullanıcı platform ID'lerini JavaScript'e geçirme
                    var platformIds = userPlatforms.Select(p => p.PlatformID).ToArray();
                    var script = $"var userPlatformIds = {Newtonsoft.Json.JsonConvert.SerializeObject(platformIds)};";
                    ClientScript.RegisterStartupScript(this.GetType(), "PlatformData", script, true);
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            navbarplatformlar();
            platformlarıçek();
           // kasahesabı();           
            
        }
        private void platformlarıçek()
        {
            int userId = (int)Session["UserId"];
            if (!IsPostBack)
            {
                using (dbo.modelyeni contex2 = new dbo.modelyeni())
                {
                    var platformseç = contex2.müsteriplatformadıları
                                            .Where(k => k.MusteriID == userId)
                                            .ToList();
                    platformSelect.DataSource = platformseç;
                    platformSelect.DataTextField = "PlatformAdi";
                    platformSelect.DataValueField = "PlatformID";
                    platformSelect.DataBind();


                }

            }
        }
        private void total_sipariş()
        {
            int userId = (int)Session["UserId"];
            using (dbo.modelyeni context=new modelyeni())
            {
                var totalsiapris=context.tbl_siparisler2.Where(x=>x.Müsteri_id==userId).Count();
                lblTotalSales.Text = totalsiapris.ToString();
            }
        }

        protected void platformSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            total_sipariş();
        }

        public double kasa_hesabı;

        private void kasahesabı()
        {
            // Veritabanı bağlamını oluşturun
            dbo.modelyeni context = new dbo.modelyeni();

            // İlgili siparişi ve ürünü veritabanından çekin
            var siparis = context.tbl_siparisler2.FirstOrDefault();  // İlk siparişi çek
            if (siparis != null)
            {
                var ürün = context.Urunler.FirstOrDefault(u => u.UrunID == siparis.Urün_id); // Sipariş ile ilişkili ürünü çek

                // Eğer sipariş ve ürün bulunmuşsa kasa hesabını yapın
                if (ürün != null)
                {
                    kasa_hesabı = (double)(siparis.Ürün_fiyat);
                    lblTotalRevenue.Text = kasa_hesabı.ToString("C2"); // Para formatında gösterir
                }
                else
                {
                    lblTotalRevenue.Text = "İlgili ürün bulunamadı.";
                }
            }
            else
            {
                lblTotalRevenue.Text = "Sipariş bulunamadı.";
            }
        }
    }
}