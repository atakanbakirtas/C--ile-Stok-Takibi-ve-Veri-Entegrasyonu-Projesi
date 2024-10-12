using dbo;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class ürünolayları : System.Web.UI.Page
    {
        dbo.modelyeni contex = new modelyeni();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                int gelen_kullanıcı = (int)Session["UserId"];
                // platform çekme
                string p1 = Request.QueryString["p1"];
                string sil = Request.QueryString["sil"];

                ddlPlatform.DataSource = contex.müsteriplatformadıları.Where(x => x.MusteriID == gelen_kullanıcı).ToList();
                ddlPlatform.DataTextField = "PlatformAdi";
                ddlPlatform.DataValueField = "PlatformID";
                ddlPlatform.DataBind();

                // kategori çekme 

                ddlCategory.DataSource = contex.Kategoriler.ToList();
                ddlCategory.DataTextField = "KategoriAdi";
                ddlCategory.DataValueField = "KategoriID";
                ddlCategory.DataBind();
                if (p1 != null)
                {
                    // Kullanıcı ID'si veya ürün ID'sini alıp işlemler yapabilirsiniz
                    btnUpdateProduct.Text = "Güncelle";
                    int gelen_id = Convert.ToInt32(p1);
                    Urunler ürünler = contex.Urunler.FirstOrDefault(x => x.UrunID == gelen_id);
                    if (ürünler != null)
                    {
                        txtProductName.Text = ürünler.UrunAdi;
                        txtPrice.Text = ürünler.Fiyat.ToString();
                        txtStockQuantity.Text = ürünler.StokMiktari.ToString();
                        ddlCategory.SelectedValue = ürünler.KategoriID.ToString();
                        ddlPlatform.SelectedValue = ürünler.PlatformId.ToString();

                        if (sil == "1")
                        {
                            // Silme işlemi yapılabilir

                            btnUpdateProduct.Text = "Sil";

                        }

                    }


                }




            }



        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ürünleridüzenle.aspx");
        }

        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {

            Urunler ürünler = new Urunler();
            string p1 = Request.QueryString["p1"];
            string sil = Request.QueryString["sil"];

            if (!string.IsNullOrEmpty(p1))
            {
                int gelen_id = Convert.ToInt32(p1);
                Urunler ürün = contex.Urunler.FirstOrDefault(x => x.UrunID == gelen_id);

                if (ürün != null)
                {
                    if (!string.IsNullOrEmpty(sil) && sil == "1")
                    {
                        // Silme işlemi
                        contex.Urunler.Remove(ürün);
                        contex.SaveChanges();
                        lblUpdateMessage.Text = "Ürün başarıyla silindi.";
                       
                    }
                    else
                    {
                        // Güncelleme işlemi
                        ürün.UrunAdi = txtProductName.Text;
                        ürün.Fiyat = Convert.ToDecimal(txtPrice.Text);
                        ürün.StokMiktari = Convert.ToInt32(txtStockQuantity.Text);
                        ürün.KategoriID = Convert.ToInt32(ddlCategory.SelectedValue);
                        ürün.PlatformId = Convert.ToInt32(ddlPlatform.SelectedValue);
                        lblUpdateMessage.Text = "Ürün başarıyla güncellendi.";
                        contex.SaveChanges();
                        
                    }
                }
            }
        }
    }
}