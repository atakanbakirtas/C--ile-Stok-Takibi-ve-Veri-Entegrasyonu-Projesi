using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class müsteriler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbo.modelyeni contex=new dbo.modelyeni();

            if (!IsPostBack)
            {
                gvMusteriler.DataSource=contex.Musteriler.ToList();
                
                gvMusteriler.DataBind();
            }
        }

        protected void btnAra_Click(object sender, EventArgs e)
        {
           
            string filtre = txtArama.Text.Trim();
           
            
            using (dbo.modelyeni context = new dbo.modelyeni())
            {
                var filteredProducts = context.Musteriler
                    .Where(p =>p.SirketAdi.Contains(filtre))
                    .ToList();

                gvMusteriler.DataSource = filteredProducts;
                gvMusteriler.DataBind();
                
                if (filteredProducts.Count == 0)
                {
                    lblMessage.Text = "Müşteri Bulunamadı";
                    lblMessage.Visible = true; 
                }
                else
                {
                    lblMessage.Visible = false; 
                }
            }
        }

        protected void gvMusteriler_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string cn=e.CommandName.ToString();
            string ca=e.CommandArgument.ToString();


            switch(cn) 
            {

                case "ekle":
                    Response.Redirect("platformekle.aspx?p1="+ca);

                    break;



                case "düzenle":
                    Response.Redirect("müsteridüzenle.aspx?p1="+ca);
                    break;


                case "gönder":
                    Response.Redirect("mesajgönderyönetici.aspx?p1=" + ca);
                    break;



            }
        }

        protected void btnTopluMesajGonder_Click(object sender, EventArgs e)
        { 
            // toplu mesaj gönderme kısmı ayarla 




            //List<int> müsteri_idleri = new List<int>();
            //foreach(GridViewRow row  in gvMusteriler.Rows)
            //{
            //    int gelen_müsteriler = Convert.ToInt32(gvMusteriler.DataKeys[row.RowIndex].Value);
            //    müsteri_idleri.Add(gelen_müsteriler);

            //}
            //// listeyi saklayalım 
            //Session["Müsteriler"]=müsteri_idleri;
            List<int> gelemüsteriler = new List<int>();
            for (int i = 0; i<gvMusteriler.Rows.Count; i++)
            {
                // Your logic here, for example:
                GridViewRow row = gvMusteriler.Rows[i];

                // Assuming there is a CheckBox in each row with ID "chkSelect"
                CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                if (chkSelect != null)
                {
                    chkSelect.Checked = true;  // Mark the checkbox as checked
                }
                gelemüsteriler.Add(i);

            }
            Session["müsteriler"]=gelemüsteriler;
            Response.Redirect("toplumesajgonder.aspx");
        }
    }
}