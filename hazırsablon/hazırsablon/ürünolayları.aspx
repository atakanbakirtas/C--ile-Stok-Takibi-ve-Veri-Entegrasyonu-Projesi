<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ürünolayları.aspx.cs" Inherits="hazırsablon.ürünolayları" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>Ürün Güncelle</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .container {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #007bff;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            margin-right: 10px;
        }
        .back-icon {
            display: flex;
            align-items: center;
            font-size: 18px;
            text-decoration: none;
            color: #007bff;
            margin-top: 20px;
        }
        .back-icon i {
            margin-right: 5px;
        }
        .back-icon:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="page-title">Ürün Güncelle</h1>
            <asp:Panel ID="pnlUpdateProduct" runat="server" CssClass="card p-4">
                <asp:Label ID="lblUpdateMessage" runat="server" CssClass="text-success mb-3"></asp:Label>
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" Placeholder="Ürün Adı"></asp:TextBox>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control mt-3"></asp:DropDownList>
                <asp:DropDownList ID="ddlPlatform" runat="server" CssClass="form-control mt-3"></asp:DropDownList>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control mt-3" Placeholder="Fiyat"></asp:TextBox>
                <asp:TextBox ID="txtStockQuantity" runat="server" CssClass="form-control mt-3" Placeholder="Stok Miktarı"></asp:TextBox>
                <div class="d-flex justify-content-between mt-3">
                    <div>
                        <asp:Button ID="btnUpdateProduct" runat="server" Text="Güncelle" CssClass="btn btn-custom" OnClick="btnUpdateProduct_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="İptal" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                    </div>
                    <a href="ürünleridüzenle.aspx" class="back-icon">
                        <i class="fas fa-arrow-left"></i> Geri Dön
                    </a>
                </div>
            </asp:Panel>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </form>
</body>
</html>
