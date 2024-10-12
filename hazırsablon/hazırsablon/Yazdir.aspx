<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Yazdir.aspx.cs" Inherits="hazırsablon.Yazdir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <style>
        /* Yazdırma Alanı Stili */
        .print-container {
            padding: 2mm;
            background-color: #ffffff;
            border-radius: 0;
            width: 58mm; /* 58mm yazıcı için genişlik */
            max-width: 80mm; /* 80mm yazıcı için maksimum genişlik */
            margin: 0 auto;
            font-family: Arial;
            font-size: 13pt; /* Termal yazıcılar için uygun küçük font boyutu */
            line-height: 1.3;
            border: none;
        }

        .print-container h2 {
            margin: 0;
            font-size: 15pt; /* Başlık boyutu */
            color: #000;
            text-align: center;
            font-weight: bold; /* Başlık ağırlığını artır */
        }

        .form-group {
            margin-bottom: 4mm; /* Aralıkları ayarla */
        }

        .form-group label {
            display: block;
            font-size: 13pt; /* Etiket font boyutu */
            color: #000;
            margin-bottom: 1mm; /* Etiket ve veri arasındaki boşluk */
            font-weight: bold; /* Etiket ağırlığını artır */
            font-family: Arial, sans-serif;
        }

        .form-group span {
            display: block;
            font-size: 12pt; /* Veri font boyutu */
            color: black;
            padding: 1mm 0; /* İç boşluk */
             font-family: Arial, sans-serif;
             font-weight:bolder;
             
        }

        /* Yazıcıya özgü stil ayarları */
        @media print {
            body * {
                visibility: hidden;
            }

            .print-container, .print-container * {
                visibility: visible;
            }

            .print-container {
                position: absolute;
                left: 0;
                top: 0;
                width: 58mm;
                margin: 0;
                padding: 0;
                border: none;
                font-size: 12pt;
            }

            .btn-print {
                display: none; /* Yazdırma sırasında butonu gizle */
            }
            
        /* Center the print button */
       
        }
    </style>
    <form runat="server">
        <div class="print-container">
            <h2>Sipariş Bilgileri</h2>
            <br />

            <div class="form-group">
                <label for="lblUrunAdi">Ürün Adı</label>
                <span id="lblUrunAdi" runat="server"></span>
            </div>

            <div class="form-group">
                <label for="lblPlatformAdi">Platform</label>
                <span id="lblPlatformAdi" runat="server"></span>
            </div>

            <div class="form-group">
                <label for="lblBilgiler">Bilgiler</label>
                <span id="lblBilgiler" runat="server"></span>
            </div>

            <div class="form-group">
                <label for="lblSiparisTarihi">Sipariş Tarihi</label>
                <span id="lblSiparisTarihi" runat="server"></span>
            </div>
        </div>
        <br />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:ImageButton ID="btnPrint" runat="server" ImageUrl="iconlar/39263_print_printer_icon (1).png" CssClass="btn-print" Width="50px" OnClientClick="window.print(); return false;" />
    </form>
</asp:Content>
