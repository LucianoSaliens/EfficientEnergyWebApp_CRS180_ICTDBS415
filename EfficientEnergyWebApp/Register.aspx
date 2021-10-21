<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EfficientEnergyWebApp.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title><style type="text/css">
        .auto-style1 {
            height: 29px;
        }
        .auto-style2 {
            height: 29px;
            width: 86px;
        }
        .auto-style4 {
            width: 86px;
        }
        .auto-style7 {
            height: 29px;
            text-align: left;
            width: 225px;
        }
        .auto-style8 {
            width: 1350px;
            height: 200px;
        }
        .auto-style9 {
            width: 1350px;
            height: 80px;
        }
        .auto-style10 {
            font-size: x-large;
        }
        .auto-style11 {
            width: 225px;
            text-align: left;
        }
        .auto-style12 {
            font-size: xx-large;
        }
        .auto-style13 {
            width: 304px;
        }
                       .auto-style14 {
                           width: 304px;
                           height: 29px;
                       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                &nbsp;
                <img alt="" class="auto-style8" longdesc="https://localhost:44354/Images/Banner.jpg" src="Images/Banner.jpg" /><br />
                <strong><span class="auto-style10">&nbsp;<asp:Button ID="btnHome" runat="server" OnClick="btnHome_Click" Text="Home" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="auto-style12">Registration<br />
                </span></strong></div>
            <table>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style7">
                        <asp:Label ID="Label9" runat="server" Text="EmployeeID:  " AssociatedControlID="hfEmployeeID"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="hfEmployeeID" runat="server" TextMode="Number" Width="300px"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="Label1" runat="server" Text="First Name:" AssociatedControlID="firstName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="firstName" runat="server" Width="300px"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="firstName" ErrorMessage="*Please enter your First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="Label2" runat="server" Text="Last Name:" AssociatedControlID="lastName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="lastName" runat="server" Width="300px"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lastName" ErrorMessage="*Please enter your Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style7">
                        <asp:Label ID="Label3" runat="server" Text="Date Of Birth" AssociatedControlID="dOB"></asp:Label>
                        :</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="dOB" runat="server" Width="300px" TextMode="Date"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dOB" ErrorMessage="*Please select your birthday" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="Label4" runat="server" Text="Mobile" AssociatedControlID="mobile"></asp:Label>
                        :</td>
                    <td>
                        <asp:TextBox ID="mobile" runat="server" TextMode="Number" Width="300px"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="mobile" ErrorMessage="*Please enter your Mobile" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style7">
                        <asp:Label ID="Label5" runat="server" Text="Phone" AssociatedControlID="phone"></asp:Label>
                        :</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="phone" runat="server" Width="300px"></asp:TextBox>
                    </td>
                    <td class="auto-style14">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="phone" ErrorMessage="*Please enter your Phone" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="Label6" runat="server" Text="Email" AssociatedControlID="email"></asp:Label>
                        :</td>
                    <td>
                        <asp:TextBox ID="email" runat="server" Width="300px"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="email" ErrorMessage="*Please enter your E-mail" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="*Must enter a valid E-mail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="Label7" runat="server" Text="Employee Type" AssociatedControlID="ddlEmployeeType"></asp:Label>
                        :</td>
                    <td>
                        <asp:DropDownList ID="ddlEmployeeType" runat="server" Width="310px" AutoPostBack="True">
                            <asp:ListItem>Part time</asp:ListItem>
                            <asp:ListItem>Permanent</asp:ListItem>
                            <asp:ListItem>Contract</asp:ListItem>
                            <asp:ListItem>Casual</asp:ListItem>
                            <asp:ListItem>Volunteer</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        <asp:Label ID="Label8" runat="server" Text="Salary" AssociatedControlID="salary"></asp:Label>
                        :</td>
                    <td>
                        <asp:TextBox ID="salary" runat="server" TextMode="Number" Width="300px"></asp:TextBox>
                    </td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        
                    </td>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="150px" />
                        &nbsp;<asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        
                    </td>
                    <td>
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style11">
                        
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
    <p>
        <img alt="" class="auto-style9" longdesc="https://localhost:44354/Images/bar_background.jpg" src="Images/bar_background.jpg" /></p>
</body>
</html>