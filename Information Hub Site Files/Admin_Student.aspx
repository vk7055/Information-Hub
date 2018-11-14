<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_Student.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">

        .auto-style6 {
            font-size: x-large;
        }
    .auto-style7 {
        font-size: x-large;
        color: #33CCCC;
            text-align: left;
        }
        .auto-style10 {
            height: 39px;
        }
        .auto-style11 {
            width: 261px;
            font-weight: bold;
            height: 39px;
            font-size: medium;
            background-color: #F0F0F0;
        }
        .auto-style12 {
            width: 194px;
            height: 39px;
            background-color: #F0F0F0;
        }
        .auto-style13 {
            height: 39px;
            width: 232px;
        }
        .auto-style15 {
            font-size: x-large;
            color: #000000;
            text-align: left;
        }
        .auto-style16 {
            color: #33CCCC;
            text-align: left;
        }
        .auto-style17 {
            width: 169px;
            height: 39px;
            background-color: #F0F0F0;
        }
        .auto-style22 {
            width: 189px;
            height: 39px;
            font-size: medium;
            background-color: #F0F0F0;
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
    <p class="auto-style2" style="height: 27px">
    &nbsp;<strong><span class="auto-style15">Manage Students</span><span class="auto-style7"><br />
        <table class="auto-style1" style="margin-top: 0px">
    <tr>
        <td class="auto-style13"></td>
        <td class="auto-style17"></td>
        </span><span class="auto-style16">
        <td class="auto-style11">Add a Student</td>
        </span><span class="auto-style7">
        <td class="auto-style12">
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="ADD STUDENT" Width="134px" CssClass="btn btn-info" />
        </td>
        <td class="auto-style22">
            </td>
        <td class="auto-style10"></td>
    </tr>
    <tr>
        <td class="auto-style13"></td>
        <td class="auto-style17"></td>
        <span class="auto-style16">
        <td class="auto-style11">View /Update / Delete</td>
        </span>
        <td class="auto-style12">
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="VIEW STUDENT" Width="135px" CssClass="btn btn-danger" />
        </td>
        <td class="auto-style22">
            </td>
        <td class="auto-style10"></td>
    </tr>
    <tr>
        <td class="auto-style13"></td>
        <td class="auto-style17"></td>
        <span class="auto-style16">
        <td class="auto-style11">Allot Course / Group to Students</td>
        </span>
        <td class="auto-style12">
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="ALLOT GROUP" Width="136px" CssClass="btn btn-warning" />
        </td>
        <td class="auto-style22">
            </td>
        <td class="auto-style10"></td>
    </tr>
</table>
        </span></strong></p>
</asp:Content>

