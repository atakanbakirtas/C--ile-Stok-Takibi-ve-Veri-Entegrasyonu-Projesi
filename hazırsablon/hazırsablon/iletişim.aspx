<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="iletişim.aspx.cs" Inherits="hazırsablon.iletişim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
      <div class="contact-container">
        <section class="contact-form">
            <h2>Bizimle İletişime Geçin</h2>
            <asp:Panel ID="ContactFormPanel" runat="server">
                <asp:Label ID="lblName" runat="server" Text="Ad ve Soyad:" AssociatedControlID="txtName" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-input"></asp:TextBox>

                <asp:Label ID="lblEmail" runat="server" Text="E-posta Adresi:" AssociatedControlID="txtEmail" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email"></asp:TextBox>

                <asp:Label ID="lblSubject" runat="server" Text="Konu:" AssociatedControlID="txtSubject" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-input"></asp:TextBox>

                <asp:Label ID="lblMessage" runat="server" Text="Mesaj:" AssociatedControlID="txtMessage" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="4"></asp:TextBox>

                <asp:Button ID="btnSubmit" runat="server" Text="Gönder" CssClass="form-button"  />
            </asp:Panel>
        </section>

        <section class="contact-info">
            <h2>İletişim Bilgileri</h2>
            <p><strong>Adres:</strong> Kurtuluş mahallesi bahcivan sokak no 2 kat 4 daire 402 Sakarya Adapazarı</p>
            <p><strong>Telefon:</strong> 0 541 465 66 22</p>
            <p><strong>E-posta:</strong>  bilgi@dmlyazilim.com</p>
            <p><strong>Çalışma Saatleri:</strong> Pazartesi - Cuma, 09:00 - 18:00</p>
        </section>

        <section class="map">
            <h2>Adresimiz</h2>
            <iframe src="https://www.google.com/maps/embed?pb=YOUR_MAP_EMBED_CODE" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </section>

        <section class="social-media">
            <h2>Bizi Sosyal Medyada Takip Edin</h2>
            <div class="social-icons">
                <a href="https://www.facebook.com/Dmlyazilim/" target="_blank" class="social-icon">
                    <img src="iconlar/facebook.jpeg" alt="Facebook" />
                    <span style="font-family:Calibri">Facebook</span>
                </a>
                <a href="https://www.youtube.com/@dmlyazilim" target="_blank" class="social-icon">
                    <img src="iconlar/youtube.png" alt="YouTube" />
                    <span style="font-family:Calibri">YouTube</span>
                </a>
                <a href="https://www.instagram.com/dmlyazilimoffical/" target="_blank" class="social-icon">
                    <img src="iconlar/instagram.jpeg" alt="Instagram" />
                    <span style="font-family:Calibri">Instagram</span>
                </a>
            </div>
        </section>
    </div>

        </form>
</asp:Content>
