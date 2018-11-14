<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Fac_Resource.aspx.cs" Inherits="Fac_Resource" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span class="auto-style10">File Approroval </span></strong>
    <table class="auto-style8">
        <tr>
          
            <td class="auto-style9">
                &nbsp;</td>
            <td> &nbsp;</td>
        </tr>
    </table>
    
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="courseid" DataValueField="courseid">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [courseid] FROM [course_fac] WHERE ([facid] = @facid)">
        <SelectParameters>
            <asp:SessionParameter Name="facid" SessionField="id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <br />
    <strong><span class="auto-style7">&nbsp;&nbsp;&nbsp;</span><asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="FileID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="613px">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
            <asp:BoundField DataField="FileID" HeaderText="FileID" InsertVisible="False" ReadOnly="True" SortExpression="FileID" />
            <asp:BoundField DataField="f_name" HeaderText="File Name" SortExpression="f_name" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
            <asp:BoundField DataField="u_date" HeaderText="Upload Date" SortExpression="u_date" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [File].FileID, [File].f_name, [File].description, [File].u_date FROM [File] INNER JOIN File_course ON [File].FileID = File_course.FileID WHERE (File_course.courseid = @cid) AND (File_course.facid = @fid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="cid" PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="none" Name="fid" />
        </SelectParameters>
    </asp:SqlDataSource>
    </strong><br />
    <style>
        .Scrollgrid
            {
                OVERFLOW: auto; BORDER-LEFT: #000000 1px; WIDTH: 20%; 
BORDER-BOTTOM: #000000 1px; HEIGHT: 137px;
                
                scrollbar-arrow-color:#9C3842;
                scrollbar-base-color:#003366;
                scrollbar-face-color:#e7e7e7;
                scrollbar-highlight-color:#ffffff;
                scrollbar-shadow-color:#9C3842;   
   
            } 
    </style>
 <div class="container-fluid">   
        
    <br />
    <br />
    <style>
        .normal_text
            {
                font-size:20px;
                font :bolder;
            }   
        .watermarked
            {
                 color: #CCC7C7;
                 font-size: 20px;
            }
        .auto-style8 {
            width: 100%;
        }
        .auto-style9 {
            width: 157px;
        }
    .auto-style10 {
        font-size: x-large;
    }
    </style>
    <br /><br />
    <br />
    <br />
    <br /></div>

</asp:Content>

