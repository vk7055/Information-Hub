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
    static String glob = "";
    static String glob2 = "";
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
    protected void Button4_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            GridView2.DataBind();
            if (GridView2.Rows.Count == 0)
                Label1.Visible = true;
            else
            {
                Label1.Visible = false;
                GridView2.Visible = true;
            }
        }
        conn.Close();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            GridView2.Visible = false;
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
    protected void Button6_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String studid = "SELECT count(*) from loginDB where Id='" + TextBox1.Text + "'";
            SqlCommand com1 = new SqlCommand(studid, conn);
            int temp = (int)com1.ExecuteScalar();
            Boolean errorStudID = false;
            if (temp != 1 && TextBox1.Text.Length != 0)
            {
                LabSearch.Text = "Student ID not Found";
                errorStudID = true;
            }
            else if (TextBox1.Text.Length == 0)
            {
                LabSearch.Text = "Please feed Student's User ID";
                errorStudID = true;
            }
            else if (errorStudID == false)
            {
                LabSearch.Text = "";
            }
            if (temp == 1 && errorStudID == false)
            {
                Panel2.Visible = true;
                glob = TextBox2.Text = TextBox1.Text;
                String username = "SELECT username from loginDB where Id='" + TextBox2.Text + "'";
                SqlCommand com2 = new SqlCommand(username, conn);
                glob2 = TextBox3.Text = com2.ExecuteScalar().ToString();
                String pwd = "SELECT password from loginDB where Id='" + TextBox2.Text + "'";
                SqlCommand com4 = new SqlCommand(pwd, conn);
                TextBox4.Text = com4.ExecuteScalar().ToString();
                String compName = "SELECT name from student where studentid='" + TextBox2.Text + "'";
                SqlCommand com5 = new SqlCommand(compName, conn);
                TextBox5.Text = com5.ExecuteScalar().ToString();
                String dep = "SELECT depid from student where studentid='" + TextBox2.Text + "'";
                SqlCommand com3 = new SqlCommand(dep, conn);
                DropDownList3.SelectedValue = com3.ExecuteScalar().ToString();
                String sem = "SELECT sem from student where studentid='" + TextBox2.Text + "'";
                SqlCommand com6 = new SqlCommand(sem, conn);
                DropDownList4.SelectedValue = com6.ExecuteScalar().ToString();
            }
        }
        conn.Close();
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            Panel2.Visible = false;
            TextBox1.Text = "";
        }
        conn.Close();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Student with Student ID '" + glob + "' Deleted Successfully </h2></font>");
            SqlCommand com1 = new SqlCommand("delete from loginDB where Id = '" + glob + "'", conn);
            com1.ExecuteScalar();
            SqlCommand com2 = new SqlCommand("delete from student where studentid = '" + glob + "'", conn);
            com2.ExecuteScalar();
            Panel2.Visible = false;
            TextBox1.Text = "";
            GridView1.DataBind();
            GridView2.DataBind();
        }
        conn.Close();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String studID = "SELECT count(*) from loginDB where Id='" + TextBox2.Text + "'";
            SqlCommand com2 = new SqlCommand(studID, conn);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorStudID = false;
            if (temp2 == 1 && !(TextBox2.Text.Equals(glob)))
            {
                LabStudId.Text = "Student ID already used";
                errorStudID = true;
            }
            else if (TextBox2.Text.Length == 0)
            {
                LabStudId.Text = "Please feed Student ID";
                errorStudID = true;
            }
            else if (errorStudID == false)
            {
                LabStudId.Text = "";
            }
            String studUserName = "SELECT count(*) from loginDB where username='" + TextBox3.Text + "'";
            SqlCommand cm2 = new SqlCommand(studUserName, conn);
            int tmp2 = (int)cm2.ExecuteScalar();
            Boolean errorStudUserName = false;
            if (tmp2 == 1 && !(TextBox3.Text.Equals(glob2)))
            {
                LabUser.Text = "Student Login Username already used";
                errorStudUserName = true;
            }
            else if (TextBox3.Text.Length == 0)
            {
                LabUser.Text = "Please feed Student Login Username";
                errorStudUserName = true;
            }
            else if (errorStudUserName == false)
            {
                LabUser.Text = "";
            }
            Boolean errorCompName = false;
            if (TextBox5.Text.Length == 0)
            {
                LabCompName.Text = "Please feed Student's Name";
                errorCompName = true;
            }
            else if (errorCompName == false)
            {
                LabCompName.Text = "";
            }
            Boolean errorPwd = false;
            if (TextBox4.Text.Length == 0)
            {
                LabPwd.Text = "Please feed Student's Login Password";
                errorPwd = true;
            }
            else if (errorPwd == false)
            {
                LabPwd.Text = "";
            }
            if (errorStudID == false && errorStudUserName == false && errorPwd == false && errorCompName == false)
            {
                String password = ComputeHash(TextBox4.Text, new SHA256CryptoServiceProvider());
                SqlCommand com3 = new SqlCommand("update loginDB set Id = '" + TextBox2.Text + "', username = '" + TextBox3.Text + "', password = '" + password + "' where Id = '" + glob + "'", conn);
                com3.ExecuteScalar();
                SqlCommand com4 = new SqlCommand("update student set studentid = '" + TextBox2.Text + "', name = '" + TextBox5.Text + "', emailid = '" + TextBox3.Text + "', depid = '" + DropDownList3.SelectedValue.ToString() + "', sem = '" + DropDownList4.SelectedValue.ToString() + "' where studentid = '" + glob + "'", conn);
                com4.ExecuteScalar();
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Student Updated Successfully </h2></font>");
                Panel2.Visible = false;
                TextBox1.Text = "";
                GridView1.DataBind();
                GridView2.DataBind();
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
    protected void Button10_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String cunt = "SELECT count(*) from student";
            SqlCommand com2 = new SqlCommand(cunt, conn);
            int temp = (int)com2.ExecuteScalar();
            String checkuser = "SELECT * from student";
            SqlCommand com = new SqlCommand(checkuser, conn);
            SqlDataReader reader = com.ExecuteReader();
            int n = 0;
            string[] fields = new string[temp];
            while (reader.Read())
            {
                fields[n] = reader["studentid"].ToString();
                n++;
            }
            reader.Close();
            int temp2 = 0;
            while (n != 0)
            {
                n--;
                String cunt2 = "SELECT sem from student where studentid= '" + fields[n] + "'";
                SqlCommand com3 = new SqlCommand(cunt2, conn);
                temp2 = 1 + (int)com3.ExecuteScalar();
                String cut2 = "UPDATE student set sem= '" + temp2 + "' where studentid= '" + fields[n] + "'";
                SqlCommand cm3 = new SqlCommand(cut2, conn);
                cm3.ExecuteScalar();
            }
        }
        conn.Close();
    }
}