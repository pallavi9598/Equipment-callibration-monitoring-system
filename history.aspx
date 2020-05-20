<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="sample.history" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .newStyle1 {
            font-size: small;
            text-decoration: blink;
            font-style: oblique;
            color: #000000;
            background-color: #CCCCFF;
        }
        .newStyle1 {
            font-family: "Arial Black";
            font-size: medium;
            font-weight: bold;
            font-style: oblique;
            font-variant: small-caps;
            text-transform: capitalize;
            color: #FF5050;
            text-decoration: blink;
        }
    </style>
    <h1>EQUIPMENT DETAILS</h1>
    <h2 class="newStyle1">**ENTER EQUIPMENT NUMBER TO DISPLAY EQUIPMENT DETAILS**</h2>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>
        <asp:Label ID="Label1" runat="server" Text="equipment_number"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Bdisplay" runat="server" OnClick="Bdisplay_Click" Text="DISPLAY" Width="152px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="Bexcel" runat="server" OnClick="Bexcel_Click" Text="EXCEL DOWNLOAD" />
&nbsp;<p>
                        <asp:Label ID="lblsucessmessage" runat="server" Text="" ForeColor ="Green" ></asp:Label>
                    </p>
                                   
                    <p>
                        <asp:Label ID="lblerrormessage" runat="server" Text="" ForeColor ="Red" ></asp:Label>
                    </p>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" >
            <Columns>
                    <asp:BoundField DataField="plant" HeaderText="plant" />
                    <asp:BoundField DataField="section" HeaderText="section" />
                    <asp:BoundField DataField="location_used" HeaderText="location" />
                    <asp:BoundField DataField="equipment_no" HeaderText="equipment number" />
                    <asp:BoundField DataField="equipment_type" HeaderText="equipment type" />
                    <asp:BoundField DataField="last_calib_done_on" HeaderText="calibration done" />
                    <asp:BoundField DataField="due_date" HeaderText="due date" />
                </Columns>
        </asp:GridView>
    </form>
</body>
</html>
