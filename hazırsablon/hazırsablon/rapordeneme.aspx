<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rapordeneme.aspx.cs" Inherits="hazırsablon.rapordeneme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <div class="report-container">
           
            <div class="report-header">
                <h1>Raporlar</h1>
                <div class="platform-selector">
                    <label for="platformSelect">Platform Seçin:</label>
                    <asp:DropDownList ID="platformSelect" runat="server" AutoPostBack="True">
                       
                    </asp:DropDownList>
                </div>
                
                <div class="date-filter">
                    <label for="startDate">Başlangıç Tarihi:</label>
                    <asp:TextBox ID="startDate" runat="server" TextMode="Date"></asp:TextBox>
                    <label for="endDate">Bitiş Tarihi:</label>
                    <asp:TextBox ID="endDate" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:Button ID="btnFilter" runat="server" Text="Filtrele" />
                </div>
                <div class="quick-filters">
                    <asp:Button ID="btnToday" runat="server" Text="Bugün" />
                    <asp:Button ID="btnThisWeek" runat="server" Text="Bu Hafta" />
                    <asp:Button ID="btnThisMonth" runat="server" Text="Bu Ay" />
                    <asp:Button ID="btnThisYear" runat="server" Text="Bu Yıl" />
                </div>
            </div>

           
            <div class="stats-container">
                <div class="stat-box">
                    <h3>Toplam Ürün Adeti</h3>
                    <p><asp:Label ID="lblTotalProducts" runat="server" Text="0"></asp:Label></p>
                </div>
                <div class="stat-box">
                    <h3>Toplam Satış Miktarı</h3>
                    <p><asp:Label ID="lblTotalSales" runat="server" Text="0"></asp:Label></p>
                </div>
                <div class="stat-box">
                    <h3>Toplam Kasa Hesabı</h3>
                    <p><asp:Label ID="lblTotalRevenue" runat="server" Text="0"></asp:Label></p>
                </div>
            </div>

    
            <div class="chart-container">
                <div class="chart">
                    <h3>Satış Grafiği</h3>
                    <canvas id="salesChart"></canvas>
                </div>
                <div class="chart">
                    <h3>Kasa Hareketleri</h3>
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>

         
            <div class="performance-container">
                <div class="performance-box">
                    <h3>En Çok Satılan Ürünler</h3>
                    <asp:GridView ID="gvTopSellingProducts" runat="server">
                     
                    </asp:GridView>
                </div>
                <div class="performance-box">
                    <h3>Gelir Dağılımı</h3>
                    <asp:GridView ID="gvRevenueDistribution" runat="server">
                    
                    </asp:GridView>
                </div>
            </div>

          
            <div class="export-options">
                <asp:Button ID="btnExportPDF" runat="server" Text="PDF Olarak İndir" />
                <asp:Button ID="btnExportExcel" runat="server" Text="Excel Olarak İndir" />
            </div>
        </div>
    </form>
</body>
</html>
