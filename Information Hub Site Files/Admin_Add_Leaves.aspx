<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_Add_Leaves.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style6 {
        width: 564px;
    }
    #Tablet {
        width: 68%;
    }
    .auto-style7 {
        width: 772px;
    }
    .auto-style8 {
        font-size: x-large;
        margin-left: 40px;
    }
        .auto-style13 {
            width: 228px;
            text-align: left;
        }
        .auto-style14 {
            width: 188px;
            text-align: left;
        }
        .auto-style15 {
            font-size: large;
        }
    .auto-style16 {
        font-size: x-large;
        color: #33CCCC;
    }
    .auto-style17 {
        width: 188px;
        text-align: left;
        height: 42px;
    }
    .auto-style18 {
        width: 228px;
        text-align: left;
        height: 42px;
    }
        .auto-style19 {
            font-weight: normal;
        }
        .auto-style20 {
            width: 125px;
        }
        .auto-style21 {
            width: 570px;
        }
        .auto-style22 {
            width: 9px;
            text-align: left;
        }
        .auto-style23 {
            width: 9px;
            text-align: left;
            height: 42px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style16" style="text-align: center">
        <strong>View / Add / Update / Delete Leave</strong></p>
    <table class="auto-style1">
        <tr>
            <td>
        <strong style="margin-left: 40px"><span class="auto-style15">Add a new Leave Type</span><span class="auto-style8">&nbsp;</span><asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Add New Leave Type" />
        </strong></td>
            <td><span class="auto-style8"><strong style="font-size: large">View All Leaves&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Show" />
        </span></td>
        </tr>
        <tr>
            <td>
    <span class="auto-style15">
    <asp:Panel ID="Panel2" runat="server" BackColor="#FFFFCC" BorderStyle="Dotted" Height="277px" style="font-size: medium; margin-left: 25px" Visible="False" Width="683px">
        <p style="margin-left: 40px">
            &nbsp;</p>
        <p style="margin-left: 40px">
            <asp:Label ID="Label1" runat="server" Text="Complete Name of the Leave"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;<asp:Label ID="LabCompName" runat="server" ForeColor="Red"></asp:Label>
        </p>
        <p style="margin-left: 40px">
            <asp:Label ID="Label2" runat="server" Text="Short Name for the Leave"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            &nbsp;<asp:Label ID="LabShortName" runat="server" ForeColor="Red"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
        <p style="margin-left: 40px">
            <asp:Label ID="Label3" runat="server" Text="Allow Leave Accumulation"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="CheckBox6" runat="server" OnCheckedChanged="CheckBox6_CheckedChanged" Text="Yes" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
        <table id="Tablet" border="0" class="auto-style1" draggable="true">
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style7">
                    <asp:Label ID="Label4" runat="server" Text="Maximum no. of Leaves of the above selected type                       (in Days)"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="NaturalNo" DataValueField="NaturalNo" style="margin-left: 0px">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add" />
    </asp:Panel>
        </span>
            </td>
            <td>
    <p style="margin-left: 40px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label13" runat="server" Text="Click on Select to Copy Leave Code to the textbox of Search Leave" Visible="False"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="type" DataSourceID="SqlDataSourceLeaveType" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="text-align: center; margin-left: 25px; margin-top: 0px;" Visible="False" Width="513px" CellPadding="4" ForeColor="#333333" AllowSorting="True" PageSize="5">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="type" HeaderText="Leave Code" ReadOnly="True" SortExpression="type" />
                <asp:BoundField DataField="name" HeaderText="Leave Name" SortExpression="name" />
                <asp:BoundField DataField="max" HeaderText="Maximum" SortExpression="max" />
                <asp:BoundField DataField="carryflag" HeaderText="Carry Forward (0 - No; 1 - Yes)" SortExpression="carryflag" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </p>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
    <strong><span class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Search Leave by Leave Code</span></strong>&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Search" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label9" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td> <strong><span class="auto-style15">&nbsp;&nbsp;&nbsp; Allot Existing Leaves for a new Year&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="ALLOT" />
                </span></strong>
            </td>
        </tr>
        <tr>
            <td>
    <asp:Panel ID="Panel3" runat="server" BackColor="#CCFFCC" BorderStyle="Dotted" Height="267px" style="margin-left: 27px" Visible="False" Width="678px">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" style="text-align: center" Text="Complete Name of the Leave"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox4" runat="server" style="text-align: left"></asp:TextBox>
        &nbsp;
        <asp:Label ID="Label11" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Text="Short Name for the Leave"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        &nbsp;
        <asp:Label ID="Label12" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <table class="auto-style1" draggable="true" style="width: 80%">
            <tr>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style14">
                    <asp:Label ID="Label7" runat="server" style="text-align: left" Text="Allow Leave Accumulation"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:CheckBox ID="CheckBox7" runat="server" Text="Yes" />
                </td>
            </tr>
            <tr>
                <td class="auto-style23">&nbsp;</td>
                <td class="auto-style17">
                    <asp:Label ID="Label8" runat="server" Text="Maximum no. of Leaves of the above selected type (in Days)"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Update" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Delete" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="CLOSE" />
    </asp:Panel>
            </td>
            <td> <strong><span class="auto-style15"> <span class="auto-style19">
    <asp:Panel ID="Panel1" runat="server" BackColor="#FFFF99" BorderStyle="Dotted" Height="180px" style="margin-left: 49px" Visible="False" Width="433px">
        <div class="auto-style2">
            <br />
            Choose the Year&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>2015</asp:ListItem>
                <asp:ListItem>2016</asp:ListItem>
                <asp:ListItem>2017</asp:ListItem>
                <asp:ListItem>2018</asp:ListItem>
                <asp:ListItem>2019</asp:ListItem>
                <asp:ListItem>2020</asp:ListItem>
                <asp:ListItem>2021</asp:ListItem>
                <asp:ListItem>2022</asp:ListItem>
                <asp:ListItem>2023</asp:ListItem>
                <asp:ListItem>2024</asp:ListItem>
                <asp:ListItem>2025</asp:ListItem>
                <asp:ListItem>2026</asp:ListItem>
                <asp:ListItem>2027</asp:ListItem>
                <asp:ListItem>2028</asp:ListItem>
                <asp:ListItem>2029</asp:ListItem>
                <asp:ListItem>2030</asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="ADD" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="CLOSE" />
            <br />
            <br />
            <strong><span class="auto-style15"><span class="auto-style19">
            <asp:Label ID="Label14" runat="server" ForeColor="Red" Text="Some Leave Already Issued For the Selected Year" Visible="False"></asp:Label>
            </span></span></strong>
        </div>
    </asp:Panel>
    </span> </span></strong>
            </td>
        </tr>
    </table>
    <p style="margin-left: 40px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span class="auto-style15"><span class="auto-style19"><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [NaturalNo]" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
    </span> </span></strong>
    &nbsp;<asp:SqlDataSource ID="SqlDataSourceLeaveType" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [leave_type] WHERE [type] = @original_type AND [name] = @original_name AND [max] = @original_max AND [carryflag] = @original_carryflag" InsertCommand="INSERT INTO [leave_type] ([type], [name], [max], [carryflag]) VALUES (@type, @name, @max, @carryflag)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [leave_type]" UpdateCommand="UPDATE [leave_type] SET [name] = @name, [max] = @max, [carryflag] = @carryflag WHERE [type] = @original_type AND [name] = @original_name AND [max] = @original_max AND [carryflag] = @original_carryflag">
            <DeleteParameters>
                <asp:Parameter Name="original_type" Type="String" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_max" Type="Int32" />
                <asp:Parameter Name="original_carryflag" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="max" Type="Int32" />
                <asp:Parameter Name="carryflag" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="max" Type="Int32" />
                <asp:Parameter Name="carryflag" Type="Int32" />
                <asp:Parameter Name="original_type" Type="String" />
                <asp:Parameter Name="original_name" Type="String" />
                <asp:Parameter Name="original_max" Type="Int32" />
                <asp:Parameter Name="original_carryflag" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
<br />
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <span class="auto-style6">Admin ID</span> :
    <asp:Label ID="LabUserId" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style6">Admin Username : </span>
<asp:Label ID="LabUserName" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
</asp:Content>


