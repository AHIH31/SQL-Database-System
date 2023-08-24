<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MileS3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
        <div>
            <p style="margin-left: 560px">
                Welcome to our website *.*</p>
            <p style="margin-left: 560px">
                <b>
            Please Login!<b></p>
            <p style="margin-left: 480px"><b>
            Username:<b>
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
            <br />
            </p>
            <p style="margin-left: 480px">
                &nbsp;</p>
            <p style="margin-left: 480px">
            Password: <asp:TextBox ID="password" runat="server" style="margin-top: 0px"></asp:TextBox>
            </p>
            <p style="margin-left: 560px">
            <br />
            &nbsp;&nbsp;
            <asp:Button ID="signin" runat="server" OnClick ="login" Text="Login" />
            </p>
            <p style="margin-left: 560px">
            &nbsp;Not a user?</p>
            <p style="margin-left: 560px">
                &nbsp;
                <asp:Button ID="Register" runat="server" Text="Register" OnClick="Register_Click" />
            </p>
        </div>
    </form>
</body>
</html>
