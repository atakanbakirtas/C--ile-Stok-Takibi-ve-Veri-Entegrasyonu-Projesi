using dbo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class müsteridüzenle : System.Web.UI.Page
    {
        dbo.modelyeni context = new dbo.modelyeni();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                string p1 = Request.QueryString["p1"];
                // platformları çekme
                if (p1 != null)
                {
                    // Kullanıcı ID'si veya ürün ID'sini alıp işlemler yapabilirsiniz

                    int gelen_id = Convert.ToInt32(p1);
                    Musteriler müsteri = context.Musteriler.FirstOrDefault(x => x.MusteriID == gelen_id);
                    if (müsteri != null)
                    {
                        txtSirketAdi.Text = müsteri.SirketAdi;
                        txtAd.Text = müsteri.Ad;
                        txtSoyad.Text = müsteri.Soyad;
                        txtEmail.Text = müsteri.IletisimEmail;
                        txtAciklama.Text = müsteri.Aciklama;
                        ddlOdemeTuru.SelectedValue = müsteri.OdemeTuru.ToString();
                        txtLisansYenilemeTarihi.Text = müsteri.LisansYenilemeTarihi.ToString();
                    }
                }
            }
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            int musteriId = Convert.ToInt32(Request.QueryString["p1"]);
            Musteriler m1 = context.Musteriler.FirstOrDefault(m => m.MusteriID == musteriId);
            if (m1 != null)
            {
                m1.SirketAdi = txtSirketAdi.Text;
                m1.Ad = txtAd.Text;
                m1.Soyad = txtSoyad.Text;
                m1.Aciklama = txtAciklama.Text;
                m1.OdemeTuru = ddlOdemeTuru.SelectedValue;

                // Tarih formatını doğrulayıp atama yapın
                DateTime lisansYenilemeTarihi;
                if (DateTime.TryParse(txtLisansYenilemeTarihi.Text, out lisansYenilemeTarihi))
                {
                    m1.LisansYenilemeTarihi = lisansYenilemeTarihi;
                }
                else
                {
                    Label1.Text = "Geçersiz tarih formatı.";
                    return; // Hatalı tarih varsa güncelleme işlemini durdurur
                }

                context.SaveChanges();
                Label1.Text = "Müşteri bilgileri başarıyla güncellendi";
            }
            else
            {
                Label1.Text = "Müşteri bulunamadı.";
            }
        }
    }
}