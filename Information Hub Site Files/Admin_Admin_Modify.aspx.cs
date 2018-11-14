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
    static String glob0 = "";
    static String glob = "";
    static String glob2 = "";
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                conn.Open();
                Label1.Text = Session["id"].ToString();
                Label2.Text = Session["username"].ToString();
            }
        }
    }
    public String ComputeHash(String input, HashAlgorithm algrithm)
    {
        Byte[] inputBytes = Encoding.UTF8.GetBytes(input);
        Byte[] hashedbytes = algrithm.ComputeHash(inputBytes);
        return BitConverter.ToString(hashedbytes);
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String checkAdminId = TextBox1.Text;
            String adminId = "SELECT count(*) from loginDB where Id='" + TextBox1.Text + "'";
            SqlCommand com1 = new SqlCommand(adminId, conn);
            int temp1 = (int)com1.ExecuteScalar();
            Boolean errorAdminId = false;
            if (checkAdminId.Length == 0)
            {
                Label3.Text = "Please feed Admin's ID";
                errorAdminId = true;
            }
            else if (temp1 == 0)
            {
                Label3.Text = "Admin ID not found";
                errorAdminId = true;
            }
            else if (errorAdminId == false)
            {
                Label3.Text = "";
            }
            if( errorAdminId == false )
            {
                glob0 = TextBox1.Text;
                adminId = "SELECT Id from loginDB where Id='" + TextBox1.Text + "'";
                com1 = new SqlCommand(adminId, conn);
                String checkID = glob = TextBox2.Text = com1.ExecuteScalar().ToString();
                String adminUserName = "SELECT username from loginDB where Id='" + TextBox1.Text + "'";
                SqlCommand com2 = new SqlCommand(adminUserName, conn);
                String checkName = glob2 = TextBox3.Text = com2.ExecuteScalar().ToString();
                String adminPwd = "SELECT password from loginDB where Id='" + TextBox1.Text + "'";
                SqlCommand com3 = new SqlCommand(adminPwd, conn);
                String checkPwd = TextBox4.Text = com3.ExecuteScalar().ToString();
                Label7.Text = "";
                Label8.Text = "";
                Label9.Text = "";
                Label4.Visible = true;
                Label5.Visible = true;
                Label6.Visible = true;
                Label7.Visible = true;
                Label8.Visible = true;
                Label9.Visible = true;
                TextBox2.Visible = true;
                TextBox3.Visible = true;
                TextBox4.Visible = true;
                Button6.Visible = true;
                Button7.Visible = true;
                Button8.Visible = true;
            }
        }
        conn.Close();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            TextBox1.Text = GridView1.SelectedRow.Cells[1].Text;
            
        }
        conn.Close();
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            TextBox1.Text = GridView2.SelectedRow.Cells[1].Text;
        }
        conn.Close();
    }
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            TextBox1.Text = GridView3.SelectedRow.Cells[1].Text;
        }
        conn.Close();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            TextBox1.Text ="";
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            TextBox2.Visible = false;
            TextBox3.Visible = false;
            TextBox4.Visible = false;
            Button6.Visible = false;
            Button7.Visible = false;
            Button8.Visible = false;
        }
        conn.Close();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String userID = TextBox2.Text;
            String userName = TextBox3.Text;
            String pwd = TextBox4.Text;
            String empUserid = "SELECT count(*) from loginDB where Id='" + TextBox2.Text + "'";
            SqlCommand com = new SqlCommand(empUserid, conn);
            int temp = (int)com.ExecuteScalar();
            Boolean errorEmpUserID = false;
            if (temp == 1 && !(TextBox2.Text.Equals(glob)))
            {
                Label7.Text = "User ID already used";
                errorEmpUserID = true;
            }
            else if (TextBox2.Text.Length == 0)
            {
                Label7.Text = "Feed Admin's User ID";
                errorEmpUserID = true;
            }
            else if (errorEmpUserID == false)
            {
                Label7.Text = "";
            }
            empUserid = "SELECT count(*) from loginDB where username='" + TextBox3.Text + "'";
            com = new SqlCommand(empUserid, conn);
            int temp2 = (int)com.ExecuteScalar();
            Boolean errorEmpUsername = false;
            if (temp2 == 1 && !(TextBox3.Text.Equals(glob2)))
            {
                Label8.Text = "Username already used";
                errorEmpUsername = true;
            }
            else if (TextBox3.Text.Length == 0)
            {
                Label8.Text = "Feed Admin's Username";
                errorEmpUsername = true;
            }
            else if (errorEmpUsername == false)
            {
                Label8.Text = "";
            }
            Boolean errorPwd = false;
            if (pwd.Length == 0)
            {
                Label9.Text = "Feed Admin's Password";
                errorPwd = true;
            }
            else if (errorPwd == false)
            {
                Label9.Text = "";
            }
            if (errorEmpUserID == false && errorEmpUsername == false && errorPwd == false)
            {
                String password = ComputeHash(TextBox4.Text, new SHA256CryptoServiceProvider());
                SqlCommand com3 = new SqlCommand("update loginDB set Id = '" + TextBox2.Text + "',username = '" + TextBox3.Text + "', password = '" + password + "' where Id = '" + glob0 + "'", conn);
                com3.ExecuteScalar();
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Employee Updated Successfully </h2></font>");
                Label4.Visible = false;
                Label5.Visible = false;
                Label6.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                Label9.Visible = false;
                TextBox2.Visible = false;
                TextBox3.Visible = false;
                TextBox4.Visible = false;
                Button6.Visible = false;
                Button7.Visible = false;
                Button8.Visible = false;
                TextBox1.Text = "";
                GridView1.DataBind();
                GridView2.DataBind();
                GridView3.DataBind();
            }
        }
        conn.Close();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Admin with Admin ID '" + glob0 + "' Deleted Successfully </h2></font>");
            SqlCommand com1 = new SqlCommand("delete from loginDB where Id = '" + glob0 + "'", conn);
            com1.ExecuteScalar();
            Label4.Visible = false;
            Label2.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            TextBox2.Visible = false;
            TextBox3.Visible = false;
            TextBox4.Visible = false;
            Button6.Visible = false;
            Button7.Visible = false;
            Button8.Visible = false;
            TextBox1.Text = "";
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();
        }
        conn.Close();
    }
}