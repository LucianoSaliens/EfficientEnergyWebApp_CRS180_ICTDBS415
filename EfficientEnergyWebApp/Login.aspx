<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EfficientEnergyWebApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style4 {
            width: 268px;
            text-align: right;
        }
        .auto-style5 {
            width: 1350px;
            height: 200px;
        }
        .auto-style6 {
            width: 1350px;
            height: 80px;
        }
        .auto-style7 {
            font-size: x-large;
        }
        .auto-style8 {
            text-align: left;
            width: 362px;
        }
        .auto-style9 {
            width: 362px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img alt="" class="auto-style5" longdesc="https://localhost:44354/Images/Banner.jpg" src="Images/Banner.jpg" /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style7"><strong>LOGIN<br />
            </strong></span></div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="txtUserName" Text="UserName:"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtUserName" runat="server" Width="345px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter UserName" ForeColor="Red" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Password:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtPassword" runat="server" Width="345px" TextMode="Password" OnTextChanged="txtPassword_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter Password" ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" Width="172px" OnClick="btnLogin_Click" />
                &nbsp;
                    <asp:Button ID="btnResgister" runat="server" OnClick="btnResgister_Click" Text="Resgister" Width="172px" />
                    </td>
                <td>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style9">
                    <asp:Button ID="btnEmployee" runat="server" OnClick="btnEmployee_Click" Text="Employee Registration" Width="172px" />
&nbsp; <asp:Button ID="btnUserRegister" runat="server" Text="User Resgistration" Width="172px" OnClick="btnUserRegister_Click" />
                    </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <img class="auto-style6" longdesc="https://localhost:44354/Images/bar_background.jpg" src="Images/bar_background.jpg" /></p>
</body>
</html>
