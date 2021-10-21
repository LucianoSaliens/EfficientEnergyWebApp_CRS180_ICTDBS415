<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="EfficientEnergyWebApp.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 1350px;
            height: 80px;
        }
        .auto-style4 {
            width: 268px;
        }
        .auto-style5 {
            width: 324px;
        }
        .auto-style6 {
            width: 268px;
            height: 26px;
        }
        .auto-style7 {
            width: 324px;
            height: 26px;
        }
        .auto-style8 {
            height: 26px;
        }
        .auto-style9 {
            width: 324px;
            text-align: left;
            height: 38px;
        }
        .auto-style10 {
            font-size: x-large;
        }
        .auto-style12 {
            font-size: xx-large;
        }
        .auto-style13 {
            width: 1350px;
            height: 200px;
        }
        .auto-style14 {
            width: 268px;
            height: 29px;
            text-align: right;
        }
        .auto-style15 {
            width: 324px;
            height: 29px;
        }
        .auto-style16 {
            height: 29px;
        }
        .auto-style18 {
            width: 268px;
            height: 38px;
        }
        .auto-style19 {
            height: 38px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img alt="" class="auto-style13" longdesc="https://localhost:44354/Images/Banner.jpg" src="Images/Banner.jpg" /><br />
                <asp:Button ID="btnHome" runat="server" OnClick="btnHome_Click" Text="Home" />
                <strong><span class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="auto-style12">User Registration<br />
                </span></strong>
            <table class="auto-style2">
                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="Label1" runat="server" AssociatedControlID="txtUserName" Text="User Name:"></asp:Label>
                    </td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtUserName" runat="server" Width="320px"></asp:TextBox>
                    </td>
                    <td class="auto-style16">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please enter an UserName" ControlToValidate="txtUserName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="Label2" runat="server" AssociatedControlID="txtUserPassword" Text="Password:"></asp:Label>
                    </td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtUserPassword" runat="server" Width="320px" TextMode="Password" OnTextChanged="txtUserPassword_TextChanged"></asp:TextBox>
                    </td>
                    <td class="auto-style16">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Please enter a Password" ControlToValidate="txtUserPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="Label3" runat="server" AssociatedControlID="txtConfirmUserPwd" Text="Confirm Password:"></asp:Label>
                    </td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtConfirmUserPwd" runat="server" Width="320px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style16">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Please confirm your Password" ControlToValidate="txtConfirmUserPwd" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtUserPassword" ControlToValidate="txtConfirmUserPwd" ErrorMessage="*Both password must be same" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18"></td>
                    <td class="auto-style9">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" Width="152px" OnClick="btnRegister_Click" />
                    &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" Width="152px" />
                    </td>
                    <td class="auto-style19"></td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style7"></td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EfficientEnergyDBConnectionString %>" SelectCommand="SELECT [UserName] FROM [tblUser]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="228px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
    <p>
        <img alt="" class="auto-style3" longdesc="https://localhost:44354/Images/bar_background.jpg" src="Images/bar_background.jpg" /></p>
</body>
</html>
