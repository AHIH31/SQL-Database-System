<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FanHomePage.aspx.cs" Inherits="MileS3.FanHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Button ID="ViewMatches" runat="server" Text="View All Matches" OnClick= "ViewMatches_Link" />
            <asp:Button ID="PurchaseTicket" runat="server" Text="Purchase A ticket" OnClick= "PurchaseTicket_Link" />
        </div>
    </form>
</body>
</html>