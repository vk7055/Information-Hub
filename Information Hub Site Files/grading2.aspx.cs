using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using System;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

public partial class grading2 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        conn1.Open();
        if (!IsPostBack)
        {
            BindGridviewData();
            DataTable dt = GetData1();
            LoadChartData1(dt);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ///Session["id"] = "phoenix";
        //Session["groupid"] = "g1";
        //Session["courseid"] = "CS241";
        //String search = "SELECT COUNT(*) FROM exam where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "'";
        //SqlCommand cmd = new SqlCommand(search, conn);
        //int temp = (int)cmd.ExecuteScalar();
        BindGridviewData();

    }
    protected void BindGridviewData()
    {
        ViewState["90+"] = 0;
        ViewState["80+"] = 0;
        ViewState["70+"] = 0;
        ViewState["60+"] = 0;
        ViewState["50+"] = 0;
        ViewState["40+"] = 0;
        ViewState["30+"] = 0;
        ViewState["30-"] = 0;
        DataTable dt = new DataTable();
        dt.Columns.Add("Roll No", typeof(string));
        String search = "SELECT * from exam where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "'";
        SqlCommand cmd = new SqlCommand(search, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        String[] examid = new String[10];
        String[] examname = new String[10];
        int numofexam = 0;
        int par = 0;
        while (reader.Read())
        {
            dt.Columns.Add(reader["exam_name"].ToString(), typeof(string));
            examname[numofexam] = reader["exam_name"].ToString();
            examid[numofexam] = reader["examid"].ToString();
            par = par + Convert.ToInt32(reader["max_marks"].ToString());
            numofexam++;
        }
        dt.Columns.Add("Tatal Marks", typeof(string));
        dt.Columns.Add("Pacentage", typeof(string));
        reader.Close();
        search = "SELECT * from student_course where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' ORDER BY studentid";
        cmd = new SqlCommand(search, conn);
        reader = cmd.ExecuteReader();
        DataRow dtrow;
        while (reader.Read())
        {
            dtrow = dt.NewRow();
            dtrow["Roll No"] = reader["studentid"].ToString();
            int total_marks = 0;
            for (int i = 0; i < numofexam; i++)
            {
                String temp = "SELECT marks from marks where studentid='" + reader["studentid"].ToString() + "' and examid='" + examid[i] + "'";
                SqlCommand cmd1 = new SqlCommand(temp, conn1);
                dtrow[examname[i]] = cmd1.ExecuteScalar().ToString();
                total_marks = total_marks + (int)cmd1.ExecuteScalar();
            }
            dtrow["Tatal Marks"] = total_marks;
            double pas = total_marks * 100;
            pas = pas / par;
            if(pas>=90)
            {
                ViewState["90+"] = Convert.ToInt32(ViewState["90+"].ToString()) + 1;
            }
            if (pas >= 80 && pas <90)
            {
                ViewState["80+"] = Convert.ToInt32(ViewState["80+"].ToString()) + 1;
            }
            if (pas >= 70 && pas < 80)
            {
                ViewState["70+"] = Convert.ToInt32(ViewState["70+"].ToString()) + 1;
            }
            if (pas >= 60 && pas < 70)
            {
                ViewState["60+"] = Convert.ToInt32(ViewState["60+"].ToString()) + 1;
            }
            if (pas >= 50 && pas < 60)
            {
                ViewState["50+"] = Convert.ToInt32(ViewState["50+"].ToString()) + 1;
            }
            if (pas >= 40 && pas < 50)
            {
                ViewState["40+"] = Convert.ToInt32(ViewState["40+"].ToString()) + 1;
            }
            if (pas >= 30 && pas < 40)
            {
                ViewState["30+"] = Convert.ToInt32(ViewState["30+"].ToString()) + 1;
            }
            if ( pas < 30)
            {
                ViewState["30-"] = Convert.ToInt32(ViewState["30-"].ToString()) + 1;
            }
            dtrow["Pacentage"] = Math.Round(Convert.ToDecimal(pas), 2) + "%";
            dt.Rows.Add(dtrow);
        }
        //Bind Data to Columns


        GridView2.DataSource = dt;
        GridView2.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Label1.Visible = true;
        TextBox1.Visible = true;
        Button3.Visible = true;
        //Button4.Visible = true;

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {   // BindGridviewData_single();
            DataTable dt = GetData();
            LoadChartData(dt);
            Chart1.Legends.Add(new Legend("Legend2"));
            Chart1.Series[0].LegendText = "Marks of " + TextBox1.Text;
            Chart1.Series[1].LegendText = "Average Marks";
            Chart1.Series[2].LegendText = "Maximum Marks";
            Label2.Visible = false;
        }
        catch
        {
            Label2.Visible = true;
            Label2.Text = "Please Enter a valid roll no ...";
        }
    }
    protected void BindGridviewData_single()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Roll No", typeof(string));
        String search = "SELECT * from exam where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "'";
        SqlCommand cmd = new SqlCommand(search, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        String[] examid = new String[10];
        String[] examname = new String[10];
        int numofexam = 0;
        int par = 0;
        while (reader.Read())
        {
            dt.Columns.Add(reader["exam_name"].ToString(), typeof(string));
            examname[numofexam] = reader["exam_name"].ToString();
            examid[numofexam] = reader["examid"].ToString();
            par = par + Convert.ToInt32(reader["max_marks"].ToString());
            numofexam++;
        }
        dt.Columns.Add("Tatal Marks", typeof(string));
        dt.Columns.Add("Pacentage", typeof(string));
        reader.Close();
        search = "SELECT * from student_course where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' ORDER BY studentid";
        cmd = new SqlCommand(search, conn);
        reader = cmd.ExecuteReader();
        DataRow dtrow;
        while (reader.Read())
        {
            dtrow = dt.NewRow();
            dtrow["Roll No"] = reader["studentid"].ToString();
            int total_marks = 0;
            for (int i = 0; i < numofexam; i++)
            {
                String temp = "SELECT marks from marks where studentid='" + reader["studentid"].ToString() + "' and examid='" + examid[i] + "'";
                SqlCommand cmd1 = new SqlCommand(temp, conn1);
                dtrow[examname[i]] = cmd1.ExecuteScalar().ToString();
                total_marks = total_marks + (int)cmd1.ExecuteScalar();
            }
            dtrow["Tatal Marks"] = total_marks;
            double pas = total_marks * 100;
            pas = pas / par;
            dtrow["Pacentage"] = Math.Round(Convert.ToDecimal(pas), 2) + "%";
            dt.Rows.Add(dtrow);
        }
        //Bind Data to Columns


        GridView2.DataSource = dt;
        GridView2.DataBind();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        
    }
    private void LoadChartData(DataTable initialDataSource)
    {
        for (int i = 1; i < initialDataSource.Columns.Count; i++)
        {
            Series series = new Series();
            foreach (DataRow dr in initialDataSource.Rows)
            {
                int y = (int)dr[i];
                series.Points.AddXY(dr["Data"].ToString(), y);
            }
            Chart1.Series.Add(series);
        }
    }
    private DataTable GetData()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Data", Type.GetType("System.String"));
        dt.Columns.Add("Value1", Type.GetType("System.Int32"));
        dt.Columns.Add("Value2", Type.GetType("System.Int32"));
        dt.Columns.Add("Value3", Type.GetType("System.Int32"));


        String search = "SELECT * from exam where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "'";
        SqlCommand cmd = new SqlCommand(search, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        String[] examid = new String[10];
        String[] examname = new String[10];
        String[] max_marks = new String[10];
        int numofexam = 0;
        //int par = 0;
        while (reader.Read())
        {
            //dt.Columns.Add(reader["exam_name"].ToString(), typeof(string));
            examname[numofexam] = reader["exam_name"].ToString();
            examid[numofexam] = reader["examid"].ToString();
            max_marks[numofexam] = reader["max_marks"].ToString();
            //par = par + Convert.ToInt32(reader["max_marks"].ToString());
            numofexam++;
        }
        reader.Close();
        DataRow dr1;
        int numofstudent = 0;
        search = "SELECT count(*) from student_course where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "'";
        cmd = new SqlCommand(search, conn);
        numofstudent = (int)cmd.ExecuteScalar();
        for (int i = 0; i < numofexam; i++)
        {
            dr1 = dt.NewRow();
            dr1["Data"] = examname[i];
            dr1["Value3"] = max_marks[i];
            String temp = "SELECT marks from marks where studentid='" + TextBox1.Text + "' and examid='" + examid[i] + "'";
            SqlCommand cmd1 = new SqlCommand(temp, conn1);
            dr1["Value1"] = (int)cmd1.ExecuteScalar();
            search = "SELECT * from marks where examid='" + examid[i] + "'";
            cmd = new SqlCommand(search, conn);
            reader = cmd.ExecuteReader();

            int totalmarks = 0;
            while (reader.Read())
            {
                totalmarks = totalmarks + Convert.ToInt32(reader["marks"].ToString());

            }
            reader.Close();
            dr1["Value2"] = (int)(totalmarks / numofstudent);
            dt.Rows.Add(dr1);
        }
        return dt;
    }
    
    protected void Button5_Click(object sender, EventArgs e)
    {
        ExportGridToPDF();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    }  
    private void ExportGridToPDF()
    {

        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=Student performence.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        GridView2.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
        GridView2.AllowPaging = true;
        GridView2.DataBind();
    }
    protected void Button6_Click(object sender, System.EventArgs e)
    {
        DataTable dt = GetData1();
        LoadChartData1(dt);
    }
    private DataTable GetData1()
    {
       // Response.Write(TextBox1.Text);
        DataTable dt = new DataTable();
        dt.Columns.Add("Data", Type.GetType("System.String"));
        dt.Columns.Add("Value1", Type.GetType("System.Int32"));
        DataRow dr1;

        dr1 = dt.NewRow();
        dr1["Data"] = "90%-100%";
        dr1["Value1"] =Convert.ToInt32(ViewState["90+"].ToString());
        dt.Rows.Add(dr1);

        dr1 = dt.NewRow();
        dr1["Data"] = "80%-90%";
        dr1["Value1"] = Convert.ToInt32(ViewState["80+"].ToString());
        dt.Rows.Add(dr1);

        dr1 = dt.NewRow();
        dr1["Data"] = "70% - 80%";
        dr1["Value1"] = Convert.ToInt32(ViewState["70+"].ToString());
        dt.Rows.Add(dr1);

        dr1 = dt.NewRow();
        dr1["Data"] = "60% - 70%";
        dr1["Value1"] = Convert.ToInt32(ViewState["60+"].ToString());
        dt.Rows.Add(dr1);

        dr1 = dt.NewRow();
        dr1["Data"] = "50% - 60%";
        dr1["Value1"] = Convert.ToInt32(ViewState["50+"].ToString());
        dt.Rows.Add(dr1);

        dr1 = dt.NewRow();
        dr1["Data"] = "40% - 50%";
        dr1["Value1"] = Convert.ToInt32(ViewState["40+"].ToString());
        dt.Rows.Add(dr1);

        dr1 = dt.NewRow();
        dr1["Data"] = "30% - 40%";
        dr1["Value1"] = Convert.ToInt32(ViewState["30+"].ToString());
        dt.Rows.Add(dr1);

        dr1 = dt.NewRow();
        dr1["Data"] = "less than 30 %";
        dr1["Value1"] = Convert.ToInt32(ViewState["30-"].ToString());
        dt.Rows.Add(dr1);

        return dt;
    }
    private void LoadChartData1(DataTable initialDataSource)
    {
        for (int i = 1; i < initialDataSource.Columns.Count; i++)
        {
            Series series = new Series();
            foreach (DataRow dr in initialDataSource.Rows)
            {
                int y = (int)dr[i];
                series.Points.AddXY(dr["Data"].ToString(), y);
            }
            Chart2.Series.Add(series);
        }
    }

}