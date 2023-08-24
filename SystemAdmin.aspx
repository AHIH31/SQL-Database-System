
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemAdmin.aspx.cs" Inherits="MileS3.SystemAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:Button ID="addNewClub" runat="server" OnClick="AddNewClub" Text="Add New Club" />
        <br />
        <br />
        <asp:Button ID="deleteClub" runat="server" OnClick="DeleteClub" Text="Delete Club" />
        <br />
        <br />
        <asp:Button ID="addNewStad" runat="server" OnClick="AddNewStadium" Text="Add New Stadium" />
        <br />
        <br />
        <asp:Button ID="deleteStad" runat="server" OnClick="DeleteStadium" Text="Delete Stadium" />
        <br />
        <br />
        <asp:Button ID="blockFan" runat="server" OnClick="BlockFan" Text="Block Fan" />
        </div>
    </form>
</body>
</html>
