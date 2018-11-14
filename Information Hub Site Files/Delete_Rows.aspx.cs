using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Default6 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from attendence", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from course", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from course_dep", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from course_fac", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from course_sem_dep", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from dep", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from exam", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from fac_attendence", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from fac_dep", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from faculty", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from leave_details", conn);
        com.ExecuteScalar();
        conn.Close();
    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from leave_remain", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button13_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from loginDB", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from marks", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button15_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from notifications", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button16_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from student", conn);
        com.ExecuteScalar();
        conn.Close();
    }
    protected void Button17_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("DELETE from student_course", conn);
        com.ExecuteScalar();
        conn.Close();
    }
}