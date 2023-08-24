<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseTicket.aspx.cs" Inherits="MileS3.PurchaseTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Host Club Name:<br />
            <asp:TextBox ID="Host_Club_Name" runat="server"></asp:TextBox>
            <br />
            <br />
            Guest Club Name:<br />
            <asp:TextBox ID="Guest_Club_Name" runat="server"></asp:TextBox>
            <br />
            <br />
            Start Time:<br />
            <asp:TextBox ID="StartTime" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="PurchaseTicket_" runat="server" Text="Purchase Ticket" OnClick = "PurchaseTicket_Link"/>
            <br />
        </div>
    </form>
</body>
</html>