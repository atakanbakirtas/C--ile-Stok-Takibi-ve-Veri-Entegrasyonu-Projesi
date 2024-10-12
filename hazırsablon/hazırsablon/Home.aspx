<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="hazırsablon.Home" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Menü Sayfası</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        .sidebar {
            height: 100%;
            width: 250px;
            background-color: #343a40; /* Bootstrap koyu */
            color: #ffffff;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 60px; /* Menü biraz daha aşağıya alınmış */
            display: flex;
            flex-direction: column;
            align-items: center;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        .sidebar a {
            color: #ffffff;
            text-decoration: none;
            padding: 15px 20px;
            width: 100%;
            text-align: left;
            display: flex;
            align-items: center;
            font-size: 18px;
            transition: background-color 0.3s;
        }
        .sidebar a:hover {
            background-color: #495057; /* Bootstrap gri */
        }
        .sidebar i {
            margin-right: 10px;
            font-size: 20px;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            overflow-y: auto;
            background-color: #f8f9fa; /* Bootstrap açık gri */
            padding-top: 80px; /* İçeriği biraz daha aşağıya alır */
        }
        .content h1 {
            margin-top: 0;
        }
        .topbar {
            height: 60px;
            width: calc(100% - 250px);
            background-color: #007bff; /* Bootstrap mavi */
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding: 0 20px;
            position: fixed;
            top: 0;
            left: 250px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .topbar .btn {
            background: transparent;
            border: none;
            color: #fff;
            font-size: 20px;
            margin-left: 20px;
            cursor: pointer;
        }
        .topbar .btn:hover {
            color: #dfe6e9; /* Açık gri ton */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <a href="Home.aspx" runat="server" id="linkHome"><i class="bi bi-house"></i>Ana Sayfa</a>
            <a href="listele.aspx" runat="server" id="linkProducts"><i class="bi bi-box"></i>Ürün İşlemleri</a>
            <a href="Contact.aspx" runat="server" id="linkContact"><i class="bi bi-envelope"></i>İletişim</a>
            <a href="Users.aspx" runat="server" id="linkUsers"><i class="bi bi-person"></i>Kullanıcılar</a>
            <a href="Stores.aspx" runat="server" id="linkStores"><i class="bi bi-shop"></i>Mağazalar</a>
            <a href="Hakkımızda.aspx" runat="server" id="linkAbout"><i class="bi bi-info-circle"></i>Hakkımızda</a>
        </div>

        <div class="topbar">
            <asp:LinkButton CssClass="btn" OnClick="OpenMessages_Click" runat="server">
                <i class="bi bi-envelope"></i>
            </asp:LinkButton>
            <asp:LinkButton CssClass="btn" OnClick="Logout_Click" runat="server">
                <i class="bi bi-box-arrow-right"></i>
            </asp:LinkButton>
        </div>

        <div class="content">
             <h1>Hoşgeldiniz, <asp:Label ID="lblUsername" runat="server" /></h1>
            
            <p>Anasayfa</p>
            
        </div>
    </form>
</body>
</html>