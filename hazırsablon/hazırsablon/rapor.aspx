<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="rapor.aspx.cs" Inherits="hazırsablon.rapor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="report-container">
            <div class="report-header">
                <h1>Raporlar</h1>
                <div class="platform-selector">
                    <label for="platformSelect">Platform Seçin:</label>
                    <asp:DropDownList ID="platformSelect" runat="server" AutoPostBack="True" OnSelectedIndexChanged="platformSelect_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                
               
            </div>

            <div class="stats-container">
               
                <div class="stat-box">
                    <h3>Toplam Satış Miktarı</h3>
                    <p><asp:Label ID="lblTotalSales" runat="server" Text="0"></asp:Label></p>
                </div>
                <div class="stat-box">
                    <h3>Toplam Kasa Hesabı</h3>
                    <p><asp:Label ID="lblTotalRevenue" runat="server" Text="0"></asp:Label></p>
                </div>
            </div>
            <br />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="btngün" runat="server" Text="Günü Bitir" CssClass="btn btn-success" />

            <div class="chart-container">
               
                <div class="chart">
                    <h3>Kasa Hareketleri</h3>
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>

            <div class="performance-container">
               
                
            </div>

            <div class="export-options">
                <asp:Button ID="btnExportPDF" runat="server" Text="PDF Olarak İndir" />
                <asp:Button ID="btnExportExcel" runat="server" Text="Excel Olarak İndir" />
            </div>
        </div>
    </form>
</asp:Content>
