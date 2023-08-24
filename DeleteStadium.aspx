<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteStadium.aspx.cs" Inherits="MileS3.DeleteStadium" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please enter the stadium name:<br />
            <asp:TextBox ID="StadiumName" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="deleteS" runat="server" Text="Delete" OnClick="deleteS_Click" />
        </div>
    </form>
</body>
</html>
