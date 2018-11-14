<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="courses.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
    .auto-style7 {
        width: 100%;
        border-style: solid;
        border-width: 1px;
    }
    .auto-style10 {
        text-decoration: underline;
        color: #0000CC;
    }
        .auto-style11 {
            width: 233px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <span class="auto-style10"><strong>COURSES</strong></span><br />
<table class="auto-style7">
    <tr>
        <td class="auto-style11">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="courseid" DataSourceID="SqlDataSource1" Width="325px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table table-bordered table-striped" Height="16px">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                    <asp:BoundField DataField="coursename" HeaderText="coursename" SortExpression="coursename" />
                    <asp:BoundField DataField="courseid" HeaderText="courseid" ReadOnly="True" SortExpression="courseid" />
                    <asp:BoundField DataField="groupid" HeaderText="groupid" SortExpression="groupid" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT course_fac.groupid, course.coursename, course.courseid FROM course_fac INNER JOIN course ON course_fac.courseid = course.courseid WHERE (course_fac.facid = @fid)">
                <SelectParameters>
                    <asp:SessionParameter Name="fid" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="Button1" runat="server" Text="View Student Information" CssClass="btn btn-warning" />
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="coursename" DataValueField="courseid" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="groupid" DataValueField="groupid" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [groupid] FROM [course_fac] WHERE (([courseid] = @courseid) AND ([facid] = @facid))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="courseid" PropertyName="SelectedValue" Type="String" />
                    <asp:SessionParameter Name="facid" SessionField="id" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT course.coursename, course.courseid FROM course INNER JOIN course_fac ON course.courseid = course_fac.courseid WHERE (course_fac.facid = @fid)">
                <SelectParameters>
                    <asp:SessionParameter Name="fid" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table table-bordered table-striped" Height="16px">
                <Columns>
                    <asp:BoundField DataField="studentid" HeaderText="studentid" SortExpression="studentid" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="depid" HeaderText="depid" SortExpression="depid" />
                    <asp:BoundField DataField="sem" HeaderText="sem" SortExpression="sem" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT student_course.studentid, student.name, student.depid, student.sem FROM student_course INNER JOIN student ON student_course.studentid = student.studentid WHERE (student_course.courseid = @courseid) AND (student_course.groupid = @groupid) ORDER BY student_course.studentid">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="courseid" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="groupid" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style11">
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Export student Information into pdf" Width="251px" CssClass="btn btn-success" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style11">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style11">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

