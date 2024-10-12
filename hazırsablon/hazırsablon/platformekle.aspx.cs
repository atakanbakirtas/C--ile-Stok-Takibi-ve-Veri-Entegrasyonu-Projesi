using dbo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class platformekle : System.Web.UI.Page
    {
        dbo.modelyeni contex = new dbo.modelyeni();


        // platformları çekme işlemi 
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                DropDownList1.DataSource = contex.Platformlar.ToList();
                DropDownList1.DataTextField = "PlatformAdi";
                DropDownList1.DataValueField = "PlatformID";
                DropDownList1.DataBind();
            }


        }
        // kullanıcı aramak için metot
        private void KullaniciAra(string searchText)
        {
            ddlKullaniciAdi.Items.Clear();
            var users = contex.Musteriler
                          .Where(u => u.Ad.Contains(searchText))
                          .Select(u => new { u.MusteriID, u.Ad })
                          .ToList();

            ddlKullaniciAdi.DataSource = users;
            ddlKullaniciAdi.DataTextField = "Ad";
            ddlKullaniciAdi.DataValueField = "MusteriID";
            ddlKullaniciAdi.DataBind();
            ddlKullaniciAdi.Items.Insert(0, new ListItem("Kullanıcı Seçin", ""));


        }
        // filtreleme kısmı 
        protected void txtSearchUser_TextChanged(object sender, EventArgs e)
        {

            string searchText = txtSearchUser.Text.Trim();
            if (!string.IsNullOrEmpty(searchText))
            {
                KullaniciAra(searchText);
            }
            else
            {
                ddlKullaniciAdi.Items.Clear();
                ddlKullaniciAdi.Items.Insert(0, new ListItem("Kullanıcı Seçin", ""));
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlKullaniciAdi.SelectedIndex > 0 && DropDownList1.Items.Count > 0)
                {
                    int userId = int.Parse(ddlKullaniciAdi.SelectedValue);
                    int selectedPlatformId = Convert.ToInt32(DropDownList1.SelectedValue);

                    // Mevcut kaydı kontrol et
                    var mevcutKayit = contex.MusteriPlatformlar
                        .FirstOrDefault(mp => mp.MusteriID == userId && mp.PlatformID == selectedPlatformId);

                    if (mevcutKayit != null)
                    {
                        lblmessage.Text = "Bu platform zaten bu kullanıcıya eklenmiş.";
                        return; // İşlemi durdur
                    }

                    var yeniPlatform = new MusteriPlatformlar
                    {
                        MusteriID = userId,
                        PlatformID = selectedPlatformId,
                        // Diğer gerekli alanlar da eklenebilir.
                    };

                    contex.MusteriPlatformlar.Add(yeniPlatform);
                    contex.SaveChanges();
                    lblmessage.Text = "Platform başarıyla eklendi.";
                }
                else
                {
                    lblmessage.Text = "Lütfen bir kullanıcı ve en az bir platform seçin.";
                }
            }
            catch (Exception ex)
            {
                // Hata mesajını yazdır
                lblmessage.Text = $"Hata: {ex.Message}";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("müsteriler.aspx");
        }
    }
}