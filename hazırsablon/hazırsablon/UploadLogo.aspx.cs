using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class UploadLogo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string filePath = Server.MapPath("~/Uploads/Logos/" + fileName);
                FileUpload1.SaveAs(filePath);

                // Burada dosya yolunu veri tabanına veya kullanıcı oturumuna kaydedebilirsiniz
                Session["LogoPath"] = filePath;
            }
        }
    }
}