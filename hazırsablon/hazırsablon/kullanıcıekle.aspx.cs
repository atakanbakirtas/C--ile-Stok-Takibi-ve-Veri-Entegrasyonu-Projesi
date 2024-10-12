using dbo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class kullanıcıekle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        dbo.modelyeni contex = new dbo.modelyeni();
        protected void btnKaydet_Click(object sender, EventArgs e)
        {// Kullanıcı adı, şifre ve e-posta al
            string kadi = txtKullaniciAdi.Text;
            string parola = txtSifre.Text;
            string email = txtEmail.Text;

            // Boş olup olmadığını kontrol et
            if (!string.IsNullOrEmpty(kadi) && !string.IsNullOrEmpty(parola) && !string.IsNullOrEmpty(email))
            {
                // Yeni kullanıcı nesnesi oluştur
                Musteriler k1 = new Musteriler
                {
                    Ad = kadi,
                    Sifre = parola, // Şifreyi düz metin olarak sakla
                    IletisimEmail = email
                };

                // Veritabanına ekle
                using (dbo.modelyeni context = new dbo.modelyeni())
                {
                    context.Musteriler.Add(k1);
                    context.SaveChanges();
                }

                lblMessage.Text = "Kullanıcı başarıyla eklendi";
            }
            else
            {
                lblMessage.Text = "Gerekli alanları doldurunuz";
            }

        }

        protected void btnGirişEkranınaDön_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm1.aspx");
        }
    }
}