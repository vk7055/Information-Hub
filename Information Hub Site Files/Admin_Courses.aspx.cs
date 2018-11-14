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
    static int k = 0;
    static string globC = "";
    static string globN = "";
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        LabUserId.Text = Session["id"].ToString();
        LabUserName.Text = Session["username"].ToString();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String checkCourseId = "SELECT count(*) from course where courseid='" + TextBox2.Text + "'";
            String checkCourseName = "SELECT count(*) from course where coursename='" + TextBox1.Text + "'";
            SqlCommand com1 = new SqlCommand(checkCourseId, conn);
            int temp1 = (int)com1.ExecuteScalar();
            SqlCommand com2 = new SqlCommand(checkCourseName, conn);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorCourseId = false;
            Boolean errorCourseName = false;
            if (temp1 == 1)
            {
                LabCourseCode.Text = "Course Code already used";
                errorCourseId = true;
            }
            else if (TextBox2.Text.Length == 0)
            {
                LabCourseCode.Text = "Please feed Course Code";
                errorCourseId = true;
            }
            else if (errorCourseId == false)
            {
                LabCourseCode.Text = "";
            }
            if (temp2 == 1)
            {
                LabCourseName.Text = "Course Name already used";
                errorCourseName = true;
            }
            else if (TextBox1.Text.Length == 0)
            {
                LabCourseName.Text = "Please feed Course Name";
                errorCourseName = true;
            }
            else if (errorCourseName == false)
            {
                LabCourseName.Text = "";
            }
            Boolean errorDept = false;
            Boolean errorDept2 = false;
            int j = 0;
            for (int i = 0; i <= CheckBoxList1.Items.Count - 1; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    j++;
                }
            }
            if (j == 0)
            {
                LabAssDept.Text = "Please Select at least one Department";
                errorDept = true;
            }
            else if (errorDept == false)
            {
                LabAssDept.Text = "";
            }
            j = 0;
            for (int i = 0; i <= CheckBoxList2.Items.Count - 1; i++)
            {
                if (CheckBoxList2.Items[i].Selected)
                {
                    j++;
                }
            }
            if (j == 0)
            {
                LabAvlDept.Text = "Please Select at least one Department";
                errorDept2 = true;
            }
            else if (errorDept2 == false)
            {
                LabAvlDept.Text = "";
            }
            if (errorDept == false && errorCourseName == false && errorCourseId == false && errorDept2 == false)
            {
                String s = "" + CheckBoxList1.Items.Count + " " + CheckBoxList2.Items.Count;
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Course Added Successfully</h2></font>");
                SqlCommand com = new SqlCommand("insert into course values('" + TextBox2.Text + "','" + TextBox1.Text + "','" + DropDownList1.SelectedValue + "','" + DropDownList2.SelectedValue + "','" + DropDownList3.SelectedValue + "','" + DropDownList4.SelectedValue + "')", conn);
                com.ExecuteScalar();
                for (int i = 0; i <= CheckBoxList1.Items.Count - 1; i++)
                {
                    if (CheckBoxList1.Items[i].Selected)
                    {
                        SqlCommand cm2 = new SqlCommand("insert into course_dep values('" + TextBox2.Text + "','" + CheckBoxList1.Items[i].Text + "')", conn);
                        cm2.ExecuteScalar();
                    }
                }
                for (int i = 0; i <= CheckBoxList2.Items.Count - 1; i++)
                {
                    if (CheckBoxList2.Items[i].Selected)
                    {
                        SqlCommand cm2 = new SqlCommand("insert into course_sem_dep values('" + TextBox2.Text + "','" + CheckBoxList2.Items[i].Text + "','" + DropDownList5.SelectedValue + "','" + j + "')", conn);
                        cm2.ExecuteScalar();
                    }
                }
                Panel1.Visible = false;
                TextBox1.Text = "";
                TextBox2.Text = "";
            }
        }
        conn.Close();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        /*if (k == 0)
        {
            k++;
            GridView1_SelectedIndexChanged(sender, e);
        }*/
        if(IsPostBack)
        {
            for (int i = 0; i <= CheckBoxList3.Items.Count - 1; i++)
            {
                CheckBoxList3.Items[i].Selected = false;
            }
            for (int i = 0; i <= CheckBoxList4.Items.Count - 1; i++)
            {
                CheckBoxList4.Items[i].Selected = false;
            }
            SqlCommand com = new SqlCommand("SELECT coursename from course WHERE courseid='" + GridView1.SelectedValue.ToString() + "'", conn);
            globN = TextBox3.Text = com.ExecuteScalar().ToString();
            globC = TextBox4.Text = GridView1.SelectedValue.ToString();
            String cunt = "SELECT count(*) from course_dep WHERE courseid ='" + GridView1.SelectedValue.ToString() + "'";
            SqlCommand com2 = new SqlCommand(cunt, conn);
            int temp = (int)com2.ExecuteScalar();
            String checkuser = "SELECT * from course_dep WHERE courseid ='" + GridView1.SelectedValue.ToString() + "'";
            com = new SqlCommand(checkuser, conn);
            SqlDataReader reader = com.ExecuteReader();
            int n = 0;
            string[] fields = new string[temp];
            while (reader.Read())
            {
                fields[n] = reader["depid"].ToString();
                n++;
            }
            reader.Close();
            while (n != 0)
            {
                n--;
                for (int i = 0; i <= CheckBoxList3.Items.Count - 1; i++)
                {
                    if (CheckBoxList3.Items[i].ToString().Equals(fields[n]))
                    {
                        CheckBoxList3.Items[i].Selected = true;
                    }
                }
            }
            cunt = "SELECT count(*) from course_sem_dep WHERE courseid ='" + GridView1.SelectedValue.ToString() + "'";
            com2 = new SqlCommand(cunt, conn);
            temp = (int)com2.ExecuteScalar();
            checkuser = "SELECT * from course_sem_dep WHERE courseid ='" + GridView1.SelectedValue.ToString() + "'";
            com = new SqlCommand(checkuser, conn);
            reader = com.ExecuteReader();
            n = 0;
            string[] fields_2 = new string[temp];
            while (reader.Read())
            {
                fields_2[n] = reader["depid"].ToString();
                n++;
            }
            reader.Close();
            while (n != 0)
            {
                n--;
                for (int i = 0; i <= CheckBoxList4.Items.Count - 1; i++)
                {
                    if (CheckBoxList4.Items[i].ToString().Equals(fields_2[n]))
                    {
                        CheckBoxList4.Items[i].Selected = true;
                    }
                }
            }
            com2 = new SqlCommand("SELECT lecture from course WHERE courseid ='" + GridView1.SelectedValue.ToString() + "'", conn);
            temp = (int)com2.ExecuteScalar();
            LabLec.Text = "Current : " + temp;
            com2 = new SqlCommand("SELECT tutorial from course WHERE courseid ='" + GridView1.SelectedValue.ToString() + "'", conn);
            temp = (int)com2.ExecuteScalar();
            LabTut.Text = "Current : " + temp;
            com2 = new SqlCommand("SELECT practical from course WHERE courseid ='" + GridView1.SelectedValue.ToString() + "'", conn);
            temp = (int)com2.ExecuteScalar();
            LabPra.Text = "Current : " + temp;
            com2 = new SqlCommand("SELECT credits from course WHERE courseid ='" + GridView1.SelectedValue.ToString() + "'", conn);
            temp = (int)com2.ExecuteScalar();
            LabCre.Text = "Current : " + temp;
            com2 = new SqlCommand("SELECT sem from course_sem_dep WHERE courseid ='" + GridView1.SelectedValue.ToString() + "'", conn);
            temp = (int)com2.ExecuteScalar();
            LabSem.Text = "Current : " + temp; 
            Button5.Visible = true;
            Label1.Visible = true;
            Panel6.Visible = true;
        }
        conn.Close();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Label1.Visible = false;
            Panel6.Visible = false;
            Button5.Visible = false;
        }
        conn.Close();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String checkCourseId = "SELECT count(*) from course where courseid='" + TextBox2.Text + "'";
            String checkCourseName = "SELECT count(*) from course where coursename='" + TextBox1.Text + "'";
            SqlCommand com1 = new SqlCommand(checkCourseId, conn);
            int temp1 = (int)com1.ExecuteScalar();
            SqlCommand com2 = new SqlCommand(checkCourseName, conn);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorCourseId = false;
            Boolean errorCourseName = false;
            if (temp1 == 1 && !(TextBox4.Text.Equals(globC)))
            {
                LabCourseCode0.Text = "Course Code already used";
                errorCourseId = true;
            }
            else if (TextBox4.Text.Length == 0)
            {
                LabCourseCode0.Text = "Please feed Course Code";
                errorCourseId = true;
            }
            else if (errorCourseId == false)
            {
                LabCourseCode0.Text = "";
            }
            if (temp2 == 1 && !(TextBox3.Text.Equals(globN)))
            {
                LabCourseName0.Text = "Course Name already used";
                errorCourseName = true;
            }
            else if (TextBox3.Text.Length == 0)
            {
                LabCourseName0.Text = "Please feed Course Name";
                errorCourseName = true;
            }
            else if (errorCourseName == false)
            {
                LabCourseName0.Text = "";
            }
           /* if (temp2 == 1 && !(TextBox9.Text.Equals(glob)))
            {
                Label9.Text = "Employee User ID already used";
                errorEmpUserID = true;
            }
            else if (TextBox9.Text.Length == 0)
            {
                Label9.Text = "Please feed Employee's User ID";
                errorEmpUserID = true;
            }
            else if (errorEmpUserID == false)
            {
                Label9.Text = "";
            }*/
            Boolean errorDept = false;
            Boolean errorDept2 = false;
            int j = 0;
            for (int i = 0; i <= CheckBoxList3.Items.Count - 1; i++)
            {
                if (CheckBoxList3.Items[i].Selected)
                {
                    j++;
                }
            }
            if (j == 0)
            {
                LabAssDept0.Text = "Please Select at least one Department";
                errorDept = true;
            }
            else if (errorDept == false)
            {
                LabAssDept0.Text = "";
            }
            j = 0;
            for (int i = 0; i <= CheckBoxList4.Items.Count - 1; i++)
            {
                if (CheckBoxList4.Items[i].Selected)
                {
                    j++;
                }
            }
            if (j == 0)
            {
                LabAvlDept0.Text = "Please Select at least one Department";
                errorDept2 = true;
            }
            else if (errorDept2 == false)
            {
                LabAvlDept0.Text = "";
            }
            if (errorDept == false && errorCourseName == false && errorCourseId == false && errorDept2 == false)
            {
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Course Updated Successfully</h2></font>");
                SqlCommand com = new SqlCommand("update course set coursename = '" + TextBox3.Text + "', courseid = '" + TextBox4.Text + "', lecture = '" + DropDownList6.SelectedValue + "', tutorial = '" + DropDownList7.SelectedValue + "', practical = '" + DropDownList8.SelectedValue + "', credits = '" + DropDownList9.SelectedValue + "' where courseid = '" + TextBox4.Text + "'", conn);
                com.ExecuteScalar();
                com = new SqlCommand("DELETE from course_dep where courseid = '" + TextBox4.Text + "'", conn);
                com.ExecuteScalar();
                com = new SqlCommand("DELETE from course_sem_dep where courseid = '" + TextBox4.Text + "'", conn);
                com.ExecuteScalar();
                /*for (int i = 0; i <= CheckBoxList3.Items.Count - 1; i++)
                {
                    if (CheckBoxList3.Items[i].Selected)
                    {
                        String cunt = "SELECT count(*) from course_dep WHERE courseid ='" + TextBox4.Text + "'";
                        com2 = new SqlCommand(cunt, conn);
                        int temp = (int)com2.ExecuteScalar();
                        String checkuser = "SELECT * from course_dep WHERE courseid ='" + TextBox4.Text + "'";
                        com = new SqlCommand(checkuser, conn);
                        SqlDataReader reader = com.ExecuteReader();
                        int n = 0;
                        string[] fields = new string[temp];
                        while (reader.Read())
                        {
                            fields[n] = reader["depid"].ToString();
                            n++;
                        }
                        reader.Close();
                        while (n != 0)
                        {
                            n--;
                            if(!(fields[n].Equals(CheckBoxList3.Items[i].Text)))
                            {

                            }
                            /*for (int i = 0; i <= CheckBoxList3.Items.Count - 1; i++)
                            {
                                if (CheckBoxList3.Items[i].ToString().Equals(fields[n]))
                                {
                                    CheckBoxList3.Items[i].Selected = true;
                                }
                            }
                        } 
                    }
                }*/
                for (int i = 0; i <= CheckBoxList3.Items.Count - 1; i++)
                {
                    if (CheckBoxList3.Items[i].Selected)
                    {
                        SqlCommand cm2 = new SqlCommand("insert into course_dep values('" + TextBox4.Text + "','" + CheckBoxList3.Items[i].Text + "')", conn);
                        cm2.ExecuteScalar();
                    }
                }
                for (int i = 0; i <= CheckBoxList4.Items.Count - 1; i++)
                {
                    if (CheckBoxList4.Items[i].Selected)
                    {
                        SqlCommand cm2 = new SqlCommand("insert into course_sem_dep values('" + TextBox4.Text + "','" + CheckBoxList4.Items[i].Text + "','" + DropDownList10.SelectedValue + "','" + j + "')", conn);
                        cm2.ExecuteScalar();
                    }
                }
                Label1.Visible = false;
                Panel6.Visible = false;
                Button5.Visible = false;
            }
        }
        conn.Close();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            SqlCommand com = new SqlCommand("SELECT count(*) from student_course WHERE courseid='" + globC + "'", conn);
            int temp = (int)com.ExecuteScalar();
            if (temp != 0)
            {
                Response.Write("<font color = " + '"' + "red" + '"' + "><h2>Course Cannot be deleted. Some Students already registered for the Course.</h2></font>");
            }
            else
            {
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Course Deleted Successfully</h2></font>");
                com = new SqlCommand("DELETE from course WHERE courseid='" + globC + "'", conn);
                com.ExecuteScalar();
                com = new SqlCommand("DELETE from course_dep WHERE courseid='" + globC + "'", conn);
                com.ExecuteScalar();
                com = new SqlCommand("DELETE from course_sem_dep WHERE courseid='" + globC + "'", conn);
                com.ExecuteScalar();
                Label1.Visible = false;
                Panel6.Visible = false;
                Button5.Visible = false;
                GridView1.DataBind();
            }
        }
        conn.Close();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String checkCourseName = "SELECT count(*) from course where coursename='" + TextBox3.Text + "'";
            SqlCommand com2 = new SqlCommand(checkCourseName, conn);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorCourseId = false;
            Boolean errorCourseName = false;
            if (temp2 == 1 && !(TextBox3.Text.Equals(globN)))
            {
                LabCourseName0.Text = "Course Name already used";
                errorCourseName = true;
            }
            else if (TextBox3.Text.Length == 0)
            {
                LabCourseName0.Text = "Please feed Course Name";
                errorCourseName = true;
            }
            else if (errorCourseName == false)
            {
                LabCourseName0.Text = "";
            }
            Boolean errorDept = false;
            Boolean errorDept2 = false;
            int j = 0;
            for (int i = 0; i <= CheckBoxList3.Items.Count - 1; i++)
            {
                if (CheckBoxList3.Items[i].Selected)
                {
                    j++;
                }
            }
            if (j == 0)
            {
                LabAssDept0.Text = "Please Select at least one Department";
                errorDept = true;
            }
            else if (errorDept == false)
            {
                LabAssDept0.Text = "";
            }
            j = 0;
            for (int i = 0; i <= CheckBoxList4.Items.Count - 1; i++)
            {
                if (CheckBoxList4.Items[i].Selected)
                {
                    j++;
                }
            }
            if (j == 0)
            {
                LabAvlDept0.Text = "Please Select at least one Department";
                errorDept2 = true;
            }
            else if (errorDept2 == false)
            {
                LabAvlDept0.Text = "";
            }
            if (errorDept == false && errorCourseName == false && errorCourseId == false && errorDept2 == false)
            {
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Course Updated Successfully</h2></font>");
                SqlCommand com = new SqlCommand("update course set coursename = '" + TextBox3.Text + "', lecture = '" + DropDownList6.SelectedValue + "', tutorial = '" + DropDownList7.SelectedValue + "', practical = '" + DropDownList8.SelectedValue + "', credits = '" + DropDownList9.SelectedValue + "' where courseid = '" + globC + "'", conn);
                com.ExecuteScalar();
                com = new SqlCommand("DELETE from course_dep where courseid = '" + globC + "'", conn);
                com.ExecuteScalar();
                com = new SqlCommand("DELETE from course_sem_dep where courseid = '" + globC + "'", conn);
                com.ExecuteScalar();
                for (int i = 0; i <= CheckBoxList3.Items.Count - 1; i++)
                {
                    if (CheckBoxList3.Items[i].Selected)
                    {
                        SqlCommand cm2 = new SqlCommand("insert into course_dep values('" + globC + "','" + CheckBoxList3.Items[i].Text + "')", conn);
                        cm2.ExecuteScalar();
                    }
                }
                for (int i = 0; i <= CheckBoxList4.Items.Count - 1; i++)
                {
                    if (CheckBoxList4.Items[i].Selected)
                    {
                        SqlCommand cm2 = new SqlCommand("insert into course_sem_dep values('" + globC + "','" + CheckBoxList4.Items[i].Text + "','" + DropDownList10.SelectedValue + "','" + j + "')", conn);
                        cm2.ExecuteScalar();
                    }
                }
                Label1.Visible = false;
                Panel6.Visible = false;
                Button5.Visible = false;
                GridView1.DataBind();
            }
        }
        conn.Close();
    }
}