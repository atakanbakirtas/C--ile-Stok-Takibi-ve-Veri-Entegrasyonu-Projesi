<%@ Page Title="" Language="C#" MasterPageFile="~/yöneticipaneli.Master" AutoEventWireup="true" CodeBehind="toplumesajgonder.aspx.cs" Inherits="hazırsablon.toplumesajgonder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <style>
        .container {
            margin: 0 auto;
            padding: 20px;
            max-width: 900px;
        }

        .grid-view {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .grid-view th, .grid-view td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .select-all {
            margin-bottom: 20px;
        }

        .btn-custom {
            font-size: 14px;
            padding: 10px 20px;
            margin: 5px 0;
        }

        .form-group {
            margin-top: 20px;
        }

        .form-control {
            border-radius: 5px;
        }

        .message-area {
            border-radius: 5px;
            border: 1px solid #ddd;
            padding: 15px;
            background-color: #f9f9f9;
        }

        .message-area textarea {
            width: 100%;
        }

        .alert {
            margin-top: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="mb-4">Toplu Mesaj Gönder</h2>

        <div class="select-all mb-3">
            
        </div>

        <!-- Kullanıcı Listeleme GridView -->
        <asp:GridView ID="gvKullanicilar" runat="server" CssClass="grid-view table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="MusteriID">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox ID="chkHeaderSelectAll" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="MusteriID" HeaderText="Kullanıcı ID" />
                <asp:BoundField DataField="SirketAdi" HeaderText="Kullanıcı Adı" />
            </Columns>
        </asp:GridView>

        <div class="message-area form-group mt-4">
            <asp:TextBox ID="txtkonu" runat="server" CssClass="form-control" Placeholder="Konu" />
            <br />
            <asp:TextBox ID="txtMesaj" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" Placeholder="Mesajınızı buraya yazın..." />
            <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-info" />
            <br />
            <asp:Button ID="btnSendMessage" runat="server" Text="Mesaj Gönder" CssClass="btn btn-success btn-custom" OnClick="btnSendMessage_Click" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </div>

</asp:Content>
