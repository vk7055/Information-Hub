<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_Allot_Group.aspx.cs" Inherits="Admin_student1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style6 {
            font-size: x-large;
            text-align: center;
        }
        .auto-style7 {
            font-size: x-large;
        }
        .auto-style11 {
            width: 339px;
        }
        .auto-style13 {
            width: 315px;
            text-align: center;
        }
        .auto-style14 {
            width: 323px;
        }
        .auto-style15 {
            width: 279px;
        }
        .auto-style16 {
            width: 149px;
        }
        .auto-style17 {
            width: 335px;
        }
        .auto-style19 {
            width: 297px;
        }
        .auto-style20 {
            width: 356px;
        }
        .auto-style21 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <span class="auto-style6">Admin ID</span> :
    <asp:Label ID="LabUserId" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style6">Admin Username : </span>
    <asp:Label ID="LabUserName" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <table class="auto-style1" style="width: 100%">
            <tr>
                <td class="auto-style13">
                        <strong><span class="auto-style6">Allot Groups to Students</span></strong></td>
                <td class="auto-style15" style="text-align: center"> <strong><span class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alloted Students</span></strong>&nbsp;&nbsp;</td>
                <td class="auto-style20">
                    <asp:Panel ID="Panel7" runat="server" style="text-align: left; margin-left: 31px">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" Text="Select Student" style="font-weight: 700; font-size: x-large" Visible="False"></asp:Label>
                    </asp:Panel>
                </td>
                <td class="auto-style19">
                    <asp:Panel ID="Panel6" runat="server">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:Label ID="Label1" runat="server" style="font-weight: 700; font-size: x-large; text-align: center" Text="Group Allotments" Visible="False"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <table class="auto-style1" style="width: 92%">
            <tr>
                <td class="auto-style11">
                    <table class="auto-style1">
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style16">Department of the Student(s)who has to be alloted the Group</td>
                            <td class="auto-style21">&nbsp;</td>
                            <td>&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="depid" DataValueField="depid">
        </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style16">Semester of the Student(s)&nbsp;who has to be alloted the Group</td>
                            <td class="auto-style21">&nbsp;</td>
                            <td><asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="sem" DataValueField="sem">
        </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style16">Course for which the allotment has to be done</td>
                            <td class="auto-style21">&nbsp;</td>
                            <td><asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="courseid" DataValueField="courseid">
        </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style21">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style16"><strong>Make a Single Group for all the above students</strong></td>
                            <td class="auto-style21">&nbsp;</td>
                            <td><asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="YES" CssClass="btn btn-info" Height="31px" Width="57px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="NO" CssClass="btn btn-danger" Height="31px" Width="49px" />
                            </td>
                        </tr>
                    </table>
                    <p style="text-align: center">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabNoStud" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <asp:Panel ID="Panel1" runat="server" Height="117px" style="margin-left: 12px; background-color: #F0F0F0;" Visible="False" Width="301px" BackColor="#FFFF99">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select a Group No.&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList6" runat="server">
            <asp:ListItem Value="g1">G1</asp:ListItem>
            <asp:ListItem Value="g2">G2</asp:ListItem>
            <asp:ListItem Value="g3">G3</asp:ListItem>
            <asp:ListItem Value="g4">G4</asp:ListItem>
            <asp:ListItem Value="g5">G5</asp:ListItem>
            <asp:ListItem Value="g6">G6</asp:ListItem>
            <asp:ListItem Value="g7">G7</asp:ListItem>
            <asp:ListItem Value="g8">G8</asp:ListItem>
            <asp:ListItem Value="g9">G9</asp:ListItem>
            <asp:ListItem Value="g10">G10</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="SUBMIT" CssClass="btn btn-success" />
    </asp:Panel>
                </td>
                <td class="auto-style14">
                    <asp:Panel ID="Panel5" runat="server" Height="384px" style="margin-left: 0px" Width="312px">
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource6" style="text-align: center; margin-left: 0px" Width="311px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-striped" Height="16px" PageSize="7">
                            <Columns>
                                <asp:BoundField DataField="courseid" HeaderText="Course ID" SortExpression="courseid" />
                                <asp:BoundField DataField="groupid" HeaderText="Group  ID" SortExpression="groupid" />
                                <asp:BoundField DataField="studentid" HeaderText="Student ID" SortExpression="studentid" />
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
                    </asp:Panel>
                </td>
                <td class="auto-style17">
                    <asp:Panel ID="Panel2" runat="server" BackColor="#FFFF99" BorderColor="Black" Height="398px" style="margin-left: 21px; margin-right: 0px; background-color: #F0F0F0;" Width="296px" Visible="False">
                        &nbsp;&nbsp;&nbsp;&nbsp;Select a <strong>Group ID</strong> from the Dropdown<br /> &nbsp;&nbsp;&nbsp; List and Press on <strong>Select </strong>Button to Add<br /> &nbsp;&nbsp;&nbsp; that student to the below selected group<br /> &nbsp;&nbsp;&nbsp; in the Dropdown List<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Select</strong> the Group ID&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList8" runat="server">
                            <asp:ListItem Value="g1">G1</asp:ListItem>
                            <asp:ListItem Value="g2">G2</asp:ListItem>
                            <asp:ListItem Value="g3">G3</asp:ListItem>
                            <asp:ListItem Value="g4">G4</asp:ListItem>
                            <asp:ListItem Value="g5">G5</asp:ListItem>
                            <asp:ListItem Value="g6">G6</asp:ListItem>
                            <asp:ListItem Value="g7">G7</asp:ListItem>
                            <asp:ListItem Value="g8">G8</asp:ListItem>
                            <asp:ListItem Value="g9">G9</asp:ListItem>
                            <asp:ListItem Value="g10">G10</asp:ListItem>
                            <asp:ListItem Value="g11">G11</asp:ListItem>
                            <asp:ListItem Value="g12">G12</asp:ListItem>
                            <asp:ListItem Value="g13">G13</asp:ListItem>
                            <asp:ListItem Value="g14">G14</asp:ListItem>
                            <asp:ListItem Value="g15">G15</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Table Containing <strong>Students</strong> of the above<br /> &nbsp;&nbsp;&nbsp;&nbsp; chosen <strong>Department </strong>and <strong>Semester</strong> that<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; have not been alloted to any Group Yet<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource4" Height="16px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="text-align: center; margin-left: 11px" Width="273px" AllowSorting="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-striped">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="studentid" HeaderText="Student ID" SortExpression="studentid" />
                                <asp:BoundField DataField="courseid" HeaderText="Course ID" SortExpression="courseid" />
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
                        <br />
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="Panel3" runat="server" BackColor="#66FF66" BorderColor="Black" Height="399px" style="margin-left: 13px; background-color: #F0F0F0;" Width="376px" Visible="False">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3" DataSourceID="SqlDataSource5" style="text-align: center; margin-left: 6px" Width="366px" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="table table-bordered table-striped" Height="16px" PageSize="7">
                            <Columns>
                                <asp:BoundField DataField="groupid" HeaderText="Group ID" SortExpression="groupid" />
                                <asp:BoundField DataField="studentid" HeaderText="Student ID" SortExpression="studentid" />
                                <asp:BoundField DataField="name" HeaderText="Student Name" SortExpression="name" />
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
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </asp:Panel>
                </td>
            </tr>
        </table>
        </p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [depid] FROM [course_sem_dep]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [sem] FROM [course_sem_dep] WHERE ([depid] = @depid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="depid" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [courseid] FROM [course_sem_dep] WHERE (([depid] = @depid) AND ([sem] = @sem))">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="depid" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DropDownList2" Name="sem" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [student_course] WHERE ([groupid] &lt;&gt; @groupid)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="groupid" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [studentid], [courseid] FROM [student_course] WHERE ([groupid] = @groupid)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="0" Name="groupid" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT student_course.groupid, student_course.studentid, student.name FROM student_course INNER JOIN student ON student_course.studentid = student.studentid WHERE (student_course.courseid = @cid) AND (student.depid = @did)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList3" Name="cid" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="DropDownList1" Name="did" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Content>

