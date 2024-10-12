<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kullanıcıekle.aspx.cs" Inherits="hazırsablon.kullanıcıekle" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Kayıt Ol</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9; /* Daha nötr ve modern bir arka plan rengi */
        }
        .register-message {
            text-align: center;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .profile-img-container {
            margin-bottom: 20px;
        }
        .profile-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #007bff; /* Kullanıcı ekleme ikonu için mavi kenarlık */
        }
        .form-container {
            width: 100%;
        }
        .form-control-custom {
            border-radius: 25px;
            border: 1px solid #ced4da;
            padding: 10px 15px;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
            transition: all 0.2s ease-in-out;
        }
        .form-control-custom:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            outline: none;
        }
        .btn-custom {
            border-radius: 25px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .password-wrapper {
            position: relative;
        }
        .toggle-password {
            padding-top:20px;
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 1.2em;
        }
        .form-check-custom {
            color: #fff; /* Beyaz yazı rengi */
            background-color: #2ecc71; /* Kırmızı arka plan rengi */
            border: 1px solid #c9302c; /* Koyu kırmızı kenarlık */
            padding: 10px;
            border-radius: 5px;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="register-message">
        <div class="profile-img-container">
            <img src="iconlar/yenikayıt.png" alt="Kullanıcı Ekle" class="profile-img" /> <!-- Kullanıcı ekleme ikonu -->
        </div>
        <h1>Kayıt Ol</h1>
        <form runat="server" class="form-container">
            <div class="mb-3">
                <asp:Label ID="Label1" CssClass="form-label" runat="server" Text="Kullanıcı Adı"></asp:Label>
                <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control form-control-custom" ID="txtKullaniciAdi"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Label ID="LabelEmail" CssClass="form-label" runat="server" Text="Email"></asp:Label>
                <asp:TextBox runat="server" TextMode="Email" CssClass="form-control form-control-custom" ID="txtEmail"></asp:TextBox>
            </div>
            <div class="mb-3 password-wrapper">
                <asp:Label ID="Label2" CssClass="form-label" runat="server" Text="Şifre"></asp:Label>
                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control form-control-custom" ID="txtSifre"></asp:TextBox>
                <i class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
            </div>
            <div class="mb-3 form-check-custom">
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
            <asp:Button ID="btnKaydet" runat="server" CssClass="btn btn-custom" Text="Kayıt Ol" OnClick="btnKaydet_Click" />
            <asp:Button ID="btnGirişEkranınaDön" runat="server" CssClass="btn btn-light btn-custom" Text="Geri Dön" OnClick="btnGirişEkranınaDön_Click" />
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <script>
        function togglePassword() {
            var passwordInput = document.getElementById('<%= txtSifre.ClientID %>');
            var toggleIcon = document.querySelector('.toggle-password');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>