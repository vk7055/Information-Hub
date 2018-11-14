using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    static String glob = "";
    static String glob2 = "";
    SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn2.Open();
        LabUserId.Text = Session["id"].ToString();
        LabUserName.Text = Session["username"].ToString();
    }
    /*protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        
    }
    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {

    }*/
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    /*protected void Button3_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox3.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Calendar2.Visible = true;
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        TextBox4.Text = Calendar2.SelectedDate.ToShortDateString();
        Calendar2.Visible = false;
    }*/
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String checkCompName = TextBox1.Text;
            String checkShortName = TextBox2.Text;
            String compName = "SELECT count(*) from leave_type where name='" + TextBox1.Text + "'";
            String shortName = "SELECT count(*) from leave_type where type='" + TextBox2.Text + "'";
            SqlCommand com1 = new SqlCommand(compName, conn2);
            int temp1 = (int)com1.ExecuteScalar();
            SqlCommand com2 = new SqlCommand(shortName, conn2);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorCompName = false;
            Boolean errorShortName = false;
            if (temp1 == 1)
            {
                LabCompName.Text = "Leave Name already used";
                errorCompName = true;
            }
            else if (checkCompName.Length == 0)
            {
                LabCompName.Text = "Please feed Leave Name";
                errorCompName = true;
            }
            else if (errorCompName == false)
            {
                LabCompName.Text = "";
            }
            if (temp2 == 1)
            {
                LabShortName.Text = "Leave Code already used";
                errorShortName = true;
            }
            else if (checkShortName.Length == 0)
            {
                LabShortName.Text = "Please feed Leave Code";
                errorShortName  = true;
            }
            else if (errorShortName == false)
            {
                LabShortName.Text = "";
            }
            int checkAccumulate = 0;
            int maxLeave = 1;
            if(CheckBox6.Checked == true)
            {
                checkAccumulate = 1;
            }
            if( errorCompName == false && errorShortName == false)
            {
                maxLeave = Convert.ToInt32(DropDownList1.SelectedValue);
                String cunt = "SELECT count(*) from faculty";
                SqlCommand cm2 = new SqlCommand(cunt, conn2);
                int temp = (int)cm2.ExecuteScalar();
                String checkuser = "SELECT * from faculty";
                SqlCommand com = new SqlCommand(checkuser, conn2);
                SqlDataReader reader = com.ExecuteReader();
                int n = 0;
                string[] fields = new string[temp];
                while (reader.Read())
                {
                    fields[n] = reader["facid"].ToString();
                    n++;
                }
                reader.Close();

                String temp_next_year = DateTime.Today.ToString("yyyy");
                int tmp = Convert.ToInt32(temp_next_year);
                tmp = tmp + 1;
                while (n != 0)
                {
                    n--;
                    SqlCommand com4 = new SqlCommand("insert into leave_remain values('" + fields[n] + "','" + TextBox2.Text + "','" + maxLeave + "','" + DateTime.Today.ToString("yyyy") + "')", conn2);
                    com4.ExecuteScalar();
                    SqlCommand com5 = new SqlCommand("insert into leave_remain values('" + fields[n] + "','" + TextBox2.Text + "','" + maxLeave + "','" + tmp + "')", conn2);
                    com5.ExecuteScalar();
                }

                SqlCommand com3 = new SqlCommand("insert into leave_type values('" + TextBox2.Text + "','" + TextBox1.Text + "','" + maxLeave + "','" + checkAccumulate + "')", conn2);
                com3.ExecuteScalar();
                Panel2.Visible = false;
                Label1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                LabCompName.Visible = false;
                LabShortName.Visible = false;
                TextBox1.Visible = false;
                TextBox2.Visible = false;
                CheckBox6.Visible = false;
                DropDownList1.Visible = false;
                Button2.Visible = false;
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Leave Added Successfully </h2></font>");
            }
            conn2.Close();
        }
    }
    protected void CheckBox6_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if (Button3.Text.Equals("Show"))
            {
                Button3.Text = "Hide";
                GridView1.Visible = true;
                Label13.Visible = true;
            }
            else if (Button3.Text.Equals("Hide"))
            {
                Button3.Text = "Show";
                GridView1.Visible = false;
                Label13.Visible = false;
            }
        }
        conn2.Close();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            if (Button4.Text.Equals("Add New Leave Type"))
            {
                Button4.Text = "CLOSE";
                Panel2.Visible = true;
                Label1.Visible = true;
                Label2.Visible = true;
                Label3.Visible = true;
                Label4.Visible = true;
                LabCompName.Visible = true;
                LabShortName.Visible = true;
                TextBox1.Visible = true;
                TextBox2.Visible = true;
                CheckBox6.Visible = true;
                DropDownList1.Visible = true;
                Button2.Visible = true;
            }
            else if(Button4.Text.Equals("CLOSE"))
            {
                Button4.Text = "Add New Leave Type";
                Panel2.Visible = false;
            }
        }
        conn2.Close();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String checkLeaveCode = TextBox3.Text;
            String empid = "SELECT count(*) from leave_type where type='" + TextBox3.Text + "'";
            SqlCommand com1 = new SqlCommand(empid, conn2);
            int temp = (int)com1.ExecuteScalar();
            Boolean errorLeaveCode = false;
            if (temp != 1 && checkLeaveCode.Length != 0)
            {
                Label9.Text = "Employee ID not Found";
                errorLeaveCode = true;
            }
            else if (checkLeaveCode.Length == 0)
            {
                Label9.Text = "Please feed Employee's User ID";
                errorLeaveCode = true;
            }
            else if (errorLeaveCode == false)
            {
                Label9.Text = "";
            }
            if (temp == 1 && errorLeaveCode == false)
            {
                Panel3.Visible = true;
                Label5.Visible = true;
                Label6.Visible = true;
                Label7.Visible = true;
                Label8.Visible = true;
                TextBox4.Visible = true;
                TextBox5.Visible = true;
                TextBox6.Visible = true;
                CheckBox7.Visible = true;
                Button6.Visible = true;
                Button7.Visible = true;
                String empid2 = "SELECT name from leave_type where type='" + TextBox3.Text + "'";
                SqlCommand com2 = new SqlCommand(empid2, conn2);
                TextBox4.Text = com2.ExecuteScalar().ToString();
                glob2 = TextBox4.Text;
                String empid4 = "SELECT type from leave_type where type='" + TextBox3.Text + "'";
                SqlCommand com4 = new SqlCommand(empid4, conn2);
                TextBox5.Text = com4.ExecuteScalar().ToString();
                String empid5 = "SELECT carryflag from leave_type where type='" + TextBox3.Text + "'";
                SqlCommand com5 = new SqlCommand(empid5, conn2);
                glob = TextBox5.Text;
                int temp2 = Convert.ToInt32(com5.ExecuteScalar());
                if( temp2 == 1 )
                {
                    CheckBox7.Checked = true;
                }
                if( temp2 == 0 )
                {
                    CheckBox7.Checked = false;
                }
                String empid3 = "SELECT max from leave_type where type='" + TextBox3.Text + "'";
                SqlCommand com3 = new SqlCommand(empid3, conn2);
                int temp3 = Convert.ToInt32(com3.ExecuteScalar());
                TextBox6.Text = "" + temp3;
            }
        }
        conn2.Close();
    }
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String emp = "SELECT count(*) from leave_type where name='" + TextBox4.Text + "'";
            SqlCommand com = new SqlCommand(emp, conn2);
            int temp = (int)com.ExecuteScalar();
            String emp2 = "SELECT count(*) from leave_type where type='" + TextBox5.Text + "'";
            SqlCommand com2 = new SqlCommand(emp2, conn2);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorCompName = false;
            Boolean errorShortName = false;
            if (temp2 == 1 && !(TextBox5.Text.Equals(glob)))
            {
                Response.Write("" + temp2 + TextBox5.Text + glob);
                Label12.Text = "Leave Code already used";
                errorShortName = true;
            }
            else if (TextBox5.Text.Length == 0)
            {
                Label12.Text = "Please feed Leave Code";
                errorShortName = true;
            }
            else if (errorShortName == false)
            {
                Label12.Text = "";
            }
            if (temp == 1 && !(TextBox4.Text.Equals(glob2)))
            {
                Label11.Text = "Leave Name already used";
                errorCompName = true;
            }
            else if (TextBox4.Text.Length == 0)
            {
                Label11.Text = "Please feed Leave Name";
                errorCompName = true;
            }
            else if (errorCompName == false)
            {
                Label11.Text = "";
            }
            Boolean errorMax = false;
            int temp4 = Convert.ToInt32(TextBox6.Text);
            int temp3 = 0;
            if(CheckBox7.Checked == true)
            {
                temp3 = 1;
            }
            if( errorCompName == false && errorShortName == false && errorMax == false)
            {
                SqlCommand com3 = new SqlCommand("update leave_type set type = '" + TextBox5.Text + "', name = '" + TextBox4.Text + "', carryflag = '" + temp3 + "', max = '" + temp4 + "' where type = '" + TextBox3.Text + "'", conn2);
                com3.ExecuteScalar();
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Leave Updated Successfully </h2></font>");
                Panel3.Visible = false;
                Label5.Visible = false;
                Label6.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                Label11.Visible = false;
                Label12.Visible = false;
                TextBox4.Visible = false;
                TextBox5.Visible = false;
                TextBox6.Visible = false;
                CheckBox7.Visible = false;
                Button6.Visible = false;
                Button7.Visible = false;
                TextBox3.Text = "";
                Response.Redirect("Admin_Add_Leaves.aspx");
            }
        }
        conn2.Close();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Leave with Leave Code '" + TextBox3.Text + "' Deleted Successfully </h2></font>");
            SqlCommand com1 = new SqlCommand("delete from leave_type where type = '" + TextBox3.Text + "'", conn2);
            com1.ExecuteScalar();
            Panel3.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label11.Visible = false;
            Label12.Visible = false;
            TextBox4.Visible = false;
            TextBox5.Visible = false;
            TextBox6.Visible = false;
            CheckBox7.Visible = false;
            Button6.Visible = false;
            Button7.Visible = false;
            TextBox3.Text = "";
            Response.Redirect("Admin_Add_Leaves.aspx");
        }
        conn2.Close();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox3.Text = GridView1.SelectedRow.Cells[1].Text;
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Panel1.Visible = false;
        }
        conn2.Close();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            Panel1.Visible = true;
        }
        conn2.Close();
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            int temp = 0;
            SqlCommand com = new SqlCommand("SELECT count(*) from leave_remain where year='" +  DropDownList2.SelectedValue + "'", conn2);
            temp = (int)com.ExecuteScalar();
            if(temp != 0)
            {
                Label14.Visible = true;
            }
            else
            {
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Leaves Alloted Successfully </h2></font>");
                Label14.Visible = false;
                String cunt = "SELECT count(*) from faculty";
                SqlCommand com2 = new SqlCommand(cunt, conn2);
                int temp2 = (int)com2.ExecuteScalar();
                String checkuser = "SELECT * from faculty";
                com = new SqlCommand(checkuser, conn2);
                SqlDataReader reader = com.ExecuteReader();
                int n = 0;
                string[] fields = new string[temp2];
                while (reader.Read())
                {
                    fields[n] = reader["facid"].ToString();
                    n++;
                }
                reader.Close();
                cunt = "SELECT count(*) from leave_type";
                com2 = new SqlCommand(cunt, conn2);
                temp2 = (int)com2.ExecuteScalar();
                checkuser = "SELECT * from leave_type";
                com = new SqlCommand(checkuser, conn2);
                SqlDataReader reader2 = com.ExecuteReader();
                int m = 0;
                string[] fields2 = new string[temp2];
                while (reader2.Read())
                {
                    fields2[m] = reader2["type"].ToString();
                    m++;
                }
                reader2.Close();
                int tp1 = 0;
                while (n != 0)
                {
                    n--;
                    temp2 = m;
                    while (temp2 != 0)
                    {
                        temp2--;
                        SqlCommand com3 = new SqlCommand("SELECT max from leave_type where type='" + fields2[temp2] + "'", conn2);
                        tp1 = (int)com3.ExecuteScalar();
                        com3 = new SqlCommand("SELECT carryflag from leave_type where type='" + fields2[temp2] + "'", conn2);
                        int tp2 = (int)com3.ExecuteScalar();
                        if(tp2 == 1)
                        {
                            int tp3 = Convert.ToInt32(DropDownList2.SelectedValue.ToString()) - 1;
                            com3 = new SqlCommand("SELECT remain from leave_remain where type='" + fields2[temp2] + "' AND facid='" + fields[n] + "' AND year='" + tp3 + "'", conn2);
                            int tp4 = Convert.ToInt32(com3.ExecuteScalar());
                            tp1 = tp4 + tp1;
                        }
                        String cunt2 = "INSERT into leave_remain values('" + fields[n] + "','" + fields2[temp2] + "','" + tp1 + "','" + DropDownList2.SelectedValue + "')";
                        com3 = new SqlCommand(cunt2, conn2);
                        com3.ExecuteScalar();
                    }
                }
            }
        }
        conn2.Close();
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            Panel3.Visible = false;
            TextBox3.Text = "";
        }
        conn2.Close();
    }
}