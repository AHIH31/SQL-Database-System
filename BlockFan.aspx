<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockFan.aspx.cs" Inherits="MileS3.BlockFan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please enter the fan national ID:<br />
            <asp:TextBox ID="nationalID" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="blockF" runat="server" Text="Block" OnClick="blockF_Click" />
        </div>
    </form>
</body>
</html>
