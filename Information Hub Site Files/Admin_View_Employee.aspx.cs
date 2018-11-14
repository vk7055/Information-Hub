using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Security.Cryptography;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    static String glob = "";
    static String glob0 = "";
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        LabUserId.Text = Session["id"].ToString();
        LabUserName.Text = Session["username"].ToString();
    }
    public String ComputeHash(String input, HashAlgorithm algrithm)
    {
        Byte[] inputBytes = Encoding.UTF8.GetBytes(input);
        Byte[] hashedbytes = algrithm.ComputeHash(inputBytes);
        return BitConverter.ToString(hashedbytes);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String checkEmpUserId = TextBox1.Text;
            String empid = "SELECT count(*) from loginDB where Id='" + TextBox1.Text + "'";
            SqlCommand com1 = new SqlCommand(empid, conn);
            int temp = (int)com1.ExecuteScalar();
            Boolean errorEmpID = false;
            if (temp != 1 && checkEmpUserId.Length != 0)
            {
                LabEmpSearch.Text = "Employee ID not Found";
                errorEmpID = true;
            }
            else if (checkEmpUserId.Length == 0)
            {
                LabEmpSearch.Text = "Please feed Employee's User ID";
                errorEmpID = true;
            }
            else if (errorEmpID == false)
            {
                LabEmpSearch.Text = "";
            }
            if (temp == 1 && errorEmpID == false)
            {
                glob0 = TextBox1.Text;
                Label1.Visible = true;
                Label2.Visible = true;
                Label3.Visible = true;
                Label4.Visible = true;
                Label5.Visible = true;
                Label13.Visible = true;
                TextBox6.Visible = true;
                TextBox7.Visible = true;
                TextBox8.Visible = true;
                Label12.Visible = true;
                LabAssDep.Visible = true;
                TextBox9.Visible = true;
                TextBox10.Visible = true;
                Button6.Visible = true;
                Button7.Visible = true;
                CheckBoxList1.Visible = true;
                String empid2 = "SELECT name from faculty where facid='" + TextBox1.Text + "'";
                SqlCommand com2 = new SqlCommand(empid2, conn);
                TextBox6.Text = com2.ExecuteScalar().ToString();
                String empid4 = "SELECT dob from faculty where facid='" + TextBox1.Text + "'";
                SqlCommand com4 = new SqlCommand(empid4, conn);
                TextBox7.Text = com4.ExecuteScalar().ToString();
                String empid5 = "SELECT doj from faculty where facid='" + TextBox1.Text + "'";
                SqlCommand com5 = new SqlCommand(empid5, conn);
                TextBox8.Text = com5.ExecuteScalar().ToString();
                String empid3 = "SELECT username from loginDB where Id='" + TextBox1.Text + "'";
                SqlCommand com3 = new SqlCommand(empid3, conn);
                TextBox9.Text = com3.ExecuteScalar().ToString();
                glob = TextBox9.Text;
                String empid6 = "SELECT password from loginDB where Id='" + TextBox1.Text + "'";
                SqlCommand com6 = new SqlCommand(empid6, conn);
                TextBox10.Text = com6.ExecuteScalar().ToString();
                for (int i = 0; i <= CheckBoxList1.Items.Count - 1; i++)
                {
                    CheckBoxList1.Items[i].Selected = false;
                }
                String cunt = "SELECT count(*) from fac_dep WHERE facid ='" + TextBox1.Text + "'";
                com2 = new SqlCommand(cunt, conn);
                temp = (int)com2.ExecuteScalar();
                String checkuser = "SELECT * from fac_dep WHERE facid ='" + TextBox1.Text + "'";
                com2 = new SqlCommand(checkuser, conn);
                SqlDataReader reader = com2.ExecuteReader();
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
                    for (int i = 0; i <= CheckBoxList1.Items.Count - 1; i++)
                    {
                        if (CheckBoxList1.Items[i].ToString().Equals(fields[n]))
                        {
                            CheckBoxList1.Items[i].Selected = true;
                        }
                    }
                }         
            }
        }
        conn.Close();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String empName = TextBox6.Text;
            String DOB = TextBox7.Text;
            String DOJ = TextBox8.Text;
            String checkEmpUserid = TextBox9.Text;
            String pwd = TextBox10.Text;
            String empUserid = "SELECT count(*) from loginDB where username='" + TextBox9.Text + "'";
            SqlCommand com2 = new SqlCommand(empUserid, conn);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorEmpUserID = false;
            if (temp2 == 1 && !(TextBox9.Text.Equals(glob)))
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
            }
            Boolean errorEmpName = false;
            if (empName.Length == 0)
            {
                Label6.Text = "Please feed Employee's Name";
                errorEmpName = true;
            }
            else if (errorEmpName == false)
            {
                Label6.Text = "";
            }
            Boolean errorDOB = false;
            if (DOB.Length == 0)
            {
                Label7.Text = "Please feed Employee's Date-of-Birth";
                errorDOB = true;
            }
            else
            {
                string dateString = TextBox7.Text;
                try
                {
                    DateTime date1 = DateTime.Parse(dateString);
                }
                catch
                {
                    Label7.Text = "Please feed Employee's Date-of-Birth in Proper Format";
                    errorDOB = true;
                }
            }
            if (errorDOB == false)
            {
                Label7.Text = "";
            }
            Boolean errorDOJ = false;
            if (DOJ.Length == 0)
            {
                Label8.Text = "Please feed Employee's Date-of-Joining";
                errorDOJ = true;
            }
            else
            {
                string dateString = TextBox8.Text;
                try
                {
                    DateTime date1 = DateTime.Parse(dateString);
                }
                catch
                {
                    Label8.Text = "Please feed Employee's Date-of-Joining in Proper Format";
                    errorDOJ = true;
                }
            }
            if (errorDOJ == false)
            {
                Label8.Text = "";
            }
            Boolean errorPwd = false;
            if (pwd.Length == 0)
            {
                Label10.Text = "Please feed Employee's Password";
                errorPwd = true;
            }
            else if (errorPwd == false)
            {
                Label10.Text = "";
            }

            Boolean errorDept = false;
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
                LabAssDep.Text = "Please Select at least one Department";
                errorDept = true;
            }
            else if (errorDept == false)
            {
                LabAssDep.Text = "";
            }

            if (errorEmpName == false && errorDOB == false && errorDOJ == false && errorPwd == false && errorEmpUserID == false && errorDept == false)
            {
                String password = ComputeHash(TextBox10.Text, new SHA256CryptoServiceProvider());
                SqlCommand com3 = new SqlCommand("update loginDB set username = '" + TextBox9.Text + "', password = '" + password + "' where Id = '" + glob0 + "'", conn);
                com3.ExecuteScalar();
                SqlCommand com4 = new SqlCommand("update faculty set name = '" + TextBox6.Text + "', dob = '" + TextBox7.Text + "', doj = '" + TextBox8.Text + "' where facid = '" + glob0 + "'", conn);
                com4.ExecuteScalar();
                com3 = new SqlCommand("DELETE from fac_dep WHERE facid = '" + glob0 + "'", conn);
                com3.ExecuteScalar();
                for (int i = 0; i <= CheckBoxList1.Items.Count - 1; i++)
                {
                    if (CheckBoxList1.Items[i].Selected)
                    {
                        SqlCommand cm2 = new SqlCommand("insert into fac_dep values('" + glob0 + "','" + CheckBoxList1.Items[i].Text + "')", conn);
                        cm2.ExecuteScalar();
                    }
                }

                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Employee Updated Successfully </h2></font>");
                Label1.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                Label12.Visible = false;
                Label13.Visible = false;
                LabAssDep.Visible = false;
                TextBox6.Visible = false;
                TextBox7.Visible = false;
                TextBox8.Visible = false;
                TextBox9.Visible = false;
                TextBox10.Visible = false;                
                Button6.Visible = false;
                Button7.Visible = false;
                TextBox1.Text = "";
                CheckBoxList1.Visible = false;
                GridView1.DataBind();
                //Response.Redirect("Admin_View_Employee.aspx");
            }

        }
        conn.Close();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = GridView1.SelectedRow.Cells[1].Text;
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Employee with Employee ID '" + TextBox1.Text + "' Deleted Successfully </h2></font>");
            SqlCommand com1 = new SqlCommand("delete from loginDB where Id = '" + TextBox1.Text + "'", conn);
            com1.ExecuteScalar();
            SqlCommand com2 = new SqlCommand("delete from faculty where facid = '" + TextBox1.Text + "'", conn);
            com2.ExecuteScalar();
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label13.Visible = false;
            TextBox6.Visible = false;
            TextBox7.Visible = false;
            TextBox8.Visible = false;
            TextBox9.Visible = false;
            TextBox10.Visible = false;            
            Button6.Visible = false;
            Button7.Visible = false;
            TextBox1.Text = "";
            Response.Redirect("Admin_View_Employee.aspx");
        }
        conn.Close();
    }
}