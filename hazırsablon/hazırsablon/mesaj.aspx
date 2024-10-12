<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="mesaj.aspx.cs" Inherits="hazırsablon.mesaj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gelen Kutusu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h2 class="mb-0">Gelen Kutusu</h2>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gridmesajlar" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Konu" HeaderText="Konu" />
                            <asp:BoundField DataField="Icerik" HeaderText="İçerik" />
                            <asp:BoundField DataField="GeldigiTarih" HeaderText="Geldiği Tarih" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="card-footer text-muted">
                    Toplam Mesaj Sayısı: <asp:Label ID="lblMessageCount" runat="server" Text="0"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</asp:Content>