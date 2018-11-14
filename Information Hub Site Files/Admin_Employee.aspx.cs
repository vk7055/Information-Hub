using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        LabUserId.Text = Session["id"].ToString();
        LabUserName.Text = Session["username"].ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Employee_Add.aspx");
        conn.Close();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Add_Leaves.aspx");
        conn.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_View_Employee.aspx");
        conn.Close();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_View_Leaves.aspx");
        conn.Close();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Faculty_Group.aspx");
        conn.Close();
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Remaining_Leaves.aspx");
        conn.Close();
    }
}