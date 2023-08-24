<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteClub.aspx.cs" Inherits="MileS3.DeleteClub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please enter club name:<br />
            <br />
            <asp:TextBox ID="ClubName" runat="server" Width="154px"></asp:TextBox>
             <br />
            <br />
             <asp:Button ID="DeleteClubSubmit" runat="server" Text="Submit" OnClick="DeleteClubSubmit_Click1" />
        </div>
    </form>
</body>
</html>
