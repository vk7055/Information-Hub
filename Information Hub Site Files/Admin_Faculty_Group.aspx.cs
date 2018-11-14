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
            String checkCourseId = "SELECT count(*) from course_fac where courseid='" + DropDownList1.SelectedValue + "' AND groupid='" + DropDownList2.SelectedValue + "'";
            SqlCommand com1 = new SqlCommand(checkCourseId, conn);
            int temp1 = (int)com1.ExecuteScalar();
            if (temp1 == 0)
            {
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Group Alloted Successfully </h2></font>");
                SqlCommand com = new SqlCommand("insert into course_fac values('" + DropDownList1.SelectedValue + "','" + DropDownList4.SelectedValue + "','" + DropDownList2.SelectedValue + "')", conn);
                com.ExecuteScalar();
                GridView1.DataBind();
                GridView2.DataBind();
            }
            else
                Response.Write("<font color = " + '"' + "red" + '"' + "><h2>Group Already Alloted</h2></font>");
        }
        conn.Close();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            LabCourseId.Text = GridView1.SelectedRow.Cells[1].Text;
            LabGroupId.Text = GridView1.SelectedRow.Cells[2].Text;
            GridView2.DataBind();
            if (GridView2.Rows.Count == 0)
            {
                LabStudList.Text = "No Students in " + GridView1.SelectedRow.Cells[2].Text + " of " + GridView1.SelectedRow.Cells[1].Text;
            }
            else
            {
                LabStudList.Text = GridView2.Rows.Count + " Students in " + GridView1.SelectedRow.Cells[2].Text + " of " + GridView1.SelectedRow.Cells[1].Text;
                GridView2.Visible = true;
            }
            LabStudList.Visible = true;
        }
        conn.Close();
    }
}