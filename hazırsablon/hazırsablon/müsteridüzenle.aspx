<%@ Page Title="" Language="C#" MasterPageFile="~/yöneticipaneli.Master" AutoEventWireup="true" CodeBehind="müsteridüzenle.aspx.cs" Inherits="hazırsablon.müsteridüzenle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .form-container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.form-container h2 {
    text-align: center;
    color: #007bff;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    color: #333;
}

.form-group .form-control {
    width: 100%;
    padding: 10px;
    border-radius: 4px;
    border: 1px solid #ccc;
    font-size: 14px;
}

.form-group .btn {
    width: 48%;
    padding: 10px;
    font-size: 16px;
    margin-right: 4%;
    border-radius: 4px;
}

.form-group .btn-secondary {
    background-color: #6c757d;
    border-color: #6c757d;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       <div class="form-container">
        <h2>Müşteri Bilgilerini Güncelle</h2>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />

        <div class="form-group">
            <label for="txtSirketAdi">Şirket Adı:</label>
            <asp:TextBox ID="txtSirketAdi" runat="server" CssClass="form-control" placeholder="Şirket Adı"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtAd">Ad:</label>
            <asp:TextBox ID="txtAd" runat="server" CssClass="form-control" placeholder="Ad"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtSoyad">Soyad:</label>
            <asp:TextBox ID="txtSoyad" runat="server" CssClass="form-control" placeholder="Soyad"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtEmail">İletişim E-posta:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="E-posta"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtAciklama">Açıklama:</label>
            <asp:TextBox ID="txtAciklama" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Açıklama"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="ddlOdemeTuru">Ödeme Türü:</label>
            <asp:DropDownList ID="ddlOdemeTuru" runat="server" CssClass="form-control">
                <asp:ListItem Text="Kredi Kartı" Value="Kredi Kartı"></asp:ListItem>
                <asp:ListItem Text="Havale/EFT" Value="Havale/EFT"></asp:ListItem>
                <asp:ListItem Text="Nakit" Value="Nakit"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="txtLisansYenilemeTarihi">Lisans Yenileme Tarihi:</label>
            <asp:TextBox ID="txtLisansYenilemeTarihi" runat="server" CssClass="form-control" placeholder="GG/AA/YYYY" TextMode="Date"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Button ID="btnGuncelle" runat="server" CssClass="btn btn-primary" Text="Güncelle" OnClick="btnGuncelle_Click" />
            <asp:Button ID="btnIptal" runat="server" CssClass="btn btn-secondary" Text="Geri Dön" PostBackUrl="~/müsteriler.aspx" />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" ForeColor="#006600"></asp:Label>
        </div>
    </div>
</asp:Content>
