<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fan.aspx.cs" Inherits="MileS3.Fan1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Label1" runat="server" Text="Input Time: "></asp:Label>

            <asp:TextBox ID="Time" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="ViewAllMatches" runat="server" Text="View All Matches" OnClick="ViewAllMatches_Click" />

        </div>
    </form>
</body>
</html>
