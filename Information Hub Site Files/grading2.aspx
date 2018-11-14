<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="grading2.aspx.cs" Inherits="grading2" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style4 {
            width: 265px;
        }
        .auto-style5 {
            color: #0000FF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
    <tr>
        <td id="cont" style="background: linear-gradient(90deg,white,#aef5ec,white,#aef5ec,white)">
            <div>

                <asp:Panel ID="Panel5" runat="server">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style4">
                                <asp:Panel ID="Panel6" runat="server" Height="680px">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View All" Visible="False" CssClass="btn btn-primary" />
                                    <br />
                                    <span class="auto-style5">Overall performance ::::</span><asp:GridView ID="GridView2" runat="server" Height="16px">
                                    </asp:GridView>
                                    <br />
                                    <br />
                                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Export to pdf" CssClass="btn btn-info" />
                                    <br />
                                    <br />
                                    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="View Over-all performance in graph" Width="267px" Visible="False" CssClass="btn btn-success" />
                                    <br />
                                    <br />
                                    <asp:Chart ID="Chart2" runat="server" Width="600px" >
                                        <Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                                <AxisY Title="Number of student " Minimum="0" Maximum="50"></AxisY>
                                                <AxisX Title="Marks "></AxisX>
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:Panel ID="Panel7" runat="server" Height="680px">
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Search" CssClass="btn btn-danger" />
                                    <br />
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text="Enter Roll no OF particular student  :    " Visible="False"></asp:Label>
                                    <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Label2" Visible="False"></asp:Label>
                                    <br />
                                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Submit" Visible="False" CssClass="btn btn-success" Height="29px" Width="92px" />
                                    <br />
                                    <br />
                                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-bordered table-striped" Height="16px">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="exam_name" HeaderText="exam_name" SortExpression="exam_name" />
                                            <asp:BoundField DataField="weightage" HeaderText="weightage" SortExpression="weightage" />
                                            <asp:BoundField DataField="max_marks" HeaderText="max_marks" SortExpression="max_marks" />
                                            <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" />
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT exam.exam_name, exam.weightage, exam.max_marks, marks.marks FROM exam INNER JOIN marks ON exam.examid = marks.examid WHERE (exam.facid = @fid) AND (exam.courseid = @cid) AND (exam.groupid = @gid) AND (marks.studentid = @sid)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="fid" SessionField="id" />
                                            <asp:SessionParameter Name="cid" SessionField="courseid" />
                                            <asp:SessionParameter Name="gid" SessionField="groupid" />
                                            <asp:ControlParameter ControlID="TextBox1" Name="sid" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="View performance in graph" Height="26px" Visible="False" CssClass="btn btn-success" />
                                    <br />
                                    <br />
                                    <asp:Chart ID="Chart1" runat="server" Width="600px">
                                        <Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

            </div><br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br /></td>
    </tr>
</table>
</asp:Content>

