<%@ Page Title="" Language="C#" MasterPageFile="~/yöneticipaneli.Master" AutoEventWireup="true" CodeBehind="Müsteriekle.aspx.cs" Inherits="hazırsablon.Müsteriekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <style>
        .container {
            margin: 0 auto;
            padding: 20px;
            max-width: 1200px;
        }

        .panel {
            margin-bottom: 20px;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .checkbox-group {
            margin-bottom: 15px;
        }

        .form-header {
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container">
        <div class="content">
            <asp:Panel ID="pnlMusteriEkle" runat="server" CssClass="panel panel-default">
                <div class="panel-heading">
                    <div class="form-header">Yeni Müşteri Bilgileri</div>
                </div>
                <div class="panel-body">
                    <asp:TextBox ID="txtSirketAdi" runat="server" CssClass="form-control" Placeholder="Şirket Adı" />
                    <asp:TextBox ID="txtAd" runat="server" CssClass="form-control" Placeholder="Ad" />
                    <asp:TextBox ID="txtSoyad" runat="server" CssClass="form-control" Placeholder="Soyad" />
                    <asp:TextBox ID="txtIletisimEmail" runat="server" CssClass="form-control" Placeholder="İletişim E-mail" />
                    <asp:TextBox ID="txtAciklama" runat="server" CssClass="form-control" TextMode="MultiLine" Placeholder="Açıklama" />

                    <!-- Ödeme Türü -->
                    <div class="form-group">
                        <label for="ddlOdemeTuru">Ödeme Türü:</label>
                        <asp:DropDownList ID="ddlOdemeTuru" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Kredi Kartı" Value="Kredi Kartı" />
                            <asp:ListItem Text="Nakit" Value="Nakit" />
                            <asp:ListItem Text="Havale" Value="Havale" />
                        </asp:DropDownList>
                    </div>

                    <!-- Lisans Bilgileri -->
                    <div class="form-group">
                        <label for="txtLisansNumarasi">Lisans Numarası:</label>
                        <asp:TextBox ID="txtLisansNumarasi" runat="server" CssClass="form-control" Placeholder="Lisans Numarası" ReadOnly="true" />
                        <asp:Button ID="btnGenerateLisans" runat="server" OnClick="Button1_Click" Text="Lisans Oluştur" CssClass="btn btn-primary" />
                    </div>
                    

                    <div class="form-group">
                        <label for="txtLisansYenilemeTarihi">Lisans Yenileme Tarihi:</label>
                        <asp:TextBox ID="txtLisansYenilemeTarihi" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnKayitEkle" runat="server" OnClick="Button2_Click" Text="Kayıt Ekle" CssClass="btn btn-success" />
                    </div>
                    
                    <asp:Label ID="lblkayıt" runat="server" CssClass="text-success"></asp:Label>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
