<%@ Page Title="" Language="C#" MasterPageFile="~/yöneticipaneli.Master" AutoEventWireup="true" CodeBehind="yönetim.aspx.cs" Inherits="hazırsablon.yönetim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .dashboard {
    padding: 20px;
}

.dashboard-header {
    margin-bottom: 20px;
}

.dashboard-summary {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.summary-card {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    width: 30%;
    text-align: center;
}

.summary-card h3 {
    margin-bottom: 10px;
}

.summary-card p {
    font-size: 24px;
    font-weight: bold;
    margin: 0;
}

.dashboard-recent-activities {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.dashboard-recent-activities h2 {
    margin-bottom: 10px;
}

#recentActivitiesList {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

#recentActivitiesList li {
    padding: 10px;
    border-bottom: 1px solid #e0e0e0;
}

#recentActivitiesList li:last-child {
    border-bottom: none;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="dashboard">
        <div class="dashboard-container">
            <div class="dashboard-header">
                <h1>Yönetici Paneli - Ana Sayfa</h1>
            </div>

            <div class="dashboard-summary">
                <div class="summary-card">
                    <h3>Toplam Ürünler</h3>
                    <p><asp:Label ID="lblTotalProducts" runat="server" Text="0"></asp:Label></p>
                </div>
                <div class="summary-card">
                    <h3>Toplam Siparişler</h3>
                    <p><asp:Label ID="lblTotalOrders" runat="server" Text="0"></asp:Label></p>
                </div>
                <div class="summary-card">
                    <h3>Yeni Yorumlar</h3>
                    <p><asp:Label ID="lblNewComments" runat="server" Text="0"></asp:Label></p>
                </div>
            </div>

            <div class="dashboard-recent-activities">
                <h2>Son Aktiviteler</h2>
                <ul id="recentActivitiesList">
                   
                    <li>Aktivite 1</li>
                    <li>Aktivite 2</li>
                    <li>Aktivite 3</li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
