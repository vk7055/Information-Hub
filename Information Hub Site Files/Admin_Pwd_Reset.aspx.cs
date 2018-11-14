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

public partial class Default6 : System.Web.UI.Page
{
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String password1 = ComputeHash(TextBox1.Text, new SHA256CryptoServiceProvider());
            String password2 = ComputeHash(TextBox2.Text, new SHA256CryptoServiceProvider());
            Boolean errorOldPwd = false;
            String username = Session["username"].ToString();
            SqlCommand com = new SqlCommand("SELECT password FROM loginDB WHERE username = '" + username + "'", conn);
            String pwd = com.ExecuteScalar().ToString();
            if (TextBox1.Text.Length == 0)
            {
                LabOldPwd.Text = "Please feed Old Password";
                errorOldPwd = true;
            }
            else if( !(password1.Equals(pwd)) )
            {
                LabOldPwd.Text = "Incorrect Old Password";
                errorOldPwd = true;
            }
            else if (errorOldPwd == false)
            {
                LabOldPwd.Text = "";
            }
            Boolean errorNewPwd = false;
            if (TextBox2.Text.Length == 0)
            {
                LabNewPwd.Text = "Please feed New Password";
                errorNewPwd = true;
            }
            else if (errorNewPwd == false)
            {
                LabNewPwd.Text = "";
            }
            Boolean errorConPwd = false;
            if (TextBox3.Text.Length == 0)
            {
                LabConPwd.Text = "Please feed New Password";
                errorConPwd = true;
            }
            else if ( !(TextBox3.Text.Equals(TextBox2.Text)) )
            {
                LabConPwd.Text = "Incorrect New Password";
                errorConPwd = true;
            }
            else if (errorConPwd == false)
            {
                LabConPwd.Text = "";
            }
            if( errorOldPwd == false && errorNewPwd == false && errorConPwd == false)
            {
                com = new SqlCommand("UPDATE loginDB SET password = '" + password2 + "' WHERE username = '" + username + "'", conn);
                com.ExecuteScalar();
                Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Password Changed Successfully </h2></font>");
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
            }
        }
        conn.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        String password1 = ComputeHash(TextBox5.Text, new SHA256CryptoServiceProvider());
        Boolean errorUsrNam = false;
        SqlCommand com = new SqlCommand("SELECT count(*) FROM loginDB WHERE username = '" + TextBox4.Text + "'", conn);
        int temp = Convert.ToInt32(com.ExecuteScalar());
        if (TextBox4.Text.Length == 0)
        {
            LabUsrNam.Text = "Please feed Username";
            errorUsrNam = true;
        }
        else if ( temp == 0 )
        {
            LabUsrNam.Text = "Username not found";
            errorUsrNam = true;
        }
        else if (errorUsrNam == false)
        {
            LabUsrNam.Text = "";
        }
        Boolean errorNewPwd2 = false;
        if (TextBox5.Text.Length == 0)
        {
            LabNewPwd2.Text = "Please feed New Password";
            errorNewPwd2 = true;
        }
        else if (errorNewPwd2 == false)
        {
            LabNewPwd2.Text = "";
        }
        Boolean errorConPwd2 = false;
        if (TextBox6.Text.Length == 0)
        {
            LabConPwd2.Text = "Please feed New Password";
            errorConPwd2 = true;
        }
        else if (!(TextBox6.Text.Equals(TextBox5.Text)))
        {
            LabConPwd2.Text = "Incorrect New Password";
            errorConPwd2 = true;
        }
        else if (errorConPwd2 == false)
        {
            LabConPwd2.Text = "";
        }
        if (errorUsrNam == false && errorNewPwd2 == false && errorConPwd2 == false)
        {
            com = new SqlCommand("UPDATE loginDB SET password = '" + password1 + "' WHERE username = '" + TextBox4.Text + "'", conn);
            com.ExecuteScalar();
            Response.Write("<font color = " + '"' + "green" + '"' + "><h2>Password Changed Successfully </h2></font>");
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
        }
    }
}