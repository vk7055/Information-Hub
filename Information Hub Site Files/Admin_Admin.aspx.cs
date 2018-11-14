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
        Label1.Text = Session["id"].ToString();
        Label2.Text = Session["username"].ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            Response.Redirect("Admin_Admin_Add.aspx");
        }
        conn.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Response.Redirect("Admin_Admin_Modify.aspx");
        }
        conn.Close();
    }
}