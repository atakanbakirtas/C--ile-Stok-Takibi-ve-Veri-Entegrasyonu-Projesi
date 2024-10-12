using dbo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class Hakkımızda : System.Web.UI.Page
    {
        private void navbarplatformlar()
        {
            if (Session["UserId"] != null)
            {
                int userId = (int)Session["UserId"];
                using (dbo.modelyeni context = new modelyeni())
                {
                    // Kullanıcının kayıtlı olduğu platformları alıyoruz
                    var userPlatforms = context.müsteriplatformadıları
                                               .Where(p => p.MusteriID == userId)
                                               .ToList();
                    // Kullanıcı platform ID'lerini JavaScript'e geçirme
                    var platformIds = userPlatforms.Select(p => p.PlatformID).ToArray();
                    var script = $"var userPlatformIds = {Newtonsoft.Json.JsonConvert.SerializeObject(platformIds)};";
                    ClientScript.RegisterStartupScript(this.GetType(), "PlatformData", script, true);
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            navbarplatformlar();
        }
    }
}