<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mesajgönderyönetici.aspx.cs" Inherits="hazırsablon.mesajgönderyönetici" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="styles/styles2.css" rel="stylesheet" />
    <link href="styles/iletişim.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Mesaj Gönder</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Mesaj Gönder</h2>
            
            <!-- Alıcı Filtreleme -->
            
            
          
            
            <asp:Label ID="lblKonu" runat="server" Text="Konu:" />
            <asp:TextBox ID="txtKonu" runat="server" CssClass="form-control" />

            <br />

            <asp:Label ID="lblIcerik" runat="server" Text="İçerik:" />
            <asp:TextBox ID="txtIcerik" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" />

            <br />

            <asp:Button ID="btnGonder" runat="server" Text="Gönder" CssClass="btn btn-primary" OnClick="btnGonder_Click"  /><asp:Button ID="btngeridon" runat="server" Text="Geri Dön" CssClass="btn btn-primary" OnClick="btngeridon_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="lblSonuc" runat="server" CssClass="text-success" />
        </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>