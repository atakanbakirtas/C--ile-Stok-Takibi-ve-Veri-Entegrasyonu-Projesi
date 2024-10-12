<%@ Page Title="" Language="C#" MasterPageFile="~/ürünişlem.Master" AutoEventWireup="true" CodeBehind="ürünleridüzenle.aspx.cs" Inherits="hazırsablon.ürünleridüzenle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
     .custom-img {
            border-radius: 10px; /* Köşeleri yuvarlar */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Gölge ekler */
            border: 2px solid #f0f0f0; /* İnce bir sınır ekler */
        }
        
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }

        .page-title {
            font-size: 28px;
            margin-bottom: 20px;
            font-family: 'Open Sans', sans-serif;
            color: #333;
            text-align: center;
        }

        .box {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .box-title {
            font-size: 22px;
            margin-bottom: 15px;
            color: #333;
        }

        .input-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-success {
            background-color: #28a745;
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-group {
            display: flex;
            gap: 10px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .table th, .table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .alert {
            padding: 15px;
            margin: 20px 0;
            border-radius: 4px;
        }

        .alert-warning {
            background-color: #fff3cd;
            color: #856404;
        }
    </style>
     <div class="container">
        <h1 class="page-title">Ürün İşlemleri</h1>

        <!-- Platform Seçimi Bölümü -->
        <div class="box">
            <h2 class="box-title">Platform Seçimi</h2>
            <asp:DropDownList ID="ddlPlatforms" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPlatforms_SelectedIndexChanged">
            </asp:DropDownList>
        </div>

        <!-- Ürün Ara Bölümü -->
        <div class="box">
            <h2 class="box-title">Ürün Ara</h2>
            <div class="input-group">
                <asp:TextBox ID="txtSearchProduct" runat="server" CssClass="form-control" placeholder="Ürün Adı"></asp:TextBox>
                <asp:Button ID="btnSearchProduct" runat="server" Text="Ara" CssClass="btn btn-primary" OnClick="btnSearchProduct_Click"/>
                <asp:Button ID="Button1" runat="server" Text="Tüm ürünleri listele" CssClass="btn btn-primary" OnClick="Button1_Click1" />
            </div>
        </div>

        <!-- Ürün Listesi Bölümü -->
        <div class="box">
            <h2 class="box-title">Ürün Listesi</h2>
            <asp:GridView ID="gridProductList" runat="server" CssClass="table" OnRowCommand="gridProductList_RowCommand" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="İşlemler">
                        <ItemTemplate>
                            <div>
                                <asp:Button runat="server" Text="Güncelle" CommandName="güncelle" CommandArgument='<%# Eval("UrunId") %>' CssClass="btn btn-success" />
                                <asp:Button runat="server" Text="Sil" CommandName="sil" CommandArgument='<%# Eval("UrunId") %>' CssClass="btn btn-danger" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UrunAd" HeaderText="Ürün Adı" />
                    <asp:BoundField DataField="Aciklama" HeaderText="Açıklama" />
                    <asp:BoundField DataField="Fiyat" HeaderText="Fiyat" />
                    <asp:TemplateField HeaderText="Resim">
                        <ItemTemplate>
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ResimURL") %>' CssClass="custom-img" Width="80" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="StokMiktari" HeaderText="Stok" />
                    <asp:BoundField DataField="KategoriAd" HeaderText="Kategori" />
                    <asp:BoundField DataField="PlatformAdı" HeaderText="Platform" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblmesaj" runat="server" CssClass="alert alert-warning" Text="Aradığınız ürün bulunamadı." Visible="false"></asp:Label>
        </div>

        <!-- Ürün Ekleme Bölümü -->
        <div class="box">
            <h2 class="box-title">Ürün Ekle</h2>
            <div class="form-group">
                <asp:DropDownList ID="dropürünekle" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtürün" runat="server" CssClass="form-control" placeholder="Ürün Adı"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Gerekli alan" ControlToValidate="txtürün" style="font-weight: 700; color: #993300"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtaçıklama" runat="server" CssClass="form-control" placeholder="Açıklama"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Gerekli alan" ControlToValidate="txtaçıklama" style="font-weight: 700; color: #993300"></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <asp:DropDownList ID="dropkategori" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtstok" runat="server" CssClass="form-control" placeholder="Stok Miktarı"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Gerekli alan" ControlToValidate="txtstok" style="font-weight: 700; color: #993300"></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <asp:TextBox ID="txtfiyat" runat="server" CssClass="form-control" placeholder="Ürün Fiyatı"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Gerekli alan" ControlToValidate="txtfiyat" style="font-weight: 700; color: #993300"></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <asp:FileUpload ID="fileUploadResim" runat="server" CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Gerekli alan" ControlToValidate="fileUploadResim" style="font-weight: 700; color: #993300"></asp:RequiredFieldValidator>

            </div>
            <div class="btn-group">
                <asp:Button ID="btnAddProduct" runat="server" Text="Ekle" CssClass="btn btn-success" OnClick="btnAddProduct_Click" />
                <asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="bttemizle" runat="server" Text="Temizle" CssClass="btn btn-danger" OnClick="bttemizle_Click" />
            </div>
        </div>
    </div>
</asp:Content>
