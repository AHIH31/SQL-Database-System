<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewMatch.aspx.cs" Inherits="MileS3.NewMatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add new match<br />
            <br />
            Host club name:<asp:TextBox ID="HostName" runat="server"></asp:TextBox>
            <br />
            <br />
            Guest club name:<asp:TextBox ID="GuestName" runat="server"></asp:TextBox>
            <br />
            <br />
            Start time:<asp:TextBox ID="StartTime" runat="server"></asp:TextBox>
            <br />
            <br />
            End time:<asp:TextBox ID="EndTime" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="AddMatch" runat="server" Text="Add" OnClick="AddMatch_Click" />
            <asp:Button ID="DeleteMatch" runat="server" Text="Delete" OnClick="DeleteMatch_Click" />
        </div>
    </form>
</body>
</html>
