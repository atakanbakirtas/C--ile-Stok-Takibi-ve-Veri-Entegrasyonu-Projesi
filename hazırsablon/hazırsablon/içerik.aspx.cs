using dbo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class içerik : System.Web.UI.Page
    {
        private void navbarplatformlar()
        {
            if (Session["UserId"] != null)
            {
                int userId = (int)Session["UserId"];
                using(dbo.modelyeni context=new modelyeni())
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
        //private void kullanıcıplatformları()
        //{
        //    if (Session["UserId"] != null)
        //    {
        //        int userId = (int)Session["UserId"];
        //        using (dbo.modelyeni context = new dbo.modelyeni())
        //        {
        //            // Kullanıcının kayıtlı olduğu platformları alıyoruz
        //            var userPlatforms = context.müsteriplatformadıları
        //                                       .Where(p => p.MusteriID == userId)
        //                                       .Select(p => new
        //                                       {
        //                                           p.PlatformID,
        //                                           p.PlatformAdi
        //                                       })
        //                                       .ToList();
        //            // Dropdown (ComboBox) için veri bağlama
        //            cmbplatform.DataSource = userPlatforms;
        //            cmbplatform.DataTextField = "PlatformAdi"; // Platform adı
        //            cmbplatform.DataValueField = "PlatformID"; // Platform ID'si
        //            cmbplatform.DataBind();

                    
        //        }
        //    }
        //    }
        



        protected void Page_Load(object sender, EventArgs e)
        {
            navbarplatformlar();
            if (!Page.IsPostBack)
            {
                //kullanıcıplatformları();
                siparişçek();
                


                if (Session["auth"] != null && (bool)Session["auth"])
                {
                   
                }
                else
                {
                    Response.Redirect("WebForm1.aspx");
                }
                


            }
         }
       


        //protected void cmbplatform_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    int gelen_kullanıcı =Convert.ToInt32( Session["UserId"]);
        //    // Seçilen platformun ID'sini alın
        //    int selectedPlatformId = Convert.ToInt32(cmbplatform.SelectedValue);

        //    using (var context = new modelyeni()) // Kendi DbContext'inizi kullanın
        //    {
        //        // Seçilen platform için toplam ürün ve sipariş sayısını alın
        //        int totalProducts = context.Urunler.Count(p => p.PlatformId == selectedPlatformId && p.MusteriID==gelen_kullanıcı);
        //        int totalOrders = context.Urunler.Count(o => o.PlatformId == selectedPlatformId && o.MusteriID == gelen_kullanıcı);

        //        // Verileri sayfadaki etiketlere aktarın
        //        lblTotalProducts.Text = totalProducts.ToString();
        //        lblTotalOrders.Text = totalOrders.ToString();
        //    }
        //}





        private void siparişçek()
        {
            int gelen_kullanıcı = Convert.ToInt32(Session["UserId"]);
            using(dbo.modelyeni contex=new modelyeni())
            {
                gridsiparişler.DataSource=contex.yeni_siparislistesi.Where(x=>x.MusteriID==gelen_kullanıcı).ToList();
                gridsiparişler.DataBind();


            }
        }

        protected void btnApproveOrder_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int siparisID = int.Parse(btn.CommandArgument);
            


            using (var context = new modelyeni())
            {
                var siparis = context.tbl_siparisler2.Find(siparisID);
                if (siparis != null)
                {
                    siparis.Siparis_durumu = "Onaylandı";
                    context.SaveChanges();
                }
            }

            // Kullanıcıyı yazdırma sayfasına yönlendir
            Response.Redirect($"Yazdir.aspx?SiparişID={siparisID}");
        }




        protected void gridsiparişler_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var status = DataBinder.Eval(e.Row.DataItem, "Siparis_durumu").ToString();
                var btnApproveOrder = (Button)e.Row.FindControl("btnApproveOrder");
                var btnRejectOrder = (Button)e.Row.FindControl("btnRejectOrder");


                if (status == "Onaylandı" )
                {
                    btnApproveOrder.Enabled = false;
                    btnApproveOrder.CssClass = "btn-approve btn-disabled";
                    btnApproveOrder.Text = "Onaylandı";
                    btnRejectOrder.Enabled = false;
                }
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var status = DataBinder.Eval(e.Row.DataItem, "Siparis_durumu").ToString();
                var btnRejectOrder = (Button)e.Row.FindControl("btnRejectOrder");
                var btnApproveOrder = (Button)e.Row.FindControl("btnApproveOrder");


                if (status == "Ret Edildi")
                {
                    btnApproveOrder.Enabled = false;
                    btnRejectOrder.Enabled = false;
                    btnRejectOrder.CssClass = "btn-disabled btn-reject";
                    btnRejectOrder.Text = "Ret edildi";
                    
                }
            }

        }

        protected void btnCreateTestOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("testsiparis.aspx");
        }

        protected void btnRejectOrder_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int gelen_id = int.Parse(btn.CommandArgument);

            using(dbo.modelyeni context=new modelyeni())
            {
                var redsiparis=context.tbl_siparisler2.Find(gelen_id);
                if (redsiparis != null)
                {
                    redsiparis.Siparis_durumu = "Ret Edildi";
                    context.SaveChanges();
                }

            }

        }
    }
    }
