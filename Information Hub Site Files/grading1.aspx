<%@ Page Language="C#" AutoEventWireup="true" CodeFile="grading1.aspx.cs" Inherits="grading1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">

    
        .auto-style1 {
            width: 100%;
            height: 816px;
        }
    
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            font-size: xx-large;
            color: #FFFFFF;
        }
        #err{
            color:red;
        }
        #err1{
            color:red;
        }
    
        .auto-style8 {
            width: 481px;
        }
    
    </style>
</head>
<body style="height: 1247px; margin-bottom: 4px">
    <form id="form1" runat="server">
    <div style="text-align: left">
            <asp:Panel ID="Panel18" runat="server">
                <div class="auto-style6">
                    <p style="margin-bottom: 6px; background:linear-gradient(90deg,white,#666699,white); height: 71px;">

                        <strong><span class="auto-style7">Welcome To IIT Patna</span></strong></p>
                    <marquee 1"="" align="left" behabiour="scroll" style="color: #CC0000; text-align: center; height: 32px; background:linear-gradient(#CCCCFF,white); scrollamount="> <strong>
                    <asp:Label ID="Label11" runat="server" style="color: red"></asp:Label>
                    </strong>
                    </marquee></div>
            </asp:Panel>
            <asp:Panel ID="Panel13" runat="server" style="background-color: #CCCCFF">
                <asp:Panel ID="Panel11" runat="server" style="margin-left: 514px; margin-top: 0px; background-color: #9999FF;" Width="319px" Height="19px">
                    <asp:menu id="NavigationMenu"
                        staticdisplaylevels="1"
                        staticsubmenuindent="40px" 
                        orientation="Horizontal"
                        target="_self"  
                        runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98">
                        <dynamichoverstyle backcolor="#284E98"
          forecolor="White"/>
                        <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="10px" />
                        <DynamicMenuStyle BackColor="#B5C7DE" />
                        <DynamicSelectedStyle BackColor="#507CD1" />
                        <items>
                            <asp:menuitem navigateurl="attendence.aspx"
                 text="Attendance"
                 tooltip="Attendance"></asp:menuitem>
                            <asp:menuitem navigateurl="leave.aspx"
                 text="Leave"
                 tooltip="Leave"></asp:menuitem>
                            <asp:menuitem navigateurl="grading.aspx"
                 text="Grading"
                 tooltip="Grading"></asp:menuitem>
                            <asp:menuitem navigateurl="courses.aspx"
                 text="Courses"
                 tooltip="Courses"></asp:menuitem>
                            <asp:menuitem navigateurl="Home.aspx"
                 text="Logout"
                 tooltip="Logout"></asp:menuitem>
                        </items>
                        <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#507CD1" />
                    </asp:menu>
                </asp:Panel>
        </asp:Panel>
            <br /></div>
        <div style="height: 1104px;background: linear-gradient(90deg,white,#aef5ec,white,#aef5ec,white)">
            <asp:Label ID="Label12" runat="server" style="color: #006666; background-color: #FFFFFF" Text="Label"></asp:Label>
        <br />
        <asp:Panel ID="Panel14" runat="server" Height="1394px">
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Panel ID="Panel15" runat="server" Height="805px" Width="370px">
                            <p style="font-weight: 700; text-align: center; color: #FFFFFF; margin-bottom: 3px; background-color: #666699">

                                Add Marks</p>
                            <br />
                            Add new Marks :&nbsp;
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add new" CssClass="btn btn-info" />
                            <br />
                            <br />
                            Import Data From .xlsx File :
                            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Add" CssClass="btn btn-primary" />
                            <br />
                            <br />
                            <asp:Panel ID="Panel1" runat="server">
                            </asp:Panel>
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="Maximum Marks :" Visible="False"></asp:Label>
                            &nbsp;&nbsp; &nbsp;&nbsp;
                            <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="Weightage :" Visible="False"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:TextBox ID="TextBox2" runat="server" Visible="False" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                            <br />
                            <br />
                            &nbsp;<asp:Label ID="Label3" runat="server" Text="Exam Name :" Visible="False"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
                            <br />
                            <div id="err1"></div>
                            <div id="err"></div>
                            <br />
                            <br />
                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Confirm" Visible="False" CssClass="btn btn-success" />
                            <br />
                        </asp:Panel>
                    </td>
                    <td class="auto-style8">
                        <asp:Panel ID="Panel16" runat="server" Height="802px" Width="470px" style="margin-right: 18px; margin-left: 15px;">
                            <p style="font-weight: 800; text-align: center; color: #FFFFFF; margin-bottom: 3px; background-color: #666699">
                                Update Marks</p>
                            Update Marks :
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update" CssClass="btn btn-warning" />
                            <br />
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="examid" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Visible="False" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table table-bordered table-striped" PageSize="5">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                                    <asp:BoundField DataField="max_marks" HeaderText="max_marks" SortExpression="max_marks" />
                                    <asp:BoundField DataField="weightage" HeaderText="weightage" SortExpression="weightage" />
                                    <asp:BoundField DataField="exam_name" HeaderText="exam_name" SortExpression="exam_name" />
                                    <asp:BoundField DataField="examid" HeaderText="examid" InsertVisible="False" ReadOnly="True" SortExpression="examid" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [max_marks], [weightage], [exam_name], [examid] FROM [exam] WHERE (([facid] = @facid) AND ([groupid] = @groupid) AND ([courseid] = @courseid))">
                                <SelectParameters>
                                    <asp:SessionParameter Name="facid" SessionField="id" Type="String" />
                                    <asp:SessionParameter Name="groupid" SessionField="groupid" Type="String" />
                                    <asp:SessionParameter Name="courseid" SessionField="courseid" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Visible="False" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table table-bordered table-striped" PageSize="7">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                                    <asp:BoundField DataField="studentid" HeaderText="studentid" SortExpression="studentid" />
                                    <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" />
                                    <asp:BoundField DataField="examid" HeaderText="examid" SortExpression="examid" />
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
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [studentid], [marks], [examid] FROM [marks] WHERE ([examid] = @examid)
ORDER BY studentid">
                                <SelectParameters>
                                    <asp:SessionParameter Name="examid" SessionField="examid" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                            <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
                            <br />
                            <strong>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="Enter Updated Marks :" Visible="False"></asp:Label>
                            </strong>
                            <asp:TextBox ID="TextBox4" runat="server" style="margin-left: 15px" Visible="False"></asp:TextBox>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Update" Visible="False" CssClass="btn btn-warning" />
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="Panel17" runat="server" Height="801px" width="370px" >
                            <p style="font-weight: 700; text-align: center; color: #FFFFFF; margin-bottom: 3px; background-color: #666699">
                                Performance</p>
                            Show Performance :
                            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Show" CssClass="btn btn-primary" />
                            <br />
                            <br />
                            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Export Student List in xlsx Format" CssClass="btn btn-info" />
                            <br />
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Visible="False">
                                <Columns>
                                    <asp:BoundField DataField="studentid" HeaderText="Roll No" SortExpression="studentid" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT studentid FROM student_course WHERE (courseid = @cid) AND (groupid = @gid) ORDER BY studentid">
                                <SelectParameters>
                                    <asp:SessionParameter Name="cid" SessionField="courseid" />
                                    <asp:SessionParameter Name="gid" SessionField="groupid" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
    
    </div>
    </form>
    <script type="text/javascript">
        el = document.getElementsByTagName('input');
        for (i = 0; i < el.length; i++) {
            el[i].addEventListener("blur", chk, false);
        }

        document.getElementById('TextBox1').addEventListener("blur", chk, false);
        document.getElementById('TextBox2').addEventListener("blur", chk1, false);
        function chk1()
        {
            if (document.getElementById('TextBox2').value != "") {
                g = document.getElementById("TextBox2");
                if (/^\d*$/.test(g.value)) {

                    //f = 0;

                    document.getElementById('Label2').style.color = "black";
                    document.getElementById('err1').innerHTML = "";
                }
                else {
                    document.getElementById('Label2').style.color = "red";
                    document.getElementById('err1').innerHTML = "Please enter a valid number.";
                }
            }
        }

        function chk() {

            n = document.querySelectorAll("#Table1 tr").length;
            f = 0;
            //f1 = 0;
            
            if (true)
            {
                //f = 0;
                for (i = 0; i < n; i++) {
                    element = document.getElementById("TextBoxRow_" + i + "Col_0");
                    if (/^\d*$/.test(element.value)) {

                        //f = 0;
                       
                        document.getElementById('lebel_' + i + 'Col_0').style.color = "black";
                    }
                    else {
                        document.getElementById('lebel_' + i + 'Col_0').style.color = "red";
                        f = 2;
                    }
                    
                }
                if (f == 2) {
                    document.getElementById('err1').innerHTML = "Please enter a valid number.";
                }
                else
                {
                    document.getElementById('err1').innerHTML = "";
                }
                
            }

            if (document.getElementById('TextBox1').value != "") {
                



                for (i = 0; i < n; i++) {

                    e = document.getElementById("TextBoxRow_" + i + "Col_0");
                    if (document.getElementById('TextBox1').value < e.value) {
                        f = 1;

                        document.getElementById('lebel_' + i + 'Col_0').style.color = "red";
                    }
                    else {
                        //f = 0;
                        document.getElementById('lebel_' + i + 'Col_0').style.color = "";
                    }

                }
                if (f == 1) {
                    document.getElementById('err').innerHTML = "red highlighted students have more than max marks";
                }
                else {
                    document.getElementById('err').innerHTML = "";
                }


            }
        }
    </script>
</body>
</html>
