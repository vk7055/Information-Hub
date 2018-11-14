<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_Admin_Modify.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
    .auto-style6 {
        font-size: x-large;
        color: #33CCCC;
    }
        .auto-style7 {
            width: 282px;
            height: 345px;
        }
        .auto-style8 {
            width: 291px;
            height: 345px;
        }
        .auto-style9 {
            width: 400px;
            height: 345px;
            background-color: #F0F0F0;
        }
        .auto-style10 {
            width: 397px;
        }
        .auto-style11 {
            width: 283px;
        }
        .auto-style12 {
            width: 292px;
        }
        .auto-style14 {
            font-size: x-large;
        }
        .auto-style15 {
            height: 345px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        <span class="auto-style14">Admin ID :</span>
        <asp:Label ID="Label1" runat="server" style="color: #FFFFFF; font-size: x-large;"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style14">Admin Username : </span>
        <asp:Label ID="Label2" runat="server" style="color: #FFFFFF" CssClass="auto-style14"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style6" style="text-align: center">
        <strong>View / Update / Delete Admin</strong></p>
    <asp:Panel ID="Panel1" runat="server" Height="398px" style="margin-left: 24px" Width="1256px">
        <table class="auto-style1">
            <tr>
                <td class="auto-style10"><strong>&nbsp;&nbsp;&nbsp; Search</strong>&nbsp;Admin by User ID</td>
                <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Simple Admin</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Leave Mediators&nbsp;&nbsp;&nbsp;
                    </strong>&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Leave Issuers&nbsp;&nbsp;&nbsp; </strong>
                    &nbsp;&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1" style="width: 99%; height: 360px;">
            <tr>
                <td class="auto-style9">
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                    </p>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Search" CssClass="btn btn-primary" />
                        &nbsp;</p>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text="Admin User ID" Visible="False"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label7" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </p>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label5" runat="server" Text="Admin Username" Visible="False"></asp:Label>
                    </p>
                    <p>
                        &nbsp;&nbsp; &nbsp;
                        <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label8" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </p>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" Text="Admin Password" Visible="False"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox4" runat="server" Visible="False" TextMode="Password"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label9" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </p>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Update" Visible="False" CssClass="btn btn-info" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Delete" Visible="False" CssClass="btn btn-danger" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Close" Visible="False" CssClass="btn btn-warning" />
                    </p>
                </td>
                <td class="auto-style7">
                    <asp:Panel ID="Panel2" runat="server" Height="404px">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="text-align: center; margin-left: 11px" Width="249px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-striped" Height="16px" PageSize="6">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="Id" HeaderText="User ID" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
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
                    </asp:Panel>
                </td>
                <td class="auto-style8">
                    <asp:Panel ID="Panel3" runat="server" Height="394px">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" style="text-align: center; margin-left: 14px" Width="266px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-striped" Height="16px" PageSize="6">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="Id" HeaderText="User ID" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#e0e0e0"/>
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
                <td class="auto-style15">
                    <asp:Panel ID="Panel4" runat="server" Height="395px">
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" style="text-align: center; margin-left: 16px" Width="236px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-striped" Height="16px" PageSize="6">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="Id" HeaderText="User ID" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#e0e0e0"/>
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [username], [password] FROM [loginDB] WHERE ([usertype] = @usertype)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="usertype" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [username], [password] FROM [loginDB] WHERE ([usertype] = @usertype)">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="usertype" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [username], [password] FROM [loginDB] WHERE ([usertype] = @usertype)">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="usertype" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Content>

