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
    public partial class mesajgönderyönetici : System.Web.UI.Page
    {
        dbo.modelyeni contex = new dbo.modelyeni();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


       

        protected void btngeridon_Click(object sender, EventArgs e)
        {
            Response.Redirect("müsteriler.aspx");
        }
        protected void btnGonder_Click(object sender, EventArgs e)
        {
            
            int aliciID = Convert.ToInt32(Request.QueryString["p1"]);
            using (var context = new modelyeni())
            {
                // Alıcı ID'sinin geçerli olup olmadığını kontrol et
                var alici = context.Musteriler.FirstOrDefault(m => m.MusteriID == aliciID);
                if (alici == null)
                {
                    // Alıcı bulunamadıysa, bir hata mesajı göster
                    throw new Exception("Geçersiz müşteri ID'si.");
                }

                var yeniMesaj = new Mesajlar
                {
                   
                    GondericiID = 1,
                    AliciID = aliciID,
                    Konu = txtKonu.Text,
                    Icerik = txtIcerik.Text,
                    GeldigiTarih = DateTime.Now,
                    OkunduMu = false


                };

                context.Mesajlar.Add(yeniMesaj);
                context.SaveChanges();
                lblSonuc.Text = "Mesaj Gönderildi";



             
            }

        }
    }
}