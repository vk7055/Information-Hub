using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
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

public partial class attendence2 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        conn1.Open();
        conn2.Open();
        Label1.Text = Session["courseid"].ToString();
        Label2.Text = Session["groupid"].ToString();
        BindGridviewData();
        DataTable dt = GetData1();
        LoadChartData1(dt);
        SqlCommand cmd = new SqlCommand("update  attendence SET att='" + 1 + "' where att='" + -1 + "' ", conn2);
        cmd.ExecuteScalar();
    }
    private DataTable GetData1()
    {
        // Response.Write(TextBox1.Text);
        DataTable dt = new DataTable();
        dt.Columns.Add("Data", Type.GetType("System.String"));
        dt.Columns.Add("Value1", Type.GetType("System.Int32"));
        DataRow dr1;

        dr1 = dt.NewRow();
        dr1["Data"] = "100%-75%";
        dr1["Value1"] = Convert.ToInt32(ViewState["75+"].ToString());
        dt.Rows.Add(dr1);

        dr1 = dt.NewRow();
        dr1["Data"] = "75%-50%";
        dr1["Value1"] = Convert.ToInt32(ViewState["50+"].ToString());
        dt.Rows.Add(dr1);

        dr1 = dt.NewRow();
        dr1["Data"] = "Less 50%";
        dr1["Value1"] = Convert.ToInt32(ViewState["50-"].ToString());
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
            Chart1.Series.Add(series);
            //Chart1.YAxis.ScaleRange.ValueHigh = 100;
            //Chart1.YAxis.ScaleRange.ValueLow = 0;
            
        }
    }
    protected void BindGridviewData()
    {
        
        ViewState["75+"] = 0;
       
        ViewState["50+"] = 0;
        
        ViewState["50-"] = 0;
        DataTable dt = new DataTable();
        dt.Columns.Add("Roll No", typeof(string));
        String search = "SELECT * from fac_attendence where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "'";
        SqlCommand cmd = new SqlCommand(search, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        String[] attid = new String[50];
        String[] attdate = new String[50];
        int numofatt = 0;
        //int par = 0;
        while (reader.Read())
        {
            String[] temp1 = reader["date"].ToString().Split(' ');
            attdate[numofatt] = temp1[0];
            dt.Columns.Add(temp1[0], typeof(string));
            //String [] temp1 =reader["date"].ToString().Split(' ');
            //attdate[numofatt] = temp1[0]+" ";
            attid[numofatt] = reader["attid"].ToString();
            //par ;
            numofatt++;
        }
        dt.Columns.Add("Total attendance", typeof(string));
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
            int total_att = 0;
            for (int i = 0; i < numofatt; i++)
            {
                String temp = "SELECT att from attendence where studentid='" + reader["studentid"].ToString() + "' and attid='" + attid[i] + "'";
                SqlCommand cmd1 = new SqlCommand(temp, conn1);
                dtrow[attdate[i]] = cmd1.ExecuteScalar().ToString();
                total_att = total_att + (int)cmd1.ExecuteScalar();
            }
            dtrow["Total attendance"] = total_att;
            double pas = total_att * 100;
            pas = pas / numofatt;
            if (pas >= 75)
            {
                ViewState["75+"] = Convert.ToInt32(ViewState["75+"].ToString()) + 1;
            }
            if (pas >= 50 && pas < 75)
            {
                ViewState["50+"] = Convert.ToInt32(ViewState["50+"].ToString()) + 1;
            }           
            if (pas < 50)
            {
                ViewState["50-"] = Convert.ToInt32(ViewState["50-"].ToString()) + 1;
            }
            dtrow["Pacentage"] = Math.Round(Convert.ToDecimal(pas), 2) + "%";
            dt.Rows.Add(dtrow);
        }
        //Bind Data to Columns


        GridView4.DataSource = dt;
        GridView4.DataBind();
    }
    protected void GridView4_SelectedIndexChanged(object sender, System.EventArgs e)
    {

    }
    protected void Button1_Click(object sender, System.EventArgs e)
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
        Response.AddHeader("content-disposition", "attachment;filename=Attendance.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        GridView4.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
        GridView4.AllowPaging = true;
        GridView4.DataBind();
    }
    protected void Button2_Click(object sender, System.EventArgs e)
    {
        try
        {
            int present = 0;
            present = Convert.ToInt32(RadioButtonList1.SelectedValue.ToString());
            SqlCommand cmd1 = new SqlCommand("select attid from fac_attendence where facid ='" + Session["id"] + "' and courseid= '" + Session["courseid"] + "' and groupid ='" + Session["groupid"] + "' and date='" + DropDownList2.SelectedValue.ToString() + "'", conn2);
            int attid = (int)cmd1.ExecuteScalar();
            cmd1 = new SqlCommand("UPDATE attendence SET  att='" + present + "' WHERE  attid= '" + attid + "' and studentid='" + DropDownList1.SelectedValue.ToString() + "'", conn2);
            cmd1.ExecuteScalar();
            Response.Redirect("attendence2.aspx");
            Label3.Visible = false;
        }
        catch
        {
            Label3.Visible = true;
            Label3.Text = "Please feed all Entry";
        }
    }
    protected void RadioButton1_CheckedChanged(object sender, System.EventArgs e)
    {

    }
    protected void RadioButton2_CheckedChanged(object sender, System.EventArgs e)
    {

    }
    protected void Button3_Click(object sender, System.EventArgs e)
    {
        Panel5.Visible = true;
    }
}