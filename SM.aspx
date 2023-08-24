<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SM.aspx.cs" Inherits="MileS3.SM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" BackColor="#66FF33" BorderColor="#FF0066" BorderStyle="Solid" ForeColor="#003399" Text="Stadium details "></asp:Label>
        </div>
        <asp:GridView ID="gridStaidumDetails" runat="server" AutoGenerateColumns ="false">
                 <Columns>
                    <asp:BoundField DataField ="Stadium_ID" HeaderText ="Stadium_ID" />
                    <asp:BoundField DataField ="Stadium_name" HeaderText ="Stadium Name" />
                    <asp:BoundField DataField ="location" HeaderText ="Location" />
                    <asp:BoundField DataField ="Capacity" HeaderText ="Capacity" />
                    <asp:BoundField DataField ="Status" HeaderText ="Stadium" />

                </Columns>
        </asp:GridView>
       <br />
        <br />
           <asp:Label ID="Label2" runat="server" BackColor="#66FF33" BorderColor="#FF0066" BorderStyle="Solid" ForeColor="#003399" Text="Host Requests details "></asp:Label>

        <asp:GridView ID="gridRequestDetails" runat="server" AutoGenerateColumns ="False">
                 <Columns>
                    <asp:BoundField DataField ="Club_Representative_Name" HeaderText ="Club Representative Name" />
                    <asp:BoundField DataField ="Host_Club_Name" HeaderText ="Host Club Name" />
                    <asp:BoundField DataField ="Guest_Club_Name" HeaderText ="Guest Club Name" />
                    <asp:BoundField DataField ="start_time" HeaderText ="Start Time" />
                    <asp:BoundField DataField ="end_time" HeaderText ="End Time" />

                     <asp:BoundField DataField="ReqStatus" HeaderText="Request Status" ReadOnly="True" SortExpression="ReqStatus" />

                </Columns>
        </asp:GridView>
        <br />
             <asp:Label ID="Label3" runat="server" Text="Host Club Name: "></asp:Label>
        <asp:TextBox ID="hostName" runat="server"></asp:TextBox>
             <br />
             <br />
             <asp:Label ID="Label4" runat="server" Text="Guest Club Name: "></asp:Label>
        <asp:TextBox ID="guestName" runat="server"></asp:TextBox>
             <br />
             <br />
             <asp:Label ID="Label5" runat="server" Text="Match Start Time: "></asp:Label>
        <asp:TextBox ID="startTime" runat="server"></asp:TextBox>
           <br />
             <br />
            <asp:Button ID="acceptBtn" runat="server" OnClick="acceptBtn_Click" Text="Accept unhandled request" />
            <asp:Button ID="rejBtn" runat="server" OnClick="rejBtn_Click" Text="Reject unhandled request" />
    </form>
</body>
</html>
