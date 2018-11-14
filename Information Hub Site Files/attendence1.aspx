<%@ Page Language="C#" AutoEventWireup="true" CodeFile="attendence1.aspx.cs" Inherits="attendence1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        #hypdiv{
            float:left;
            padding-right:20px;
        }
        #head{
            background:linear-gradient(#8181F7,white);
        }
        #cont{
            background:linear-gradient(#D0A9F5,white);
        }
        #err{
            color:red;
        }
        #err1{
            color:red;
        }
        #Image1{
            padding-right:180px;
        }
        
        .auto-style1 {
            width: 100%;
            height: 393px;
        }
            
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            font-size: xx-large;
            color: #FFFFFF;
        }
    
        .auto-style8 {
            color: #003300;
        }
        .auto-style9 {
            width: 100%;
            height: 274px;
        }
    
        .auto-style10 {
            width: 325px;
        }
    
        .auto-style11 {
            color: #660033;
        }
    
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>



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
        <p>

                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

        </p>
            <asp:Panel ID="Panel19" runat="server" Height="394px">
                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Panel ID="Panel20" runat="server" Height="977px" Width="569px">
                                <p style="font-weight: 700; color: #FFFFFF; text-align: center; background-color: #666699">

                                    Take Attendance</p>
                                <div style="height: 341px">

                                    <span class="auto-style8">I<strong>mport Data From .xlsx</strong></span><br />
                                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="active right" />
                                    <br />
                                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Export" CssClass="btn btn-warning" />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <span class="auto-style11"><strong>OR</strong></span><br />
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Take New Attandence" CssClass="btn btn-success" />
                                    <br />
                                    <table class="auto-style9">
                                        <tr>
                                            <td>
                                                <asp:Panel ID="Panel24" runat="server" Height="717px">
                                                    <p style="font-weight: 700; color: #FFFFFF; text-align: center; background-color: #666699">
                                                        Take Attendance</p>
                                                    <div style="height: 207px">

                                                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" AutoPostback="true" DataSourceID="SqlDataSource1" onrowcommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-bordered table" Height="16px">
                                                            <Columns>
                                                                <asp:BoundField DataField="studentid" HeaderText="studentid" SortExpression="studentid" />
                                                                <asp:ButtonField ButtonType="Button" CommandName="p" Text="P" />
                                                                <asp:ButtonField ButtonType="Button" CommandName="Select" Text="A" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <br />
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [studentid] FROM [attendence] WHERE (([att] = @att) AND ([attid] = @attid))">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="1" Name="att" Type="Int32" />
                                                                <asp:SessionParameter Name="attid" SessionField="attid" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>

                                                    </div>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                                <asp:Panel ID="Panel26" runat="server" Height="715px">
                                                    <p style="font-weight: 700; color: #FFFFFF; text-align: center; background-color: #666699">
                                                        Present Student</p>
                                                    <div style="height: 207px">
                                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" onrowcommand="GridView2_RowCommand" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CssClass="table table-bordered table" Height="16px">
                                                            <Columns>
                                                                <asp:BoundField DataField="studentid" HeaderText="studentid" SortExpression="studentid" />
                                                                <asp:CommandField ButtonType="Button" SelectText="Absent" ShowSelectButton="True" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <br />
                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [studentid] FROM [attendence] WHERE (([att] = @att) AND ([attid] = @attid))">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="0" Name="att" Type="Int32" />
                                                                <asp:SessionParameter Name="attid" SessionField="attid" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                                <asp:Panel ID="Panel25" runat="server" Height="713px">
                                                    <p style="font-weight: 700; color: #FFFFFF; text-align: center; background-color: #666699">
                                                        Absent Student</p>
                                                    <div style="height: 207px">
                                                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" onrowcommand="GridView3_RowCommand" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" CssClass="table table-bordered table" Height="16px">
                                                            <Columns>
                                                                <asp:BoundField DataField="studentid" HeaderText="studentid" SortExpression="studentid" />
                                                                <asp:CommandField ButtonType="Button" SelectText="Present" ShowSelectButton="True" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <br />
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [studentid] FROM [attendence] WHERE (([att] = @att) AND ([attid] = @attid))">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="-1" Name="att" Type="Int32" />
                                                                <asp:SessionParameter Name="attid" SessionField="attid" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />

                                </div>
                            </asp:Panel>
                        </td>
                        <td class="auto-style10">
                            <asp:Panel ID="Panel21" runat="server" Height="976px" style="margin-left: 0px">
                                <p style="font-weight: 700; color: #FFFFFF; text-align: center; background-color: #666699; width: 303px;">
                                    Take Attendance Manually</p>
                                <div style="height: 207px">
                                    Take Attendanec Manual :
                                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Take" CssClass="btn btn-primary" />
                                    <br />
                                    <asp:Panel ID="Panel2" runat="server">
                                    </asp:Panel>
                                    <br />
                                    <div id="err1">
                                    </div>
                                    <div id="err">
                                    </div>

                                    <br />
                                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Submit" CssClass="btn btn-success" />
                                </div>
                            </asp:Panel>
                        </td>
                        <td>
                            <asp:Panel ID="Panel23" runat="server" Height="973px">
                                <p style="font-weight: 700; color: #FFFFFF; text-align: center; background-color: #666699">
                                    View Attendance</p>
                                <div style="height: 207px">
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="View Attandance" CssClass="btn btn-warning" />
                                    <br />
                                    <br />
                                    <asp:Button ID="Button6" runat="server" CssClass="btn btn-primary" OnClick="Button6_Click" Text="Export Student list in xlsx format" />
                                    <asp:GridView ID="GridView4" runat="server" CssClass="table table-bordered table-striped" Height="16px">
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <br />
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Visible="False">
                <Columns>
                    <asp:BoundField DataField="studentid" HeaderText="studentid" SortExpression="studentid" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT studentid FROM student_course WHERE (courseid = @cid) AND (groupid = @gid) ORDER BY studentid">
                <SelectParameters>
                    <asp:SessionParameter Name="cid" SessionField="courseid" />
                    <asp:SessionParameter Name="gid" SessionField="groupid" />
                </SelectParameters>
            </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />



    </div>
       
    </form>
    <script type="text/javascript">
        el = document.getElementsByTagName('input');
        for (i = 0; i < el.length; i++) {
            el[i].addEventListener("blur", chk, false);
        }

        //document.getElementById('TextBox1').addEventListener("blur", chk, false);
        function chk() {

            n = document.querySelectorAll("#Table1 tr").length;
            f = 0;

            if (true) {
                for (i = 0; i < n; i++) {
                    e = document.getElementById("TextBoxRow_" + i + "Col_0");
                    if (e.value==1 || e.value==0) {

                        document.getElementById('lebel_' + i + 'Col_0').style.color = "black";
                        
                    }
                    else {
                        f = 2; document.getElementById('lebel_' + i + 'Col_0').style.color = "red";
                    }
                }
                if (f == 2) {
                    document.getElementById('err1').innerHTML = "Please enter a valid number.";
                }
                else {
                    document.getElementById('err1').innerHTML = "";
                }



                


            }
        }
    </script>
       
    </body>
</html>