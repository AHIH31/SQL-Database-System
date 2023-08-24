<p>
    &nbsp;</p>
<p>
    &nbsp;</p>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addNewClub.aspx.cs" Inherits="MileS3.addNewClub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
    Club Name:</p>
        <div>
    <asp:TextBox ID="ClubName" runat="server" ></asp:TextBox>
        </div>
<p>
    Location:</p>
        <p>
    <asp:TextBox ID="Location" runat="server" ></asp:TextBox>
        </p>
        <p>

<asp:Button ID="NewClubSubmit" runat="server" Text="Submit" OnClick="NewClubSubmit_Click" />

        </p>
    </form>
</body>
</html>
