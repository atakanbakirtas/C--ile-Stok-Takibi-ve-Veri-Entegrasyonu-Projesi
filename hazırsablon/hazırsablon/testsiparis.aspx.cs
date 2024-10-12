using dbo;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class testsiparis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                platformlarıgörüntüle();
                ürünleriçek();
            }
        }
        // ilgili platformları çek 
        private void platformlarıgörüntüle() 
        {
            int kullanıcı =Convert.ToInt32( Session["UserId"]);
            using (dbo.modelyeni contex=new dbo.modelyeni())
            {
                var platformlar = contex.müsteriplatformadıları.Where(x => x.MusteriID == kullanıcı).ToList();
                drpplatform.DataSource = platformlar;
                drpplatform.DataTextField ="PlatformAdi";
                drpplatform.DataValueField = "PlatformID";
                drpplatform.DataBind();
            }
        }
        private void ürünleriçek()
        {
            using(dbo.modelyeni contex=new dbo.modelyeni())
            {
                int kullanıcı=Convert.ToInt32(Session["UserId"]);
                var ürünler = contex.Urunler.Where(k => k.MusteriID == kullanıcı).ToList();
                drpürünler.DataSource = ürünler;
                drpürünler.DataValueField = "UrunID";
                drpürünler.DataTextField = "UrunAdi";
                drpürünler.DataBind();
            }
        }

        protected void btnCreateTestOrder_Click(object sender, EventArgs e)
        {
            int kullanıcı = Convert.ToInt32(Session["UserId"]);
            try
            {
                using (dbo.modelyeni context = new dbo.modelyeni())
                {
                    tbl_siparisler2 siparis = new tbl_siparisler2();
                   
                    siparis.Siparis_durumu = "beklemede";
                    siparis.Müsteri_id = kullanıcı;
                    siparis.Platform_id = Convert.ToInt32(drpplatform.SelectedValue);
                    siparis.Urün_id = Convert.ToInt32(drpürünler.SelectedValue);
                    siparis.Bilgiler = txtTestBilgiler.Text;
                    siparis.Siparis_tarihi = DateTime.Now; // Sipariş Tarihi
                    siparis.Ürün_adet = Convert.ToInt32( txtadet.Text);
                    context.tbl_siparisler2.Add(siparis);
                    context.SaveChanges();

                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

            
        }

        protected void btngeri_Click(object sender, EventArgs e)
        {
            Response.Redirect("içerik.aspx");
        }

        protected void drpürünler_SelectedIndexChanged(object sender, EventArgs e)
        {
            dbo.modelyeni context= new dbo.modelyeni();

            int seçilen_ürün = Convert.ToInt32(drpürünler.SelectedValue);
            var seçilen=context.Urunler.FirstOrDefault(x=>x.UrunID==seçilen_ürün);

            // Eğer ürün bulunmuşsa, fiyatı TextBox'a yazdırıyoruz
            if (seçilen != null)
            {
                txtfiyat.Text = seçilen.Fiyat.ToString();
            }
            else
            {
                txtfiyat.Text = "Fiyat Bulunamadı";
            }
        }
    }
}