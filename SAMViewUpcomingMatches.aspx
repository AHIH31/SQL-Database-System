<head runat="server">
    <title></title>
</head>
<p>
    <br />
    Upcoming Matches:</p>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <form id="form1" runat="server">
        <div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="host" HeaderText="host" SortExpression="host" />
                    <asp:BoundField DataField="guest" HeaderText="guest" SortExpression="guest" />
                    <asp:BoundField DataField="start_time" HeaderText="start_time" SortExpression="start_time" />
                    <asp:BoundField DataField="end_time" HeaderText="end_time" SortExpression="end_time" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MileS2ConnectionString %>" SelectCommand="SELECT * FROM [allUpcomingMatches]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
