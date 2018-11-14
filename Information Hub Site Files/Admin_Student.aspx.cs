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
        if(IsPostBack)
        {
            Response.Redirect("Admin_Student_Add.aspx");
        }
        conn.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Response.Redirect("Admin_Student_View.aspx");
        }
        conn.Close();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Allot_Group.aspx");
    }
}