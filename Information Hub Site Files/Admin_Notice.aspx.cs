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
    static int task = 0;
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        LabUserId.Text = Session["id"].ToString();
        LabUserName.Text = Session["username"].ToString();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            String cunt = "SELECT count(*) from notifications";
            SqlCommand com2 = new SqlCommand(cunt, conn);
            int temp2 = (int)com2.ExecuteScalar();
            String checkuser = "SELECT * from notifications";
            com2 = new SqlCommand(checkuser, conn);
            SqlDataReader reader = com2.ExecuteReader();
            int n = 0;
            int temp1 = 0;
            string[] fields = new string[temp2];
            while (reader.Read())
            {
                fields[n] = reader["notice"].ToString();
                if(fields[n].Equals(TextBox1.Text))
                {
                    temp1++;
                }
                n++;
            }
            reader.Close();                                                // For Important Notices         flag = 1
            temp2 = temp2 + 1;                                             // For News                      flag = 2
            if (temp1 != 0)
            {
                LabNot.Text = "Already Uploaded";
            }
            else if (TextBox1.Text.Length == 0)
            {
                LabNot.Text = "Empty Field";
            }
            else
            {
                String date = "";
                for (int i = 0; i < 10; i++)
                {
                    date = date + DateTime.Today.ToString()[i];
                }
                LabNot.Text = "";
                SqlCommand com = new SqlCommand("insert into notifications values('" + temp2 + "','" + TextBox1.Text + "','" + date + "','" + task + "')", conn);
                com.ExecuteScalar();
                Panel1.Visible = false;
                Button2.Visible = true;
                Button5.Visible = true;
                GridView1.DataBind();
                GridView2.DataBind();
            }
        }
        conn.Close();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            Panel1.Visible = false;
            Button2.Visible = true;
            Button5.Visible = true;
        }
        conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            Button5.Visible = false;
            task = 1;
            TextBox1.Text = "";
            LabNot.Text = "";
            Panel1.Visible = true;
        }
        conn.Close();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Button2.Visible = false;
            task = 2;
            TextBox1.Text = "";
            LabNot.Text = "";
            Panel1.Visible = true;
        }
        conn.Close();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            LabUpd.Text = "";
            Panel3.Visible = true;
            LabNotNew.Text = "Notification";
            TextBox3.Text = GridView1.SelectedRow.Cells[1].Text;
            if (TextBox3.Text.Length == 0)
            {
                LabUpd.Text = "";
            }
        }
        conn.Close();
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            LabUpd.Text = "";
            Panel3.Visible = true;
            LabNotNew.Text = "News";
            TextBox3.Text = GridView2.SelectedRow.Cells[1].Text;
            if (TextBox3.Text.Length == 0)
            {
                LabUpd.Text = "";
            }

        }
        conn.Close();
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            TextBox3.Text = "";
            Panel3.Visible = false;
            TextBox3.Text = "";
        }
        conn.Close();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            if(LabNotNew.Text.Equals("Notification"))
            {
                int a = -1;
                SqlCommand com = new SqlCommand("UPDATE notifications SET flag='" + a + "' WHERE notice= '" + GridView1.SelectedRow.Cells[1].Text + "'", conn);
                com.ExecuteScalar();
                GridView1.DataBind();
            }
            else
            {
                int a = -2;
                SqlCommand com = new SqlCommand("UPDATE notifications SET flag='" + a + "' WHERE notice= '" + GridView2.SelectedRow.Cells[1].Text + "'", conn);
                com.ExecuteScalar();
                GridView2.DataBind();
            }
            Panel3.Visible = false;
            TextBox3.Text = "";
        }
        conn.Close();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            if (LabNotNew.Text.Equals("Notification"))
            {
                if (TextBox3.Text.Length == 0)
                {
                    LabUpd.Text = "Empty Field";
                }
                else
                {
                    SqlCommand com = new SqlCommand("UPDATE notifications SET notice='" + TextBox3.Text + "' WHERE notice= '" + GridView1.SelectedRow.Cells[1].Text + "'", conn);
                    com.ExecuteScalar();
                    GridView1.DataBind();
                    Panel3.Visible = false;
                    TextBox3.Text = "";
                }
            }
            else
            {
                if (TextBox3.Text.Length == 0)
                {
                    LabUpd.Text = "Empty Field";
                }
                else
                {
                    SqlCommand com = new SqlCommand("UPDATE notifications SET notice='" + TextBox3.Text + "' WHERE notice= '" + GridView2.SelectedRow.Cells[1].Text + "'", conn);
                    com.ExecuteScalar();
                    GridView2.DataBind();
                    Panel3.Visible = false;
                    TextBox3.Text = "";
                }
            }
        }
        conn.Close();
    }
}