<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_View_Employee.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style6 {
            font-size: large;
        }
        .auto-style17 {
        }
        .auto-style19 {
            font-weight: 700;
        }
        .auto-style20 {
            width: 9px;
            height: 472px;
        }
        .auto-style21 {
            width: 763px;
            height: 472px;
        }
        .auto-style22 {
            width: 530px;
            height: 472px;
        }
        .auto-style23 {
            height: 472px;
        }
        .auto-style24 {
            width: 306px;
        }
        .auto-style26 {
            font-weight: 700;
            width: 500px;
        }
        .auto-style27 {
            font-size: small;
        }
        .auto-style28 {
            font-weight: 700;
            width: 500px;
            font-size: medium;
        }
        .auto-style29 {
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" Height="541px">
        <p style="font-weight: 700; font-size: x-large; text-align: center">

            View /Delete /Update Employee</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style20"></td>
                <td class="auto-style21">
                    <asp:Panel ID="Panel3" runat="server" Height="468px" style="background-color: #F0F0F0" Width="749px">
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style28"><strong><span class="auto-style27">Search Employee by User ID :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="auto-style6">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style27"></asp:TextBox>
                                    &nbsp;<asp:Button ID="Button3" runat="server" CssClass="btn btn-info" OnClick="Button3_Click" Text="Search" />
                                    </span><span class="auto-style27">&nbsp; </span></strong></td>
                                <td><strong><span class="auto-style6">&nbsp;</span><span><asp:Label ID="LabEmpSearch" runat="server" CssClass="auto-style27" Font-Bold="False" ForeColor="#FF3300"></asp:Label>
                                    </span></strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style19" colspan="2">
                                    <asp:Label ID="Label13" runat="server" Text="Update/Delete Employee" Visible="False" CssClass="auto-style27"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style28"><span class="auto-style27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                    <asp:Label ID="Label1" runat="server" CssClass="auto-style17" Text="Employee's Name" Visible="False"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;</span><span class="auto-style6"><strong style="font-weight: 700"><asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style27" Visible="False"></asp:TextBox>
                                    </strong></span></td>
                                <td><span class="auto-style27"><strong style="font-weight: 700">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
                                    </strong></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style26"> <span class="auto-style27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: 700">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="False" Text="Employee's Date-of-Birth" Visible="False"></asp:Label>
                                    </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> <span class="auto-style6"><strong style="font-weight: 700">
                                    <asp:TextBox ID="TextBox7" runat="server" Visible="False" CssClass="auto-style27"></asp:TextBox>
                                    <cc1:CalendarExtender ID="TextBox7_CalendarExtender" runat="server" BehaviorID="TextBox7_CalendarExtender" TargetControlID="TextBox7" />
                                    </strong></span></td>
                                <td><span class="auto-style27"><strong style="font-weight: 700">
                                    <asp:Label ID="Label7" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
                                    </strong></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style26"> <span class="auto-style27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: 700">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="False" style="text-align: left; " Text="Employee's Date-of-Joining" Visible="False"></asp:Label>
                                    </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> <span class="auto-style6"><strong style="font-weight: 700">
                                    <asp:TextBox ID="TextBox8" runat="server" style="margin-left: 0px" Visible="False" CssClass="auto-style27"></asp:TextBox>
                                    <cc1:CalendarExtender ID="TextBox8_CalendarExtender" runat="server" BehaviorID="TextBox8_CalendarExtender" TargetControlID="TextBox8" />
                                    </strong></span></td>
                                <td><span class="auto-style27"><strong style="font-weight: 700">
                                    <asp:Label ID="Label8" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
                                    </strong></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style26"> <span class="auto-style27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: 700">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="False" Text="User ID" Visible="False"></asp:Label>
                                    </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> <span class="auto-style6"><strong style="font-weight: 700">
                                    <asp:TextBox ID="TextBox9" runat="server" Visible="False" CssClass="auto-style27"></asp:TextBox>
                                    </strong></span></td>
                                <td><span class="auto-style27"><strong style="font-weight: 700">
                                    <asp:Label ID="Label9" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
                                    </strong></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style26"> <span class="auto-style27">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <span style="font-weight: 700">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="False" Text="Password" Visible="False"></asp:Label>
                                    </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> <span class="auto-style6"><strong style="font-weight: 700">
                                    <asp:TextBox ID="TextBox10" runat="server" Visible="False" TextMode="Password" CssClass="auto-style27"></asp:TextBox>
                                    </strong></span></td>
                                <td><span class="auto-style27"><strong style="font-weight: 700">
                                    <asp:Label ID="Label10" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
                                    </strong></span></td>
                            </tr>
                            <tr>
                                <td class="auto-style26">
                                    <asp:Panel ID="Panel4" runat="server" CssClass="auto-style27">
                                        <table class="auto-style1">
                                            <tr>
                                                <td class="auto-style24"><span class="auto-style6"><strong style="font-weight: 700"><span>
                                                    <asp:Label ID="Label12" runat="server" Text="Associated Departments" Visible="False" CssClass="auto-style29"></asp:Label>
                                                    </span></strong></span></td>
                                                <td><span class="auto-style6"><strong style="font-weight: 700"><span>
                                                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="depid" DataValueField="depid" Visible="False" CssClass="auto-style29">
                                                    </asp:CheckBoxList>
                                                    </span></strong></span></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <td><span class="auto-style27"><span style="font-weight: 700">
                                    <asp:Label ID="LabAssDep" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                    </span></span></td>
                            </tr>
                        </table>
                        <span class="auto-style6">
                        <strong style="font-weight: 700">
                        <br />
                        </strong><span style="font-weight: 700">&nbsp;&nbsp;&nbsp;
                        </span><strong style="font-weight: 700">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Update" Visible="False" CssClass="btn btn-info" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Delete " Visible="False" CssClass="btn btn-danger" Height="35px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        </strong>
                        
                        <span>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [depid] FROM [dep]"></asp:SqlDataSource>
                        </span>
                        
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [faculty]"></asp:SqlDataSource>
                        </span>
                     
                    </asp:Panel>
                </td>
                <td class="auto-style22">
                    <asp:Panel ID="Panel2" runat="server" Height="466px" style="margin-left: 11px; background-color: #F0F0F0;">
                        <span class="auto-style6"><strong style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List of Employees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                        <asp:Label ID="Label11" runat="server" Text="Click on Select to Copy Faculty ID to the textbox below" Visible="False" style="font-size: medium"></asp:Label>
                        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="facid" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="text-align: center; margin-left: 35px; font-size: medium;" Width="467px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-striped" Height="16px" PageSize="5">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="facid" HeaderText="Faculty ID " ReadOnly="True" SortExpression="facid" />
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#e0e0e0" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                        <strong>&nbsp;&nbsp;
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [faculty] WHERE [facid] = @original_facid AND [name] = @original_name AND [dob] = @original_dob AND [doj] = @original_doj" InsertCommand="INSERT INTO [faculty] ([facid], [name], [dob], [doj]) VALUES (@facid, @name, @dob, @doj)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [faculty]" UpdateCommand="UPDATE [faculty] SET [name] = @name, [dob] = @dob, [doj] = @doj WHERE [facid] = @original_facid AND [name] = @original_name AND [dob] = @original_dob AND [doj] = @original_doj">
                            <DeleteParameters>
                                <asp:Parameter Name="original_facid" Type="String" />
                                <asp:Parameter Name="original_name" Type="String" />
                                <asp:Parameter Name="original_dob" Type="String" />
                                <asp:Parameter Name="original_doj" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="facid" Type="String" />
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="dob" Type="String" />
                                <asp:Parameter Name="doj" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="dob" Type="String" />
                                <asp:Parameter Name="doj" Type="String" />
                                <asp:Parameter Name="original_facid" Type="String" />
                                <asp:Parameter Name="original_name" Type="String" />
                                <asp:Parameter Name="original_dob" Type="String" />
                                <asp:Parameter Name="original_doj" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        </strong></span>
                    </asp:Panel>
                </td>
                <td class="auto-style23"></td>
            </tr>
        </table>
    </asp:Panel>
    </asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <span class="auto-style6">Admin ID</span> :
    <asp:Label ID="LabUserId" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style6">Admin Username : </span>
<asp:Label ID="LabUserName" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
</asp:Content>


