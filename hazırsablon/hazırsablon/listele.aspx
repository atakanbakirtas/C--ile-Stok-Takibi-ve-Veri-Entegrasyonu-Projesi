<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="listele.aspx.cs" Inherits="hazırsablon.listele" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <asp:GridView ID="Gridlis" runat="server" CssClass="gridview-style" OnRowCommand="Gridlis_RowCommand">
    <Columns>
        <asp:TemplateField HeaderText="İşlemler">
            <ItemTemplate>
                <div class="button-group">
                    <asp:LinkButton ID="btnSil" runat="server" CommandName="Silme" CommandArgument='<%# Eval("Ad") %>' CssClass="btn btn-danger">
                        <i class="fas fa-trash-alt"></i> Sil
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnGuncelle" runat="server" CommandName="Guncelleme" CommandArgument='<%# Eval("Ad") %>' CssClass="btn btn-primary">
                        <i class="fas fa-edit"></i> Güncelle
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnSifre" runat="server" CommandName="SifreDegistirme" CommandArgument='<%# Eval("Ad") %>' CssClass="btn btn-warning">
                        <i class="fas fa-key"></i> Şifre Değiştir
                    </asp:LinkButton>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>





</asp:Content>
