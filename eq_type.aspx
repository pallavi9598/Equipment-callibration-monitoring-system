<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="eq_type.aspx.cs" Inherits="sample.eq_type" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .newStyle1 {
            font-size: medium;
            background-color: #99CCFF;
        }
    </style>
    <h1>EQUIPMENT DETAILS</h1>
    <h2 class="newStyle1">**ENTER EQUIPMENT NUMBER TO DISPLAY EQUIPMENT DETAILS**</h2>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <p>
            <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="plant"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Value="0">--select--</asp:ListItem>
                <asp:ListItem>WRM</asp:ListItem>
                <asp:ListItem>NBM</asp:ListItem>
                <asp:ListItem>MM</asp:ListItem>
                <asp:ListItem>LD1</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="section"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Value="0">--select--</asp:ListItem>
                <asp:ListItem>tech_services</asp:ListItem>
                <asp:ListItem>operations</asp:ListItem>
                <asp:ListItem>shipping</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="equipment_type"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem Value="0">--select--</asp:ListItem>
                <asp:ListItem>magnets</asp:ListItem>
                <asp:ListItem>wagons</asp:ListItem>
                <asp:ListItem>screens</asp:ListItem>
                <asp:ListItem>boilers</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="Label7" runat="server" Text="location_used"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label8" runat="server" Text="equipment_no"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Bdisplay" runat="server"  Text="display" OnClick="Bdisplay_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Bsave" runat="server" OnClick="Bsave_Click" Text="save" />
        </p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p>
                        <asp:Label ID="lblsucessmessage" runat="server" Text="" ForeColor ="Green" ></asp:Label>
                    </p>
                                   
                    <p>
                        <asp:Label ID="lblerrormessage" runat="server" Text="" ForeColor ="Red" ></asp:Label>
                    </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="plant" HeaderText="plant" />
                    <asp:BoundField DataField="section" HeaderText="section" />
                    <asp:BoundField DataField="location_used" HeaderText="location_used" />
                    <asp:BoundField DataField="equipment_no" HeaderText="equipment_no" />
                    <asp:BoundField DataField="equipment_type" HeaderText="equipment_type" />
                    <asp:BoundField DataField="last_calib_done_on" HeaderText="last_calib_done_on" />
                    <asp:BoundField DataField="due_date" HeaderText="due_date" />
                </Columns>
            </asp:GridView>
        </p>
    </form>
</body>
</html>
