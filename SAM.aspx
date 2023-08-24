<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SAM.aspx.cs" Inherits="MileS3.SAM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="addNewMatch" runat="server" Text="Add or delete a Match" OnClick="addNewMatch_Click" />
            <asp:Button ID="viewUpcominMatches" runat="server" Text="View All upcoming matches" OnClick="viewUpcomingMatches_Click" />
            <asp:Button ID="viewPlayedMatches" runat="server" Text="View already played matches" OnClick="viewPlayedMatches_Click" />
            <asp:Button ID="viewPair" runat="server" Text="View pair never PLayed" OnClick="viewPair_Click" />
        </div>
    </form>
</body>
</html>
