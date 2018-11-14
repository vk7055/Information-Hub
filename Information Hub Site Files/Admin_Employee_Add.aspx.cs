using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn1.Open();
        LabUserId.Text = Session["id"].ToString();
        LabUserName.Text = Session["username"].ToString();
    }
    public String ComputeHash(String input, HashAlgorithm algrithm)
    {
        Byte[] inputBytes = Encoding.UTF8.GetBytes(input);
        Byte[] hashedbytes = algrithm.ComputeHash(inputBytes);
        return BitConverter.ToString(hashedbytes);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            String checkempid = TextBox1.Text;
            String checkempUserid = TextBox6.Text;
            String empName = TextBox3.Text;
            String DOB = TextBox4.Text;
            String DOJ = TextBox5.Text;
            String pwd = TextBox2.Text;
            String empid = "SELECT count(*) from loginDB where Id='" + TextBox1.Text + "'";
            String empUserid = "SELECT count(*) from loginDB where username='" + TextBox6.Text + "'";
            SqlCommand com1 = new SqlCommand(empid, conn1);
            int temp1 = (int)com1.ExecuteScalar();
            SqlCommand com2 = new SqlCommand(empUserid, conn1);
            int temp2 = (int)com2.ExecuteScalar();
            Boolean errorEmpID = false;
            Boolean errorEmpUserID = false;
            if(temp1 == 1)
            {
                LabEmpID.Text = "Employee ID already used";
                errorEmpID = true;
            }
            else if (checkempid.Length == 0)
            {
                LabEmpID.Text = "Please feed Employee's ID";
                errorEmpID = true;
            }
            else if (errorEmpID == false)
            {
                LabEmpID.Text = "";
            }
            if (temp2 == 1)
            {
                LabEmpUserID.Text = "Employee User ID already used";
                errorEmpUserID = true;
            }
            else if (checkempUserid.Length == 0)
            {
                LabEmpUserID.Text = "Please feed Employee's User ID";
                errorEmpUserID = true;
            }
            else if (errorEmpUserID == false)
            {
                LabEmpUserID.Text = "";
            }
            Boolean errorEmpName = false;
            if (empName.Length == 0)
            {
                LabEmpName.Text = "Please feed Employee's Name";
                errorEmpName = true;
            }
            else if (errorEmpName == false)
            {
                LabEmpName.Text = "";
            }
            Boolean errorDOB = false;
            if (DOB.Length == 0)
            {
                LabEmpDOB.Text = "Please feed Employee's Date-of-Birth";
                errorDOB = true;
            }
            else
            {
                string dateString = TextBox4.Text;
                try
                {
                    DateTime date1 = DateTime.Parse(dateString);
                }
                catch
                {
                    LabEmpDOB.Text = "Please feed Employee's Date-of-Birth in Proper Format";
                    errorDOB = true;
                }
            }
            if(errorDOB == false)
            {
                LabEmpDOB.Text = "";
            }
            Boolean errorDOJ = false;
            if (DOJ.Length == 0)
            {
                LabEmpDOJ.Text = "Please feed Employee's Date-of-Joining";
                errorDOJ = true;
            }
            else
            {
                string dateString = TextBox5.Text;
                try
                {
                    DateTime date1 = DateTime.Parse(dateString);
                }
                catch
                {
                    LabEmpDOJ.Text = "Please feed Employee's Date-of-Joining in Proper Format";
                    errorDOJ = true;
                }
            }
            if (errorDOJ == false)
            {
                LabEmpDOJ.Text = "";
            }
            Boolean errorPwd = false;
            if (pwd.Length == 0)
            {
                LabEmpPass.Text = "Please feed Employee's Password";
                errorPwd = true;
            }
            else if (errorPwd == false)
            {
                LabEmpPass.Text = "";
            }
            Boolean errorAssDept = false;
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
                errorAssDept = true;
            }
            else if (errorAssDept == false)
            {
                LabAssDept.Text = "";
            }
            if (errorEmpName == false && errorDOB == false && errorDOJ == false && errorEmpID == false && errorPwd == false && errorEmpUserID == false && errorAssDept == false)
            {
                String password = ComputeHash(TextBox2.Text, new SHA256CryptoServiceProvider());
                SqlCommand com3 = new SqlCommand("insert into loginDB values('" + TextBox1.Text + "','" + TextBox6.Text + "','" + password + "','" + 1 + "')", conn1);
                com3.ExecuteNonQuery();
                SqlCommand com4 = new SqlCommand("insert into faculty values('" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "')", conn1);
                com4.ExecuteScalar();
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Employee Added Successfully </h2></font>");
                SqlCommand com5;
                String empUs = "SELECT count(*) from leave_type";
                SqlCommand com6 = new SqlCommand(empUs, conn1);
                int temp3 = (int)com6.ExecuteScalar();
                String st1 = "";
                String st2 = "";
                int i = 0;
                for( i = 0; i < temp3; i++)
                {
                    st1 = GridView1.Rows[i].Cells[0].Text;
                    st2 = GridView1.Rows[i].Cells[2].Text;
                    String temp_next_year = DateTime.Today.ToString("yyyy");
                    int temp = Convert.ToInt32(temp_next_year);
                    temp = temp + 1;
                    com5 = new SqlCommand("insert into leave_remain values('" + TextBox1.Text + "','" + st1 + "','" + st2 + "','" + DateTime.Today.ToString("yyyy") + "')", conn1);
                    com5.ExecuteScalar();
                    com5 = new SqlCommand("insert into leave_remain values('" + TextBox1.Text + "','" + st1 + "','" + st2 + "','" + temp + "')", conn1);
                    com5.ExecuteScalar();
                }
                for (int k = 0; k <= CheckBoxList1.Items.Count - 1; k++)
                {
                    if (CheckBoxList1.Items[k].Selected)
                    {
                        SqlCommand cm2 = new SqlCommand("insert into fac_dep values('" + TextBox1.Text + "','" + CheckBoxList1.Items[k].Text + "')", conn1);
                        cm2.ExecuteScalar();
                    }
                }
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                for (int k = 0; k <= CheckBoxList1.Items.Count - 1; k++)
                {
                    if (CheckBoxList1.Items[k].Selected)
                        CheckBoxList1.Items[k].Selected = false;
                }
            }
        }
        conn1.Close();
    }
    protected void TextBox5_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox4_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }
}