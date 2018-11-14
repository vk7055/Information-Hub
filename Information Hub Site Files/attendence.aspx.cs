using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["courseid"] = GridView1.SelectedRow.Cells[1].Text;
        Session["groupid"] = GridView1.SelectedRow.Cells[2].Text;
        Response.Redirect("attendence1.aspx");

    }
}