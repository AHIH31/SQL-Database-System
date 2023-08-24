<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAllMatches2.aspx.cs" Inherits="MileS3.ViewAllMatches2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView" runat="server" AutoGenerateColumns ="false">
                <Columns>
                    <asp:BoundField DataField ="HostClubName" HeaderText ="Host Name" />
                    <asp:BoundField DataField ="GuestClubName" HeaderText ="Guest Name" />
                    <asp:BoundField DataField ="StartTime" HeaderText ="Start Time" />
                    <asp:BoundField DataField ="EndTime" HeaderText ="End Time" />

                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
