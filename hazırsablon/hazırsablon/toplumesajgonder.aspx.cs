using dbo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class toplumesajgonder : System.Web.UI.Page
    {
        dbo.modelyeni context = new dbo.modelyeni();
        protected void Page_Load(object sender, EventArgs e)
        {
            kullanıcılarılistele();

        }

        private void kullanıcılarılistele()
        {
            gvKullanicilar.DataSource = context.Musteriler.ToList();
            gvKullanicilar.DataBind();
        }

        

    }
}