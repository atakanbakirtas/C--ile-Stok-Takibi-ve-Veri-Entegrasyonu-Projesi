<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Hakkımızda.aspx.cs" Inherits="hazırsablon.Hakkımızda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

     <div class="about-container">
        <section class="company-info">
            <h2>Biz Kimiz?</h2>
            <p>
                2022 yılında kurulan <strong>[Şirket Adı]</strong>, yenilikçi ve müşteri odaklı çözümleriyle teknoloji dünyasında güçlü bir yer edinmiştir. Başta yazılım geliştirme, veri yönetimi ve dijital dönüşüm olmak üzere, geniş bir hizmet yelpazesiyle işletmelerin ihtiyaçlarına yönelik özel çözümler sunuyoruz.
            </p>
            <p>
                <strong>Değerlerimiz:</strong><br />
                - <strong>Müşteri Odaklılık:</strong> Müşterilerimizin ihtiyaçlarını en iyi şekilde anlamak ve onlara kalıcı çözümler sunmak önceliğimizdir.<br />
                - <strong>Yenilikçilik:</strong> Teknoloji sürekli değişiyor, biz de bu değişime ayak uydurarak inovatif çözümler geliştirmeye devam ediyoruz.<br />
                - <strong>Güvenilirlik:</strong> Müşterilerimize her zaman şeffaf, dürüst ve güvenilir hizmet sunmayı taahhüt ediyoruz.<br />
                - <strong>Takım Çalışması:</strong> Uzman ekibimiz, birlikte çalışarak en iyi sonuçları elde etmek için çaba gösterir.
            </p>
            <p>
                <strong>Ne Yapıyoruz?</strong><br />
                Geniş hizmet yelpazemiz arasında kurumsal yazılım çözümleri, web ve mobil uygulama geliştirme, bulut tabanlı hizmetler, siber güvenlik ve veri analitiği bulunmaktadır. Müşterilerimizin operasyonlarını daha verimli ve kârlı hale getirecek çözümler sunuyoruz.
            </p>
            <p>
                <strong>Geleceğe Bakış:</strong><br />
                Ar-Ge ve inovasyona olan bağlılığımızla, sadece bugünün değil yarının da teknolojik çözümlerini geliştiriyoruz. Dijitalleşen dünyada işletmelerin sürdürülebilir büyüme sağlamalarına yardımcı olmak amacıyla sürekli kendimizi yeniliyoruz.
            </p>
        </section>

        <section class="contact-info">
            <h2>İletişim Bilgileri</h2>
            <p>Adres: [Adres bilgisi]</p>
            <p>Telefon: [Telefon numarası]</p>
            <p>Email: [Email adresi]</p>
        </section>

        <section class="social-media">
            <h2>Sosyal Medya</h2>
            <div class="social-icons">
                <a href="https://www.facebook.com/" target="_blank" class="social-icon">
                    <img src="iconlar/facebook.jpeg" alt="Facebook" />
                    <span>Facebook</span>
                </a>
                <a href="https://www.youtube.com/" target="_blank" class="social-icon">
                    <img src="iconlar/youtube.png" alt="YouTube" />
                    <span>YouTube</span>
                </a>
                <a href="https://www.instagram.com/" target="_blank" class="social-icon">
                    <img src="iconlar/instagram.jpeg" alt="Instagram" />
                    <span>Instagram</span>
                </a>
            </div>
        </section>
    </div>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .about-container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .company-info,
        .contact-info {
            margin-bottom: 30px;
        }

        .social-icons {
            display: flex;
            gap: 20px;
        }

        .social-icon {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #333;
            transition: color 0.3s ease;
        }

        .social-icon img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .social-icon span {
            font-size: 18px;
            font-weight: 500;
        }

        .social-icon:hover {
            color: #3498db;
        }

        .social-icon:hover img {
            filter: brightness(1.2);
        }
    </style>
</asp:Content>