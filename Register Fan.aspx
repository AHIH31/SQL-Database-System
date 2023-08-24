<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register Fan.aspx.cs" Inherits="MileS3.Register_Fan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Name:
            <br />
            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            <br />
            <br />
            Username:<br />
            <asp:TextBox ID="Username" runat="server"></asp:TextBox>
            <br />
            <br />
            Password:<br />
            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
            <br />
            <br />
            National ID Number:<br />
            <asp:TextBox ID="NationalIdNumber" runat="server"></asp:TextBox>
            <br />
            <br />
            Phone Number:<br />
            <asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox>
            <br />
            <br />
            Birthdate:<br />
            <asp:TextBox ID="BirthDate" runat="server"></asp:TextBox>
            <br />
            <br />
            Address:<br />
            <asp:TextBox ID="Address" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="NewFanSubmit" runat="server"  Text="Submit" OnClick = "NewFanSubmit_Link" />
        </div>
    </form>
</body>
</html>