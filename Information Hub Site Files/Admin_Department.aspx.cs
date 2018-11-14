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
    static String glob = "";
    static String glob0 = "";
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        LabUserId.Text = Session["id"].ToString();
        LabUserName.Text = LabUserName.Text = Session["username"].ToString();
    }
    /*protected void Button2_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            if(Button2.Text.Equals("CREATE"))
            {
                Button2.Text = "CLOSE";
                Panel1.Visible = true;
            }
            else if (Button2.Text.Equals("CLOSE"))
            {
                Button2.Text = "CREATE";
                Panel1.Visible = false;
                TextBox1.Text = "";
                TextBox2.Text = "";
            }
        }
        conn.Close();
    }*/
    /*protected void Button4_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if (Button4.Text.Equals("SHOW"))
            {
                Button4.Text = "HIDE";
                GridView1.Visible = true;
            }
            else if (Button4.Text.Equals("HIDE"))
            {
                Button4.Text = "SHOW";
                GridView1.Visible = false;
            }
        }
        conn.Close();
    }*/
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            TextBox3.Text = GridView1.SelectedRow.Cells[1].Text;
        }
        conn.Close();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String checkDeptId = TextBox3.Text;
            String deptid = "SELECT count(*) from dep where depid='" + TextBox3.Text + "'";
            SqlCommand com = new SqlCommand(deptid, conn);
            int temp = (int)com.ExecuteScalar();
            Boolean errorDeptID = false;
            if (temp != 1 && checkDeptId.Length != 0)
            {
                LabDeptSearch.Text = "Department ID not Found";
                errorDeptID = true;
            }
            else if (checkDeptId.Length == 0)
            {
                LabDeptSearch.Text = "Please feed Department ID";
                errorDeptID = true;
            }
            else if (errorDeptID == false)
            {
                LabDeptSearch.Text = "";
            }
            if (temp == 1 && errorDeptID == false)
            {
                Panel2.Visible = true;
                TextBox5.Text = glob0 = TextBox3.Text;
                String empid2 = "SELECT depname from dep where depid='" + TextBox3.Text + "'";
                SqlCommand com2 = new SqlCommand(empid2, conn);
                TextBox4.Text = glob = com2.ExecuteScalar().ToString();
            }
        }
        conn.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String checkDeptName = TextBox1.Text;
            String checkDeptId = TextBox2.Text;
            String deptName = "SELECT count(*) from dep where depname='" + TextBox1.Text + "'";
            String deptId = "SELECT count(*) from dep where depid='" + TextBox2.Text + "'";
            SqlCommand com1 = new SqlCommand(deptName, conn);
            int temp1 = (int)com1.ExecuteScalar();
            SqlCommand com2 = new SqlCommand(deptId, conn);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorDeptID = false;
            Boolean errorDeptName = false;
            if (temp1 == 1)
            {
                LabDeptName.Text = "Department Name already used";
                errorDeptName = true;
            }
            else if (checkDeptName.Length == 0)
            {
                LabDeptName.Text = "Please feed Department's Name";
                errorDeptName = true;
            }
            else if (errorDeptName == false)
            {
                LabDeptName.Text = "";
            }
            if (temp2 == 1)
            {
                LabDeptID.Text = "Department ID already used";
                errorDeptID = true;
            }
            else if (checkDeptId.Length == 0)
            {
                LabDeptID.Text = "Please feed Department ID";
                errorDeptID = true;
            }
            else if (errorDeptID == false)
            {
                LabDeptID.Text = "";
            }
            if( errorDeptName == false && errorDeptID == false )
            {
                SqlCommand com3 = new SqlCommand("insert into dep values('" + TextBox2.Text + "','" + TextBox1.Text + "')", conn);
                com3.ExecuteScalar();
                Panel1.Visible = false;
                //Button2.Text = "CREATE";
                TextBox1.Text = "";
                TextBox2.Text = "";
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Department Added Successfully </h2></font>");
                GridView1.DataBind();
            }
        }
        conn.Close();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Department with Department ID '" + TextBox5.Text + "' Deleted Successfully </h2></font>");
            SqlCommand com1 = new SqlCommand("delete from dep where depid = '" + TextBox5.Text + "'", conn);
            com1.ExecuteScalar();
            GridView1.DataBind();
            Panel2.Visible = false;
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }
        conn.Close();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            Panel2.Visible = false;
            TextBox4.Text = "";
            TextBox5.Text = "";
        }
        conn.Close();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String checkDeptName = TextBox4.Text;
            String checkDeptId = TextBox5.Text;
            String deptName = "SELECT count(*) from dep where depname='" + TextBox4.Text + "'";
            SqlCommand com2 = new SqlCommand(deptName, conn);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorDeptName = false;
            if (temp2 == 1 && !(TextBox4.Text.Equals(glob)))
            {
                LabDeptNameSearch.Text = "Department Name already used";
                errorDeptName = true;
            }
            else if (TextBox4.Text.Length == 0)
            {
                LabDeptNameSearch.Text = "Please feed Department Name";
                errorDeptName = true;
            }
            else if (errorDeptName == false)
            {
                LabDeptNameSearch.Text = "";
            }
            String deptId = "SELECT count(*) from dep where depid='" + TextBox5.Text + "'";
            SqlCommand com = new SqlCommand(deptId, conn);
            int temp = (int)com.ExecuteScalar();
            Boolean errorDeptId = false;
            if (temp == 1 && !(TextBox5.Text.Equals(glob0)))
            {
                LabDeptIdSearch.Text = "Department ID already used";
                errorDeptId = true;
            }
            else if (TextBox5.Text.Length == 0)
            {
                LabDeptIdSearch.Text = "Please feed Department ID";
                errorDeptId = true;
            }
            else if (errorDeptId == false)
            {
                LabDeptIdSearch.Text = "";
            }
            if( errorDeptName == false && errorDeptId == false)
            {
                SqlCommand com3 = new SqlCommand("update dep set depid = '" + TextBox5.Text + "', depname = '" + TextBox4.Text + "' where depid = '" + TextBox3.Text + "'", conn);
                com3.ExecuteScalar();
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Department Updated Successfully</h2></font>");
                Panel2.Visible = false;
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                GridView1.DataBind();
            }
        }
        conn.Close();
    }
}
