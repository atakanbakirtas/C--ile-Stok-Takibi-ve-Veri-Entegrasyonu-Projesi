using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using dbo;

namespace hazırsablon
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public int gelen_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                Session.Clear(); 
                Session.Abandon();
            }
        }
        protected void btngiris_Click(object sender, EventArgs e)
        {

            string kadi = txtkullanıcı.Text;
            string parola = txtpass.Text;

            // Veritabanından kullanıcıyı ve şifreyi al
            using (dbo.modelyeni context = new dbo.modelyeni())
            {
                // Kullanıcıyı username ile bul
                Musteriler k1 = context.Musteriler.FirstOrDefault(x => x.Ad == kadi);

                if (k1 != null)
                {
                    // Veritabanındaki şifreyi al
                    string pass = k1.Sifre;

                    // Girilen şifre ile veritabanındaki şifreyi karşılaştır
                    if (parola == pass)
                    {
                        // Şifre doğru, oturum aç
                        Session["auth"] = true;
                        Session["kullanıcı"] = kadi;
                        Session["UserId"] = k1.MusteriID; // Kullanıcı ID'sini oturumda sakla
                        Response.Redirect("içerik.aspx");
                    }
                    else
                    {
                        // Şifre yanlış
                        lblMessage.Text = "Bilgileri kontrol ediniz.";
                        lblMessage.Visible = true;
                    }
                }
                else
                {
                    // Kullanıcı adı bulunamadı
                    lblMessage.Text = "Bilgileri kontrol ediniz.";
                    lblMessage.Visible = true;
                }
            }





        }

        protected void btnkayıt_Click(object sender, EventArgs e)
        {
            Response.Redirect("kullanıcıekle.aspx");
        }
    }
}