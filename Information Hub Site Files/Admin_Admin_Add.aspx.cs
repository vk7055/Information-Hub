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
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String checkAdminId = TextBox1.Text;
            String checkAdminUserName = TextBox2.Text;
            String checkAdminPwd = TextBox3.Text;
            String adminId = "SELECT count(*) from loginDB where Id='" + TextBox1.Text + "'";
            String adminUserName = "SELECT count(*) from loginDB where username='" + TextBox2.Text + "'";
            SqlCommand com1 = new SqlCommand(adminId, conn);
            int temp1 = (int)com1.ExecuteScalar();
            SqlCommand com2 = new SqlCommand(adminUserName, conn);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorAdminId = false;
            Boolean errorAdminUserName = false;
            if (temp1 == 1)
            {
                LabAdminID.Text = "Admin ID already used";
                errorAdminId = true;
            }
            else if (checkAdminId.Length == 0)
            {
                LabAdminID.Text = "Please feed Admin's ID";
                errorAdminId = true;
            }
            else if (errorAdminId == false)
            {
                LabAdminID.Text = "";
            }
            if (temp2 == 1)
            {
                LabAdminUserName.Text = "Admin Username already used";
                errorAdminUserName = true;
            }
            else if (checkAdminUserName.Length == 0)
            {
                LabAdminUserName.Text = "Please feed Employee's User ID";
                errorAdminUserName = true;
            }
            else if (errorAdminUserName == false)
            {
                LabAdminUserName.Text = "";
            }
            Boolean errorPwd = false;
            if (checkAdminPwd.Length == 0)
            {
                LabAminPwd.Text = "Please feed Admin's Password";
                errorPwd = true;
            }
            else if (errorPwd == false)
            {
                LabAminPwd.Text = "";
            }
            Boolean errorAdminType = true;
            int userType = 0;
            if (RadioButtonList1.SelectedIndex.Equals(0) || RadioButtonList1.SelectedIndex.Equals(1) || RadioButtonList1.SelectedIndex.Equals(2))
            {
                errorAdminType = false;
                LabAdminType.Text = "";
                if(RadioButtonList1.SelectedIndex.Equals(0))
                {
                    userType = 3;
                }
                if(RadioButtonList1.SelectedIndex.Equals(1))
                {
                    userType = 4;
                }
                if (RadioButtonList1.SelectedIndex.Equals(2))
                {
                    userType = 0;
                }
            }
            else
            {
                LabAdminType.Text = "Please select an Admin Type";
            }
            if (errorAdminId == false && errorAdminUserName == false && errorPwd == false && errorAdminType == false)
            {
                String password = ComputeHash(TextBox3.Text, new SHA256CryptoServiceProvider());
                SqlCommand com3 = new SqlCommand("insert into loginDB values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + password + "','" + userType + "')", conn);
                com3.ExecuteScalar();
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Admin Added Successfully </h2></font>");
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                RadioButtonList1.ClearSelection();
            }
        }
        conn.Close();
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}