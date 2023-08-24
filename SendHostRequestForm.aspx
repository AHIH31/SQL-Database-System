<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendHostRequestForm.aspx.cs" Inherits="MileS3.SendHostRequestForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="Label1" runat="server" Text="Stadium Name: "></asp:Label>

            <asp:TextBox ID="Stadium" runat="server"></asp:TextBox>
            <br />
            Start Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Start" runat="server"></asp:TextBox>

            <br />
            <asp:Button ID="SendHostRequest" runat="server" Text="Submit" OnClick="SendHostRequest_Click" />

        </div>
    </form>
</body>
</html>
