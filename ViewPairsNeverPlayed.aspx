<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPairsNeverPlayed.aspx.cs" Inherits="MileS3.ViewPairsNeverPlayed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Pairs never played against each other:<br />
            <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Club1" HeaderText="Club1" SortExpression="Club1" />
                    <asp:BoundField DataField="Club2" HeaderText="Club2" SortExpression="Club2" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MileS2ConnectionString %>" SelectCommand="SELECT * FROM [clubsNeverPlayedEachOther]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
