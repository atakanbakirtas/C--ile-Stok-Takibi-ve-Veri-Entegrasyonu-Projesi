<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ürünişlem.aspx.cs" Inherits="hazırsablon.ürünişlem" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <title>Ürün İşlemleri</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar-custom {
            margin-bottom: 20px;
        }
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .modal-body input {
            margin-bottom: 10px;
        }
        .navbar-brand {
            display: flex;
            align-items: center;
        }
        .navbar-nav {
            margin-right: auto;
        }
        .navbar-nav .nav-item {
            margin-left: 10px;
        }
        .navbar-nav .nav-link {
            color: #000;
        }
        .navbar-custom .btn-home {
            margin-left: auto;
            font-size: 20px;
        }
        .navbar-nav .nav-item .bi {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-custom">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Ürün İşlemleri</a>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav mx-auto">
                            <li class="nav-item">
                                <asp:LinkButton ID="btnAddProduct" runat="server" CssClass="nav-link">
                                    <i class="bi bi-plus-circle"></i> Ürün Ekle
                                </asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="btnUpdateProduct" runat="server" CssClass="nav-link">
                                    <i class="bi bi-pencil-square"></i> Güncelle
                                </asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="btnDeleteProduct" runat="server" CssClass="nav-link">
                                    <i class="bi bi-trash"></i> Silme
                                </asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="btnListProducts" runat="server" CssClass="nav-link">
                                    <i class="bi bi-list-ul"></i> Listeleme
                                </asp:LinkButton>
                            </li>
                        </ul>
                        <a href="Home.aspx" class="btn-home">
                            <i class="bi bi-house"></i> <!-- Ana Sayfa İkonu -->
                        </a>
                    </div>
                </div>
            </nav>

            <!-- İçerik Alanı -->
            <div id="contentArea" runat="server">
                <!-- Burada ürün işlemlerinin detayları yer alacak -->
            </div>
        </div>

        <!-- Ürün Ekleme/Düzenleme Modalı -->
        <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ürün Ekle/Düzenle</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" Placeholder="Ürün Adı" />
                        <asp:TextBox ID="txtProductPrice" runat="server" CssClass="form-control mt-2" Placeholder="Fiyat" />
                        <asp:TextBox ID="txtProductStock" runat="server" CssClass="form-control mt-2" Placeholder="Stok" />
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Kaydet" />
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">İptal</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>