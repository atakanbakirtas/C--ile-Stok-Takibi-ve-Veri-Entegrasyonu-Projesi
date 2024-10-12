using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] != null && (bool)Session["auth"])
            {
                if (Session["kullanıcı"] != null)
                {
                    lblUsername.Text = Session["kullanıcı"].ToString();
                }
            }
            else
            {
                Response.Redirect("WebForm1.aspx");
            }
        }
        protected void OpenMessages_Click(object sender, EventArgs e)
        {
            // Mesajlar kısmını açmak için gereken işlemler buraya gelecek
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            // Çıkış işlemlerini burada gerçekleştirin
            // Örneğin, kullanıcı oturumunu sonlandırabilir ve giriş sayfasına yönlendirebilirsiniz
            // Oturumu sonlandır
            Session.Clear(); // Tüm session verilerini temizler
            Session.Abandon(); // Oturumu kapatır

            // Çıkış yapıldıktan sonra kullanıcıyı giriş sayfasına yönlendir
            Response.Redirect("WebForm1.aspx");
        }
    }
}