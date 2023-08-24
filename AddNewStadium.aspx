<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewStadium.aspx.cs" Inherits="MileS3.AddNewStadium" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            New stadium details<br />
            <br />
            Name:<asp:TextBox ID="sName" runat="server"></asp:TextBox>
            <br />
            <br />
            Location:<asp:TextBox ID="sLocation" runat="server"></asp:TextBox>
            <br />
            <br />
            Capacity:<asp:TextBox ID="sCapacity" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="NewStadiumSubmit" runat="server" Text="Submit" OnClick="AddStadiumSubmit_Click" />
            <br />

        </div>
    </form>
</body>
</html>
