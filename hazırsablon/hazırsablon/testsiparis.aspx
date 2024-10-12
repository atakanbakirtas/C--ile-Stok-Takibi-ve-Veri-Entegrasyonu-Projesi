<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="testsiparis.aspx.cs" Inherits="hazırsablon.testsiparis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h2 class="mb-0">Test Siparişi Oluştur</h2>
            </div>
            <div class="card-body">
                <form runat="server">
                    <div class="form-group">
                        <label for="DropDownList1">Platform:</label>
                        <asp:DropDownList ID="drpplatform" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group mt-3">
                        <label for="DropDownList2">Ürün Adı:</label>
                        <asp:DropDownList ID="drpürünler" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="drpürünler_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                                        <div class="form-group mt-3">
    <label for="txtfiyat">Fiyat</label>
                        <asp:TextBox ID="txtfiyat" runat="server" placeholder="Fiyat" CssClass="form-control" Enabled="False"></asp:TextBox>         
    
</div>
                    <div class="form-group mt-3">
    <label for="txtadet">Adet:</label>
                        <asp:TextBox ID="txtadet" runat="server" placeholder="Adet" CssClass="form-control"></asp:TextBox>         
    
</div>
                  
                    <div class="form-group mt-3">
                        <label for="txtTestBilgiler">Bilgiler:</label>
                        <asp:TextBox ID="txtTestBilgiler" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Ekstra Bilgiler..." MaxLength="200"/>
                    </div>
                    <div class="mt-4">
                        <asp:Button ID="btnCreateTestOrder" runat="server" Text="Test Siparişi Oluştur" CssClass="btn btn-primary btn-block" OnClick="btnCreateTestOrder_Click" OnClientClick="return showAlert();"  />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="btngeri" runat="server" OnClick="btngeri_Click">Geri Dön</asp:LinkButton>
                        <br />
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function showAlert() {
        alert('Test siparişi başarıyla oluşturuldu!');
        return true; // Formun gönderilmesine izin verir
    }
</script>
</asp:Content>
