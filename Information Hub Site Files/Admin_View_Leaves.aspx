<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_View_Leaves.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style6 {
        font-size: medium;
        text-align: center;
            background-color: #F0F0F0;
        }
    .auto-style7 {
        font-size: x-large;
        text-align: center;
        color: #33CCCC;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="auto-style6">
    &nbsp;</p>
<p class="auto-style7">
    <strong>Different Kind of Leaves</strong></p>
<p class="auto-style6">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="type" DataSourceID="LeaveType" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="text-align: center; margin-left: 108px; font-size: medium;" AllowPaging="True" CellPadding="3" Width="1012px" AllowSorting="True" CssClass="table table-bordered table-striped" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Height="32px" PageSize="5">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
            <asp:BoundField DataField="type" HeaderText="Leave Code" ReadOnly="True" SortExpression="type" />
            <asp:BoundField DataField="name" HeaderText="Leave Name" SortExpression="name" />
            <asp:BoundField DataField="max" HeaderText="Maximum Leave" SortExpression="max" />
            <asp:BoundField DataField="carryflag" HeaderText="Carry Forward (1-YES ; 0- NO)" SortExpression="carryflag" />
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
    <asp:SqlDataSource ID="LeaveType" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [leave_type] WHERE [type] = @original_type AND [name] = @original_name AND [max] = @original_max AND [carryflag] = @original_carryflag" InsertCommand="INSERT INTO [leave_type] ([type], [name], [max], [carryflag]) VALUES (@type, @name, @max, @carryflag)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [leave_type]" UpdateCommand="UPDATE [leave_type] SET [name] = @name, [max] = @max, [carryflag] = @carryflag WHERE [type] = @original_type AND [name] = @original_name AND [max] = @original_max AND [carryflag] = @original_carryflag">
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
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <span class="auto-style6">Admin ID</span> :
    <asp:Label ID="LabUserId" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style6">Admin Username : </span>
<asp:Label ID="LabUserName" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
</asp:Content>


