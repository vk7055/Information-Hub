using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Admin_student1 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        LabUserId.Text = Session["id"].ToString();
        LabUserName.Text = Session["username"].ToString();
    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            if (Button3.Text.Equals("YES"))
            {
                Button3.Text = "CLOSE";
                Button4.Visible = false;
                String cunt = "SELECT count(*) from student where depid='" + DropDownList1.SelectedValue.ToString() + "' AND sem= '" + DropDownList2.SelectedValue.ToString() + "'";
                SqlCommand com2 = new SqlCommand(cunt, conn);
                int temp = (int)com2.ExecuteScalar();
                String checkuser = "SELECT * from student where depid='" + DropDownList1.SelectedValue.ToString() + "' AND sem= '" + DropDownList2.SelectedValue.ToString() + "'";
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
                    String cunt2 = "SELECT count(*) from student_course where courseid='" + DropDownList3.SelectedValue.ToString() + "' AND studentid= '" + fields[n] + "'";
                    SqlCommand com3 = new SqlCommand(cunt2, conn);
                    temp2 = temp2 + (int)com3.ExecuteScalar();
                }
                if (temp2 == 0 && temp != 0)
                    Panel1.Visible = true;
                else if (temp2 == 0 && temp == 0)
                {
                    Response.Write("<font color = " + '"' + "red" + '"' + "><h2>No Student with the above selected Department and Semester</h2></font>");
                    Button3.Text = "YES";
                    Button4.Visible = true;
                }
                else
                {
                    Response.Write("<font color = " + '"' + "red" + '"' + "><h2>Some students of the above selected Department and Semester have already been alloted some Group(s)</h2></font>");
                    Button3.Text = "YES";
                    Button4.Visible = true;
                }       
            }
            else if (Button3.Text.Equals("CLOSE"))
            {
                Button3.Text = "YES";
                Button4.Visible = true;
                Panel1.Visible = false;
            }
        }
        conn.Close();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            if (Button4.Text.Equals("NO"))
            {
                Button4.Text = "CLOSE";
                Panel2.Visible = true;
                Panel3.Visible = true;
                Label1.Visible = true;
                Label2.Visible = true;
                Button3.Visible = false;
                String cunt = "SELECT count(*) from student where depid='" + DropDownList1.SelectedValue.ToString() + "' AND sem= '" + DropDownList2.SelectedValue.ToString() + "'";
                SqlCommand com2 = new SqlCommand(cunt, conn);
                int temp = (int)com2.ExecuteScalar();
                String checkuser = "SELECT * from student where depid='" + DropDownList1.SelectedValue.ToString() + "' AND sem= '" + DropDownList2.SelectedValue.ToString() + "'";
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
                    String cunt2 = "SELECT count(*) from student_course where courseid='" + DropDownList3.SelectedValue.ToString() + "' AND studentid= '" + fields[n] + "'";
                    SqlCommand com3 = new SqlCommand(cunt2, conn);
                    temp2 = temp2 + (int)com3.ExecuteScalar();
                    if ((int)com3.ExecuteScalar() == 0)
                    {
                        SqlCommand com4 = new SqlCommand("insert into student_course values('" + DropDownList3.SelectedValue.ToString() + "','" + "0" + "','" + fields[n] + "')", conn);
                        com4.ExecuteScalar();
                    }
                }
            }
            else if(Button4.Text.Equals("CLOSE"))
            {
                String cut = "DELETE from student_course where groupid='" + 0 + "'";
                SqlCommand c2 = new SqlCommand(cut, conn);
                c2.ExecuteScalar();
                Button4.Text = "NO";
                Panel2.Visible = false;
                Panel3.Visible = false;
                Label1.Visible = false;
                Label2.Visible = false;
                Button3.Visible = true;
            }
        }
        conn.Close();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String cunt = "SELECT count(*) from student where depid='" + DropDownList1.SelectedValue.ToString() + "' AND sem= '" + DropDownList2.SelectedValue.ToString() + "'";
            SqlCommand com2 = new SqlCommand(cunt, conn);
            int temp = (int)com2.ExecuteScalar();
            String checkuser = "SELECT * from student where depid='" + DropDownList1.SelectedValue.ToString() + "' AND sem= '" + DropDownList2.SelectedValue.ToString() + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            SqlDataReader reader = com.ExecuteReader();
            int n = 0;
            string [] fields = new string[temp];
            while (reader.Read())
            {
                fields[n] = reader["studentid"].ToString();
                n++;
            }
            reader.Close();
            while( n != 0)
            {
                n--;
                SqlCommand com3 = new SqlCommand("insert into student_course values('" + DropDownList3.SelectedValue.ToString() + "','" + DropDownList6.SelectedValue.ToString() + "','" + fields[n] + "')", conn);
                com3.ExecuteScalar();
            }
            Panel1.Visible = false;
            Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Students Alloted Successfully </h2></font>");
            Button3.Text = "YES";
            Button4.Visible = true;
        }
        conn.Close();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            SqlCommand com3 = new SqlCommand("update student_course set groupid = '" + DropDownList8.Text  + "' where studentid = '" + GridView1.SelectedRow.Cells[1].Text + "' AND courseid = '" + GridView1.SelectedRow.Cells[2].Text + "'", conn);
            com3.ExecuteScalar();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();
        }
        conn.Close();
    }
}