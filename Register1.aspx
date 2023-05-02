<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register1.aspx.cs" Inherits="Register1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Register1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="signup">
        <div class="signup-connect">
            <h1>
                Create your account</h1>
            <fieldset class="username">
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name" Height="34px"
                    Width="266px"></asp:TextBox>
            </fieldset>
            <fieldset class="email">
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your Email" Height="34px"
                    Width="266px"></asp:TextBox>
            </fieldset>
            <fieldset class="password">
                <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter your Phone" Height="34px"
                    Width="266px"></asp:TextBox>
            </fieldset>
            <fieldset class="password">
                <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter your Address" Height="34px"
                    Width="266px"></asp:TextBox>
            </fieldset>
            <fieldset class="password">
                <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter your Password" Height="34px"
                    Width="266px" TextMode="Password"></asp:TextBox>
            </fieldset>
            <fieldset class="password">
                <asp:TextBox ID="txtConpassword" runat="server" placeholder="Enter your Confurm Password"
                    Height="34px" Width="266px" TextMode="Password"></asp:TextBox>
            </fieldset>
            <fieldset class="password">
                <asp:Image ID="imagecaptcha" runat="server" />
                <asp:Button ID="LBcaptcha" runat="server" Text="Refresh" />
                <asp:TextBox ID="txtcaptcha" runat="server" placeholder="Enter Your Captcha" Height="35px"></asp:TextBox>
                <asp:Label ID="lblcap" runat="server" Visible="False"></asp:Label>
            </fieldset>
            <asp:Button ID="Button1" runat="server" class="btn" Text="sign up" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnSign_in" runat="server" class="btn" Text="sign in" OnClick="btnSign_in_Click" />
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
