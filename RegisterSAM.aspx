<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterSAM.aspx.cs" Inherits="MileS3.RegisterSAM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Please fill the details bellow!<br />
        <br />
        Name:<asp:TextBox ID="name" runat="server"></asp:TextBox>
        <br />
        <br />
        Username:<asp:TextBox ID="un" runat="server"></asp:TextBox>
        <br />
        <br />
        Password:<asp:TextBox ID="ps" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Register" runat="server" Text="Register" OnClick="Register_Click" />
    </form>
</body>
</html>
