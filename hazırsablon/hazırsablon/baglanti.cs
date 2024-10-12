using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Security.Cryptography.X509Certificates;
using System.Runtime.Remoting.Messaging;
using System.Drawing;

namespace hazırsablon
{
    public class baglanti
    {
        static SqlConnection bgl = new SqlConnection();
        
        public static DataTable getdata(string sql)
        {
            //Bu metod, verilen SQL sorgusunu çalıştırır ve sorgunun sonucunu bir DataTable olarak döndürür.
            //Eğer bir hata oluşursa, null döner.
            //Bu, veritabanı sorgularını çalıştırmak ve sonuçları almak için kullanılabilir.
            //SqlDataAdapter, veritabanı ile veri alışverişi yapabilen bir bileşendir.
            //SqlCommand nesnesi, çalıştırılacak SQL sorgusunu temsil eder ve bu komut bgl bağlantısına atanır.
            //sql parametresi, çalıştırılacak SQL sorgusunu içerir.
            try
            {
                bgl.ConnectionString = ConfigurationManager.ConnectionStrings["dbCumlesi"].ConnectionString;
                bgl.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand();
                da.SelectCommand.Connection = bgl;
                da.SelectCommand.CommandText = sql;
                DataSet ds=new DataSet();
                da.Fill(ds);
                bgl.Close();
                return ds.Tables[0];
                
            }
            catch (Exception)
            {

                return null;   
                
            }
            

        }
        //kullanıcı kimlik doğrulama işlemi
        public static bool kimlikDogrula(string kullaniciadi, string sifre)
        {
            bgl.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["dbCumlesi"].ConnectionString;
            bool sonuc;
            try
            {
                bgl.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = new SqlCommand();
                da.SelectCommand.Connection = bgl;
                da.SelectCommand.CommandText = "SELECT COUNT(*) FROM tbl_kullanıcı WHERE kullanıcı_adı='" + kullaniciadi + "' AND hashsifre='" + sifre + "'";
                DataSet dset = new DataSet();
                da.Fill(dset);
                bgl.Close();
                if (Convert.ToInt32(dset.Tables[0].Rows[0][0].ToString()) == 1)
                    return true;
                else
                    return false;

            }
            catch (Exception)
            {
                sonuc = false;
                bgl.Close();
            }
            return sonuc;


        }
        public static bool urunEkle(string üad, string sku, int mik, decimal fiyat)
        {
            bgl.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["dbCumlesi"].ConnectionString;
            bool sonuc;
            try
            {
                bgl.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = bgl;
                cmd.CommandText = "INSERT INTO Urunler(ad, SKU, Miktar, Fiyat) VALUES('" + üad + "', '" + sku + "', " + mik + ", " + fiyat + " )";
                cmd.ExecuteNonQuery();
                bgl.Close();
                sonuc = true;
            }
            catch (Exception)
            {
                sonuc = false;
                bgl.Close();
            }
            return sonuc;
        }
    }

}