using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class rapordeneme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            platformlarıçek();
        }
        private void platformlarıçek()
        {
            int gelen_id = Convert.ToInt32(Session["UserId"]);
            if (!IsPostBack)
            {
                using(dbo.modelyeni context=new dbo.modelyeni())
                {
                    var platformlar=context.müsteriplatformadıları.Where(x=>x.MusteriID==gelen_id).ToList();
                    platformSelect.DataSource = platformlar;
                    platformSelect.DataValueField = "PlatformID";
                    platformSelect.DataTextField = "PlatformAdi";
                    platformSelect.DataBind();
                }
            }
        }
    }
}