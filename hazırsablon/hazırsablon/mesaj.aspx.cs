using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class mesaj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int gelen_id = Convert.ToInt32(Session["UserId"]);
            if (!Page.IsPostBack)
            {
                using (dbo.modelyeni context = new dbo.modelyeni())
                {
                    gridmesajlar.DataSource = context.Mesajlar.Where(x => x.AliciID == gelen_id).ToList();
                    gridmesajlar.DataBind();
                    lblMessageCount.Text = gridmesajlar.Rows.Count.ToString();


                }





            }
        }
    }
}