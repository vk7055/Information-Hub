<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_Employee.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style6 {
            font-size: x-large;
        }
        .auto-style8 {
            width: 255px;
            font-weight: bold;
            height: 40px;
            background-color: #F0F0F0;
        }
        .auto-style9 {
            width: 145px;
            height: 40px;
            background-color: #F0F0F0;
        }
        .auto-style11 {
            width: 255px;
            font-weight: bold;
            height: 35px;
            background-color: #F0F0F0;
        }
        .auto-style12 {
            width: 145px;
            height: 35px;
            background-color: #F0F0F0;
        }
        .auto-style17 {
            width: 255px;
            font-weight: bold;
            height: 41px;
            background-color: #F0F0F0;
        }
        .auto-style18 {
            width: 145px;
            height: 41px;
            background-color: #F0F0F0;
        }
        .auto-style20 {
            height: 40px;
            background-color: #F0F0F0;
        }
        .auto-style21 {
            height: 41px;
            background-color: #F0F0F0;
        }
        .auto-style23 {
            height: 35px;
            background-color: #F0F0F0;
        }
        .auto-style24 {
            background-color: #F0F0F0;
        }
        .auto-style25 {
            background-color: #FFFFFF;
        }
        .auto-style26 {
            width: 100px;
            height: 35px;
            background-color: #F0F0F0;
        }
        .auto-style27 {
            width: 100px;
            height: 41px;
            background-color: #F0F0F0;
        }
        .auto-style28 {
            width: 100px;
            height: 40px;
            background-color: #F0F0F0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td style="font-weight: 700; font-size: x-large; text-align: center; color: #000000" class="auto-style25">&nbsp;</td>
            <td colspan="4" style="font-weight: 700; font-size: x-large; text-align: center; color: #000000" class="auto-style25">Manage Employee</td>
            <td style="font-weight: 700; font-size: x-large; text-align: center; color: #000000" class="auto-style25">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-weight: 700; font-size: x-large; text-align: center; color: #000000" class="auto-style24">&nbsp;</td>
            <td colspan="4" style="font-weight: 700; font-size: x-large; text-align: center; color: #000000" class="auto-style24">&nbsp;</td>
            <td style="font-weight: 700; font-size: x-large; text-align: center; color: #000000" class="auto-style24">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style11">
        <strong>Add</strong><b> an Employee&nbsp;&nbsp;&nbsp;</b></td>
            <td class="auto-style12">
    <asp:Button ID="Button2" runat="server" Text="Add Employee" OnClick="Button2_Click" Width="128px" CssClass="btn btn-primary" />
            </td>
            <td class="auto-style23"></td>
            <td class="auto-style23">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style21"></td>
            <td class="auto-style27"></td>
            <td class="auto-style17">View /Modify/ Delete an Employee</td>
            <td class="auto-style18">
    <asp:Button ID="Button3" runat="server" Text="View Employee" OnClick="Button3_Click" Width="128px" CssClass="btn btn-danger" />
            </td>
            <td class="auto-style21"></td>
            <td class="auto-style21"></td>
        </tr>
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style27"></td>
            <td class="auto-style17">Assign Course Groups</td>
            <td class="auto-style18">
        <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Assign Groups" Width="129px" CssClass="btn btn-info" Height="36px" />
            </td>
            <td class="auto-style21"></td>
            <td class="auto-style21">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style27"></td>
            <td class="auto-style17">View Leave Types</td>
            <td class="auto-style18">
    <asp:Button ID="Button5" runat="server" Text="View Leaves" OnClick="Button5_Click" Width="128px" CssClass="btn btn-warning" />
            </td>
            <td class="auto-style21"></td>
            <td class="auto-style21">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style21">&nbsp;</td>
            <td class="auto-style27"></td>
            <td class="auto-style17">Add /Modify/Update Leave Types</td>
            <td class="auto-style18">
    <asp:Button ID="Button7" runat="server" Text="Add Leaves" OnClick="Button7_Click" Width="128px" CssClass="btn btn-success" />
            </td>
            <td class="auto-style24"></td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style20">&nbsp;</td>
            <td class="auto-style28"></td>
            <td class="auto-style8">View Leave History and Balance</td>
            <td class="auto-style9">
                <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Leave History" Width="128px" CssClass="btn btn-primary" />
            </td>
            <td class="auto-style24"></td>
            <td class="auto-style24"></td>
        </tr>
    </table>
    <p class="auto-style2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <span class="auto-style6">Admin ID</span> :
    <asp:Label ID="LabUserId" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style6">Admin Username : </span>
    <asp:Label ID="LabUserName" runat="server" ForeColor="White" style="font-size: x-large"></asp:Label>
</asp:Content>


