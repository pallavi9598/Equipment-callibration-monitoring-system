<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="sample.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .newStyle1 {
            font-family: "Arial Black";
            font-size: large;
            font-weight: bold;
            font-style: normal;
            font-variant: normal;
            text-transform: none;
            color: #000080;
        }
        .newStyle2 {
            font-weight: 500;
        }
        .newStyle3 {
            font-weight: bold;
            font-size: large;
        }
        .newStyle4 {
            font-size: xx-large;
        }
    </style>
    <h1 class="newStyle4">EQUIPMENT MASTER </h1>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="plant"></asp:Label>
                    </td>
                    <td colspan ="2">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem value="0">--choose-- </asp:ListItem>
                            <asp:ListItem>WRM</asp:ListItem>
                            <asp:ListItem>NBM</asp:ListItem>
                            <asp:ListItem>MM</asp:ListItem>
                            <asp:ListItem>LD1</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="section"></asp:Label>
                    </td>
                    <td colspan ="2">
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem value="0">--choose-- </asp:ListItem>
                            <asp:ListItem>Tech_services</asp:ListItem>
                            <asp:ListItem>operations</asp:ListItem>
                            <asp:ListItem>shipping</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="location_used"></asp:Label>
                    </td>
                    <td colspan ="2">
                        <asp:TextBox ID="Txtlocation_used" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="equipment_no"></asp:Label>
                    </td>
                    <td colspan ="2">
                        <asp:TextBox ID="Txtequipment_no" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="equipment_desc"></asp:Label>
                    </td>
                    <td colspan ="2" >
                        <asp:TextBox ID="Txtequipment_desc" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="equipment_type"></asp:Label>
                    </td>
                    <td colspan ="2" >
                        <asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem value="0">--choose-- </asp:ListItem>
                            <asp:ListItem>magnets</asp:ListItem>
                            <asp:ListItem>wagons</asp:ListItem>
                            <asp:ListItem>screens</asp:ListItem>
                            <asp:ListItem>boilers</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="range"></asp:Label>
                    </td>
                    <td colspan ="2" >
                        <asp:TextBox ID="Txtrange" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="accuracy"></asp:Label>
                    </td>
                    <td colspan ="2" >
                        <asp:TextBox ID="Txtaccuracy" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="frequency"></asp:Label>
                    </td>
                    <td colspan ="2" >
                        <asp:TextBox ID="Txtfrequency" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="last_calib_done_on"></asp:Label>
                    </td>
                    <td colspan ="2" >
                        <asp:TextBox ID="Txtlast_calib_done_on" runat="server"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="due_date"></asp:Label>
                    </td>
                    <td colspan ="2" >
                        <asp:TextBox ID="Txtdue_date" runat="server"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="status"></asp:Label>
                    </td>
                    <td colspan ="2" >
                        <asp:TextBox ID="Txtstatus" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="intimation_days"></asp:Label>
                    </td>
                    <td colspan ="2" >
                        <asp:DropDownList ID="DropDownList4" runat="server">
                            <asp:ListItem value="0">--choose-- </asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td >
                        
                    </td>
                    <td colspan ="2">
                        <asp:Button ID="Binsert" runat="server" Text="Insert" OnClick="Binsert_Click"  />
                        <asp:Button ID="Bupdate" runat="server" Text="update" OnClick="Bupdate_Click" />
                        <asp:Button ID="Bdelete" runat="server" Text="delete" OnClick="Bdelete_Click" />
                        <asp:Button ID="Bclear" runat="server" Text="clear" OnClick="Bclear_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblsucessmessage" runat="server" Text="" ForeColor ="Green" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblerrormessage" runat="server" Text="" ForeColor ="Red" ></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gcalibration" runat="server" AutoGenerateColumns="false" >
                <Columns>
                    <asp:BoundField DataField="plant" HeaderText="plant" />
                    <asp:BoundField DataField="section" HeaderText="section" />
                    <asp:BoundField DataField="location_used" HeaderText="location_used" />
                    <asp:BoundField DataField="equipment_no" HeaderText="equipment_no" />
                    <asp:BoundField DataField="equipment_type" HeaderText="equipment_type" />
                    <asp:BoundField DataField="range" HeaderText="range" />
                    <asp:BoundField DataField="intimation_days" HeaderText="intimation_days" />
                    <asp:BoundField DataField="last_calib_done_on" HeaderText="last_calib_done_on" />
                    <asp:BoundField DataField="due_date" HeaderText="due_date" />
                    <asp:BoundField DataField="status" HeaderText="status" />
                 </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
