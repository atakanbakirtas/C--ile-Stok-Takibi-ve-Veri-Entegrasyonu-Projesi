using dbo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hazırsablon
{
    public partial class Müsteriekle : System.Web.UI.Page
    {
        dbo.modelyeni context =new dbo.modelyeni();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //  lisans oluşturma
        private string GenerateRandomLicense()
        {
            var length = 26;
            var charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            var license = new char[length];
            for (int i = 0; i < length; i++)
            {
                license[i] = charset[random.Next(charset.Length)];
            }
            return new string(license);
        }
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            txtLisansNumarasi.Text = GenerateRandomLicense();
        }
        // kayıt işlemi
        protected void Button2_Click(object sender, EventArgs e)
        {
            dbo.modelyeni contex = new modelyeni();

            Musteriler m1 = new Musteriler
            {
                SirketAdi = txtSirketAdi.Text,
                Ad = txtAd.Text,
                Soyad = txtSoyad.Text,
                OdemeTuru = ddlOdemeTuru.SelectedValue,
                Aciklama = txtAciklama.Text,
                LisansNumarasi = txtLisansNumarasi.Text,
                IletisimEmail = txtIletisimEmail.Text,
                LisansYenilemeTarihi = DateTime.Parse(txtLisansYenilemeTarihi.Text),
                Sifre = "11111",
            };

            

            context.Musteriler.Add(m1);
            context.SaveChanges();
            lblkayıt.Text = "Müşteri başarıyla kaydedildi!";
        }
    }
}