<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_Courses.aspx.cs" Inherits="Default6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style14 {
            width: 309px;
        }
        .auto-style10 {
            width: 186px;
        }
        .auto-style15 {
            width: 309px;
        }
        .auto-style12 {
            width: 186px;
        }
        .auto-style27 {
            height: 653px;
        }
        .auto-style32 {
            width: 16px;
        }
        .auto-style35 {
            width: 333px;
        }
        .auto-style36 {
            height: 653px;
            width: 333px;
        }
        .auto-style37 {
            width: 549px;
        }
        .auto-style38 {
            height: 653px;
            width: 549px;
        }
    
        .auto-style6 {
            font-size: x-large;
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
    <p style="font-weight: 700; font-size: x-large; text-align: center">

        Manage Courses</p>
    <table class="auto-style1" style="height: 649px">
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add Course</strong></td>
            <td class="auto-style35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List of Courses</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="auto-style37">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Update / Delete Course" Visible="False" style="font-weight: 700"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="CLOSE" Visible="False" />
            </td>
        </tr>
        <tr>
            <td class="auto-style27">
                <asp:Panel ID="Panel3" runat="server" Height="589px" Width="461px">
                    <asp:Panel ID="Panel1" runat="server" BackColor="#CCFFFF" BorderColor="Black" BorderStyle="Dotted" Height="556px" style="margin-left: 15px; text-align: left;" Width="444px">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp; Course&nbsp;Name&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="LabCourseName" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp; Course Code&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="LabCourseCode" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <br />
                        <table class="auto-style1" style="width: 99%">
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style14">Select the Associated Departments</td>
                                <td class="auto-style10">
                                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="depid" DataValueField="depid">
                                        <asp:ListItem></asp:ListItem>
                                    </asp:CheckBoxList>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                <td>
                                    <asp:Label ID="LabAssDept" runat="server" ForeColor="Red"></asp:Label>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style14">Select the Number of Lectures in a Week</td>
                                <td class="auto-style10">
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style15">Select the Number of Tutorials in a Week</td>
                                <td class="auto-style12">
                                    <asp:DropDownList ID="DropDownList2" runat="server">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style13"></td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style15">Select the Number of Practicals in a Week&nbsp; &nbsp;</td>
                                <td class="auto-style12">
                                    <asp:DropDownList ID="DropDownList3" runat="server">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style13">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style15">Select the Number of Credits for the Course</td>
                                <td class="auto-style12">
                                    <asp:DropDownList ID="DropDownList4" runat="server">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style13">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style15">Select the Semester for the Course &nbsp;</td>
                                <td class="auto-style12">
                                    <asp:DropDownList ID="DropDownList5" runat="server">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style13">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style15">Select the Departments for which course is available &nbsp;</td>
                                <td class="auto-style12">
                                    <asp:CheckBoxList ID="CheckBoxList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="depid" DataValueField="depid">
                                    </asp:CheckBoxList>
                                </td>
                                <td class="auto-style13">&nbsp;<asp:Label ID="LabAvlDept" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="SUBMIT" />
                    </asp:Panel>
                </asp:Panel>
            </td>
            <td class="auto-style36">
                <asp:Panel ID="Panel4" runat="server" Height="579px">
                    <asp:Panel ID="Panel2" runat="server" BackColor="#66FF99" BorderStyle="Dotted" Height="553px" style="margin-left: 14px" Width="318px">
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;List of Courses in alphabetical order
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; of Course ID :<br />
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="courseid" DataSourceID="SqlDataSource2" style="text-align: center; margin-left: 10px" Width="298px" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="courseid" HeaderText="Course ID" ReadOnly="True" SortExpression="courseid" />
                                <asp:BoundField DataField="coursename" HeaderText="Course Name" SortExpression="coursename" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [course]"></asp:SqlDataSource>
                    </asp:Panel>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </asp:Panel>
            </td>
            <td class="auto-style38">
                <asp:Panel ID="Panel5" runat="server" Height="574px" style="margin-left: 5px" Width="460px">
                    <asp:Panel ID="Panel6" runat="server" BackColor="#FFFFCC" BorderStyle="Dotted" Height="550px" style="margin-left: 9px" Visible="False" Width="446px">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp; Course&nbsp;Name&nbsp;&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="LabCourseName0" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp; Course Code&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="LabCourseCode0" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <table class="auto-style1" style="width: 99%">
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style14">Select the Associated Departments</td>
                                <td class="auto-style10">
                                    <asp:CheckBoxList ID="CheckBoxList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="depid" DataValueField="depid">
                                        <asp:ListItem></asp:ListItem>
                                    </asp:CheckBoxList>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                <td>
                                    <asp:Label ID="LabAssDept0" runat="server" ForeColor="Red"></asp:Label>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style14">Select the Number of Lectures in a Week</td>
                                <td class="auto-style10">
                                    <asp:DropDownList ID="DropDownList6" runat="server">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="LabLec" runat="server"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style15">Select the Number of Tutorials in a Week</td>
                                <td class="auto-style12">
                                    <asp:DropDownList ID="DropDownList7" runat="server">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style13">
                                    <asp:Label ID="LabTut" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style15">Select the Number of Practicals in a Week&nbsp; &nbsp;</td>
                                <td class="auto-style12">
                                    <asp:DropDownList ID="DropDownList8" runat="server">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style13">
                                    <asp:Label ID="LabPra" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style15">Select the Number of Credits for the Course</td>
                                <td class="auto-style12">
                                    <asp:DropDownList ID="DropDownList9" runat="server">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style13">
                                    <asp:Label ID="LabCre" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style15">Select the Semester for the Course &nbsp;</td>
                                <td class="auto-style12">
                                    <asp:DropDownList ID="DropDownList10" runat="server">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="auto-style13">
                                    <asp:Label ID="LabSem" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style32">&nbsp;</td>
                                <td class="auto-style15">Select the Departments for which course is available &nbsp;</td>
                                <td class="auto-style12">
                                    <asp:CheckBoxList ID="CheckBoxList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="depid" DataValueField="depid">
                                    </asp:CheckBoxList>
                                </td>
                                <td class="auto-style13">&nbsp;<asp:Label ID="LabAvlDept0" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="UPDATE" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="DELETE" />
                    </asp:Panel>
                </asp:Panel>
            </td>
        </tr>
    </table>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [depid] FROM [dep]"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [depid] FROM [dep]"></asp:SqlDataSource>
    <br />
    </asp:Content>

