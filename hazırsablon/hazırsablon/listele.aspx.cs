using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace hazırsablon
{
    public partial class listele : System.Web.UI.Page
    {
        SqlConnection conn=new SqlConnection("Data Source=DESKTOP-32JSJ90\\SQLEXPRESS;Initial Catalog=MerkeziStokYönetimSistemi;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter("SELECT Ad,SKU,Miktar,Fiyat FROM Urunler ", conn);

                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    Gridlis.DataSource = dt;
                    Gridlis.DataBind();
                }
                catch (Exception ex)
                {

                    Response.Write(ex.Message);
                }
                finally 
                { 
                    conn.Close();
                }
                
            }
        }
        protected void Gridlis_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Silme")
            {
                string ad = e.CommandArgument.ToString();
                
                // Silme işlemini burada yapın
            }
            else if (e.CommandName == "Guncelleme")
            {
                string ad = e.CommandArgument.ToString();
                // Güncelleme işlemini burada yapın
            }
            else if (e.CommandName == "SifreDegistirme")
            {
                string ad = e.CommandArgument.ToString();
                // Şifre değiştirme işlemini burada yapın
            }
        }


    }
}