<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRep.aspx.cs" Inherits="MileS3.ClubRep" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="ClubInfo" runat="server" Text="Club Info" OnClick="ClubInfo_Click" />
            <asp:Button ID="UpcomingMatches" runat="server" Text="Upcoming Matches" OnClick="UpcomingMatches_Click" />
            <asp:Button ID="AvailableStadiums" runat="server" Text="Available Stadiums" OnClick="AvailableStadiums_Click"/>
            <asp:Button ID="HostRequest" runat="server" Text="Send Host Request" OnClick="HostRequest_Click" />
        </div>
    </form>
</body>
</html>
