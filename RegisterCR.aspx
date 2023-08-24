<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterCR.aspx.cs" Inherits="MileS3.RegisterCR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            New Club Representative<br />
            <br />
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="name" runat="server"></asp:TextBox>
            <br />
            <br />
            Username:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="username" runat="server"></asp:TextBox>
            <br />
            <br />
            Passsword:&nbsp;&nbsp;
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <br />
            Club Name:&nbsp;
            <asp:TextBox ID="clubName" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
