<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="içerik.aspx.cs" Inherits="hazırsablon.içerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <style>
        .dashboard-container {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .header {
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            text-align: center;
            flex-direction: column;
        }

        .header img {
            margin-bottom: 15px;
        }

        .btn-create-order {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .btn-create-order:hover {
            background-color: #0056b3;
        }

        .orders {
            margin-top: 40px;
        }

        .orders h2 {
            margin-bottom: 20px;
            font-size: 28px;
            color: #343a40;
            font-weight: bold;
        }

        .gridview-container {
            overflow-x: auto;
        }

        .gridview-container table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
            color: #495057;
        }

        .gridview-container th, .gridview-container td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }

        .gridview-container th {
            background-color: #e9ecef;
            font-weight: bold;
        }

        .gridview-container tr:hover {
            background-color: #f1f3f5;
        }

        .btn-approve {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .btn-approve:hover {
            background-color: #218838;
        }
         .main-content {
            padding-top: 60px; /* Barın yüksekliği kadar padding ekleyin */
            .btn-reject {
    background-color: #dc3545;
    color: #fff;
    border: none;
    padding: 8px 16px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s ease;
}

.btn-reject:hover {
    background-color: #c82333;
}
    </style>
    <form runat="server">
        <div class="main-content">

        <div class="dashboard-container">
           

         
            <div class="orders">
                <h2>Platform Siparişleri</h2>
                                

                <div class="gridview-container">
                    <asp:GridView ID="gridsiparişler" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover" OnRowDataBound="gridsiparişler_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="SiparişID" HeaderText="Sipariş ID" />
                            <asp:BoundField DataField="UrunAdi" HeaderText="Ürün Adı" />
                            <asp:BoundField DataField="Fiyat" HeaderText="Fiyat" />
                            <asp:BoundField DataField="Ürün_adet" HeaderText="Adet" />
                            <asp:BoundField DataField="platformAdi" HeaderText="Platform" />
                            <asp:BoundField DataField="Bilgiler" HeaderText="Bilgiler" />
                            <asp:BoundField DataField="Siparis_tarihi" HeaderText="Sipariş Tarihi" />
                            <asp:BoundField DataField="Siparis_durumu" HeaderText="Sipariş Durumu" />
                            <asp:TemplateField HeaderText="İşlemler">
                                <ItemTemplate>
                                    
                                    <asp:Button ID="btnApproveOrder" runat="server" Text="Onayla" 
                                        CommandArgument='<%# Eval("SiparişID") %>'  
                                        CssClass="btn-approve" OnClick="btnApproveOrder_Click" />
                                     <asp:Button ID="btnRejectOrder" runat="server" Text="Reddet" 
                    CommandArgument='<%# Eval("SiparişID") %>'  
                    CssClass="btn-reject" OnClick="btnRejectOrder_Click"  />

                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:Button ID="btnCreateTestOrder" runat="server" CssClass="btn btn-success" OnClick="btnCreateTestOrder_Click" Text="Test Siparisi Olustur" Width="212px" />
            </div>
        </div>
            </div>
    </form>
</asp:Content>