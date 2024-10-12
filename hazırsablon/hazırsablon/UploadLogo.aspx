<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadLogo.aspx.cs" Inherits="hazırsablon.UploadLogo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Logo Yükle</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Logo Yükle</h1>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="UploadButton" runat="server" Text="Yükle" OnClick="UploadButton_Click" />
        </div>
    </form>
</body>
</html>
