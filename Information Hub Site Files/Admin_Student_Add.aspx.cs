using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;


public partial class _Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        LabUserId.Text = Session["id"].ToString();
        LabUserName.Text = Session["username"].ToString();
    }
    public String ComputeHash(String input, HashAlgorithm algrithm)
    {
        Byte[] inputBytes = Encoding.UTF8.GetBytes(input);
        Byte[] hashedbytes = algrithm.ComputeHash(inputBytes);
        return BitConverter.ToString(hashedbytes);
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String checkStudId = "SELECT count(*) from loginDB where Id='" + TextBox1.Text + "'";
            String checkStudName = "SELECT count(*) from loginDB where username='" + TextBox2.Text + "'";
            SqlCommand com1 = new SqlCommand(checkStudId, conn);
            int temp1 = (int)com1.ExecuteScalar();
            SqlCommand com2 = new SqlCommand(checkStudName, conn);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorStudId = false;
            Boolean errorStudName = false;
            if (temp1 == 1)
            {
                LabStudID.Text = "Student ID already used";
                errorStudId = true;
            }
            else if (TextBox1.Text.Length == 0)
            {
                LabStudID.Text = "Please feed Student ID";
                errorStudId = true;
            }
            else if (errorStudId == false)
            {
                LabStudID.Text = "";
            }
            if (temp2 == 1)
            {
                LabStudUserName.Text = "Student Name already used";
                errorStudName = true;
            }
            else if (TextBox2.Text.Length == 0)
            {
                LabStudUserName.Text = "Please feed Student Name";
                errorStudName = true;
            }
            else if (errorStudName == false)
            {
                LabStudUserName.Text = "";
            }
            Boolean errorPwd = false;
            if (TextBox3.Text.Length == 0)
            {
                LabStudPwd.Text = "Please feed Student's Login Password";
                errorPwd = true;
            }
            else if (errorPwd == false)
            {
                LabStudPwd.Text = "";
            }
            Boolean errorCompName = false;
            if (TextBox4.Text.Length == 0)
            {
                LabStudName.Text = "Please feed Student's Complete Name";
                errorCompName = true;
            }
            else if (errorCompName == false)
            {
                LabStudName.Text = "";
            }
            if (errorStudId == false && errorStudName == false && errorPwd == false && errorCompName == false )
            {
                String password = ComputeHash(TextBox3.Text, new SHA256CryptoServiceProvider());
                SqlCommand com3 = new SqlCommand("insert into loginDB values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + password + "','" + 2 + "')", conn);
                com3.ExecuteScalar();
                SqlCommand com4 = new SqlCommand("insert into student values('" + TextBox1.Text + "','" + TextBox4.Text + "','" + TextBox2.Text + "','" + DropDownList1.SelectedValue.ToString() + "','" + DropDownList2.SelectedValue + "')", conn);
                com4.ExecuteScalar();
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Student Added Successfully </h2></font>");
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
            }
        }
        conn.Close();
    }
}