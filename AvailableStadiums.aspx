<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AvailableStadiums.aspx.cs" Inherits="MileS3.AvailableStadiums" %>

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
                    <asp:BoundField DataField ="Name" HeaderText ="Stadium Name" />
                    <asp:BoundField DataField ="Location" HeaderText ="Location" />
                    <asp:BoundField DataField ="Capacity" HeaderText ="Capacity" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
