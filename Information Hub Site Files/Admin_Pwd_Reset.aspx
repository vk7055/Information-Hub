<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_Pwd_Reset.aspx.cs" Inherits="Default6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">

        .auto-style6 {
            font-size: large;
        }
        .auto-style7 {
        text-align: left;
    }
    .auto-style8 {
            width: 140px;
        }
    .auto-style9 {
            text-align: center;
            width: 166px;
        }
        .auto-style10 {
            width: 144px;
        }
    .auto-style11 {
        width: 154px;
        text-align: center;
    }
    .auto-style12 {
        text-align: center;
        font-weight: bold;
        font-size: large;
    }
    .auto-style13 {
        font-size: large;
        font-weight: bold;
    }
    .auto-style14 {
        width: 216px;
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
    <table class="auto-style1">
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style12" colspan="2">Reset Own Password</td>
        <td class="auto-style14">&nbsp;</td>
        <td class="auto-style10">&nbsp;</td>
        <td colspan="2" style="text-align: left" class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Reset Other&#39;s Password</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style14">&nbsp;</td>
        <td class="auto-style10">&nbsp;</td>
        <td class="auto-style11">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style9">Old Password</td>
        <td class="auto-style8">
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td class="auto-style14">
            <asp:Label ID="LabOldPwd" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td class="auto-style10">&nbsp;</td>
        <td class="auto-style11">Username</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="LabUsrNam" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style14">&nbsp;</td>
        <td class="auto-style10">&nbsp;</td>
        <td class="auto-style11">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style9">New Password</td>
        <td class="auto-style8">
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td class="auto-style14">
            <asp:Label ID="LabNewPwd" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td class="auto-style10">&nbsp;</td>
        <td class="auto-style11">New Password</td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="LabNewPwd2" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style14">&nbsp;</td>
        <td class="auto-style10">&nbsp;</td>
        <td class="auto-style11">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style9">Confirm New Password</td>
        <td class="auto-style8">
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td class="auto-style14">
            <asp:Label ID="LabConPwd" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td class="auto-style10">&nbsp;</td>
        <td class="auto-style11">Confirm New Password</td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="LabConPwd2" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style14">&nbsp;</td>
        <td class="auto-style10">&nbsp;</td>
        <td class="auto-style11">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td colspan="2" style="text-align: center">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="SUBMIT" CssClass="btn btn-success" />
        </td>
        <td class="auto-style14">&nbsp;</td>
        <td class="auto-style10">&nbsp;</td>
        <td class="auto-style7" colspan="2">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="SUBMIT" CssClass="btn btn-success" />
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style14">&nbsp;</td>
        <td class="auto-style10">&nbsp;</td>
        <td class="auto-style11">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

