<%@ Page Title="" Language="C#" MasterPageFile="~/yöneticipaneli.Master" AutoEventWireup="true" CodeBehind="müsteriler.aspx.cs" Inherits="hazırsablon.müsteriler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <style>
         .container {
            margin: 0 auto;
            padding: 20px;
            max-width: max-content;
            width: 100%;
        }
        .grid-view {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
        }

        .grid-view th, .grid-view td {
            border: 1px solid #ddd;
        }

        .panel {
            margin-bottom: 20px;
            width: 100%;
        }

        .grid-view {
            width: 100%;
            overflow-x: auto;
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

        .btn-custom {
            margin-top: 20px;
            background-color: #007bff;
            color: white;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container mt-4">
        <h2>Müşteri Listele</h2>

        <!-- Arama Çubuğu -->
        <div class="mb-3">
            <asp:TextBox ID="txtArama" runat="server" CssClass="form-control" Placeholder="Müşteri Adı veya Şirket Adı ile Ara" />
            <asp:Button ID="btnAra" runat="server" Text="Ara" CssClass="btn btn-primary mt-2" OnClick="btnAra_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>

        <!-- Toplu Mesaj Gönder Butonu -->
         <br />

        <!-- Müşteri Listeleme GridView -->
        <asp:GridView ID="gvMusteriler" runat="server" AutoGenerateColumns="False" CssClass="grid-view" BorderStyle="Dotted" ForeColor="#2C3E50" BackColor="White" OnRowCommand="gvMusteriler_RowCommand">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="iconlar/düzen.png" Width="30px" Height="20px" CommandName="düzenle" CommandArgument='<%# Eval("MusteriID") %>' />
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="iconlar/ekle.png" Width="30px" Height="20px" CommandName="ekle" CommandArgument='<%# Eval("MusteriID") %>' />
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="iconlar/mesaj.png" Width="30px" Height="20px" CommandName="gönder" CommandArgument='<%# Eval("MusteriID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SirketAdi" HeaderText="Şirket" />
                <asp:BoundField DataField="Ad" HeaderText="Ad" />
                <asp:BoundField DataField="Soyad" HeaderText="Soyad" />
                <asp:BoundField DataField="IletisimEmail" HeaderText="E-mail" />
                <asp:BoundField DataField="Aciklama" HeaderText="Açıklama" />
                <asp:BoundField DataField="OdemeTuru" HeaderText="Ödeme Türü" />
                <asp:BoundField DataField="LisansNumarasi" HeaderText="Lisans No" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
