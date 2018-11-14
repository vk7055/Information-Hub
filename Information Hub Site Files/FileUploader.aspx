<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="FileUploader.aspx.cs" Inherits="FileUploader" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span class="auto-style10">File Upload </span></strong>
    <table class="auto-style8">
        <tr>
          
            <td class="auto-style9">
                <style type="text/css">
    
                </style>
    <asp:FileUpload ID="FileUploadControl" runat="server" Height="28px" Width="349px" CssClass="btn-default" />
            </td>
            <td> <asp:Button runat="server" id="UploadButton" text="Submit" onclick="UploadButton_Click"  CssClass="btn btn-default" Width="78px" Height="32px" />
            </td>
        </tr>
    </table>
    
    <br />
    <strong><span class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    Select Courses</span></strong><br />
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
<div class="Scrollgrid"><div class="jumbotron"><asp:CheckBoxList ID="courseList" runat="server" DataSourceID="selected" DataTextField="courseid" DataValueField="courseid" CssClass="checkbox" ForeColor="Black">
    </asp:CheckBoxList>
                <asp:SqlDataSource ID="selected" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [courseid] FROM [course]"></asp:SqlDataSource>
            </div></div>
        
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
            width: 374px;
        }
    .auto-style10 {
        font-size: x-large;
    }
    </style>
<asp:TextBox ID="FileDescription" runat="server" Height="85px" OnTextChanged="TextBox1_TextChanged" TextMode="MultiLine" Width="488px" CssClass="normal_text"></asp:TextBox>
    <cc1:TextBoxWatermarkExtender ID="FileDescription_TextBoxWatermarkExtender" runat="server" TargetControlID="FileDescription" WatermarkText="Type Description for the file." WatermarkCssClass="watermarked" />
    <br /><br />
    <asp:Label runat="server" id="StatusLabel" text="Upload status: " CssClass="alert-info" />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [Extensions]"></asp:SqlDataSource>
    <br />
    <br /></div>

</asp:Content>

