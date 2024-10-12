<%@ Page Title="" Language="C#" MasterPageFile="~/yöneticipaneli.Master" AutoEventWireup="true" CodeBehind="platformekle.aspx.cs" Inherits="hazırsablon.platformekle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <div class="container">
        <h2>Platform Ekle</h2>
      
            <div class="form-group">
                <label for="searchUser">Kullanıcı Ara:</label>
                <asp:TextBox ID="txtSearchUser" runat="server" CssClass="form-control" placeholder="Kullanıcı adı girin" AutoPostBack="true" OnTextChanged="txtSearchUser_TextChanged"  />
                <br />
            </div>
            <div class="form-group">
                <label for="username">Kullanıcı Seçin:</label>
                <asp:DropDownList ID="ddlKullaniciAdi" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Kullanıcı Seçin" Value="" />
                    
                </asp:DropDownList>
                <br />
            </div>
            <div class="form-group">
                <label for="platform">Platform Seçin:</label>
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
                <br />
                <br />
            </div>
            <div class="form-group">
                <asp:Button ID="btnEkle" runat="server" Text="Platform Ekle" CssClass="btn btn-primary" OnClick="btnEkle_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Listeye Dön</asp:LinkButton>
                <br />
                <asp:Label ID="lblmessage" runat="server" ForeColor="Green"></asp:Label>
            </div>
    
    </div>
</asp:Content>
