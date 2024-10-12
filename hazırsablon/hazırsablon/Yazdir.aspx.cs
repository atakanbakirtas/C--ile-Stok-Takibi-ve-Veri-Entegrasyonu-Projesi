using dbo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class Yazdir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int siparisID = int.Parse(Request.QueryString["SiparişID"]);

                using (var context = new modelyeni())
                {
                    var siparis = context.viewsiparisler
                        .Where(s => s.Sipariş_No == siparisID)
                        .FirstOrDefault();
                       

                    if (siparis != null)
                    {
                        lblUrunAdi.InnerText = siparis.Ürün_Adı;
                        lblPlatformAdi.InnerText = siparis.platform_Adı;
                        lblBilgiler.InnerText = siparis.Bilgiler;
                        lblSiparisTarihi.InnerText = siparis.tarih.ToString();
                    }
                }
            }
        }
      
    }
}