<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterSM.aspx.cs" Inherits="MileS3.RegisterSM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Username: "></asp:Label>
&nbsp;<asp:TextBox ID="managerUsername" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Password: "></asp:Label>
            <asp:TextBox ID="managerPassword" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Manager name: "></asp:Label>
            <asp:TextBox ID="managerName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Stadium name: "></asp:Label>
            <asp:TextBox ID="managerStadium" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="managerRegister" runat="server" Text="Register" OnClick="manager_Click" />
            <br />
        </div>
        <p>
&nbsp;</p>
        <p>
&nbsp;</p>
        <p>
&nbsp;</p>
        
    </form>
</body>
</html>
