using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

public partial class Fac_Resource : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

        conn.Open();
       // StatusLabel.Text = "";
        // FileDescription.Attributes.Add("onFocus", "test()");
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        String fileid = GridView1.SelectedRow.Cells[1].Text;
        Response.Write(fileid);
        SqlCommand cmd = new SqlCommand("UPDATE File_course SET facid='" + Session["id"] + "' WHERE courseid='" + DropDownList1.SelectedValue.ToString() + "' and Fileid='"+fileid+"'", conn);
        cmd.ExecuteScalar();
        cmd = new SqlCommand("UPDATE File_course SET approval_date='" + DateTime.Today.ToString("MM/dd/yyyy") + "' WHERE courseid='" + DropDownList1.SelectedValue.ToString() + "' and Fileid='" + fileid + "'", conn);
        cmd.ExecuteScalar();
        GridView1.DataBind();
        //"' and date='"+DateTime.Today.ToString("MM/dd/yyyy")+
    }
}