<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAllMatches.aspx.cs" Inherits="MileS3.Fan" %>

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
                    <asp:BoundField DataField ="Host" HeaderText ="Host Name" />
                    <asp:BoundField DataField ="Guest" HeaderText ="Guest Name" />
                    <asp:BoundField DataField ="Start" HeaderText ="Start Time" />
                    <asp:BoundField DataField ="EndTime" HeaderText ="End Time" />
                    <asp:BoundField DataField ="StadiumName" HeaderText ="Stadium Name" />

                </Columns>
            </asp:GridView>
            <br/>
        </div>
    </form>
</body>
</html>
