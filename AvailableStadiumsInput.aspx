<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AvailableStadiumsInput.aspx.cs" Inherits="MileS3.AvailableStadiumsInput" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Input Date:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="availableStadiums" runat="server" Text="Submit" OnClick="availableStadiums_Click" />

        </div>
    </form>
</body>
</html>
