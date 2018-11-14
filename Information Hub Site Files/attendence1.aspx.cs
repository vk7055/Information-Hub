using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Data;
using ClosedXML.Excel;
public partial class attendence1 : System.Web.UI.Page
{
    private int numOfRows = 0;
    private int numOfColumns = 0;
    private void GenerateTable(int colsCount, int rowsCount)
    {
        String search = "SELECT * FROM student_course where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' ORDER BY studentid";
        SqlCommand cmd = new SqlCommand(search, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        //Creat the Table and Add it to the Page
        Table table = new Table();
        table.ID = "Table1";
        Panel2.Controls.Add(table);

        // Now iterate through the table and add your controls 
        for (int i = 0; i < rowsCount; i++)
        {
            reader.Read();
            TableRow row = new TableRow();
            for (int j = 0; j < colsCount; j++)
            {
                TableCell cell = new TableCell();
                TextBox tb = new TextBox();

                // Set a unique ID for each TextBox added
                tb.ID = "TextBoxRow_" + i + "Col_" + j;
                Label l = new Label();
                l.ID = "lebel_" + i + "Col_" + j;
                String temp = reader["studentid"].ToString();
                temp = temp + "  ";
                l.Text = temp;
                cell.Controls.Add(l);
                // Add the control to the TableCell
                cell.Controls.Add(tb);
                // Add the TableCell to the TableRow
                row.Cells.Add(cell);
            }

            // Add the TableRow to the Table
            table.Rows.Add(row);
        }
        reader.Close();
    }
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    String[] coloum_name = new String[10];
    String[,] excel;
    int n;
    string filename;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "Course : " + Session["courseid"] + "<br/>" + "Groupid : " + Session["groupid"];
        conn.Open();
        conn1.Open();
        GenerateTable(numOfColumns, numOfRows);

        // the two paramters are declared globally
        //GenerateTable(numOfColumns, numOfRows);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Panel1.Visible = true;
        SqlCommand cmd1;
        cmd1 = new SqlCommand("select count(*) from fac_attendence where facid ='" + Session["id"] + "' and courseid= '" + Session["courseid"] + "' and groupid ='" + Session["groupid"] + "' and date='" + DateTime.Today.ToString("MM/dd/yyyy") + "'", conn);
        int temp=(int)cmd1.ExecuteScalar();
        if(temp==0)
        {
            cmd1 = new SqlCommand("insert into fac_attendence values('" + Session["id"] + "','" + Session["courseid"] + "','" + Session["groupid"] + "','" + DateTime.Today.ToString("MM/dd/yyyy") + "')", conn);
            cmd1.ExecuteScalar();
            cmd1 = new SqlCommand("select attid from fac_attendence where facid ='" + Session["id"] + "' and courseid= '" + Session["courseid"] + "' and groupid ='" + Session["groupid"] + "' and date='" + DateTime.Today.ToString("MM/dd/yyyy") + "'", conn);
            Session["attid"] = (int)cmd1.ExecuteScalar();
            cmd1 = new SqlCommand("select * from student_course where courseid ='" + Session["courseid"] + "' and groupid ='" + Session["groupid"] +  "' ORDER BY studentid", conn);
            SqlDataReader reader = cmd1.ExecuteReader();
            while (reader.Read())
            {
                SqlCommand cmd = new SqlCommand("insert into attendence values('" + reader["studentid"] + "','" + -1 + "','" + Session["attid"] + "')", conn1);
                cmd.ExecuteScalar();
            }
            reader.Close();
        }
        else
        {
            cmd1 = new SqlCommand("select attid from fac_attendence where facid ='" + Session["id"] + "' and courseid= '" + Session["courseid"] + "' and groupid ='" + Session["groupid"] + "' and date='" + DateTime.Today.ToString("MM/dd/yyyy") + "'", conn);
            Session["attid"]=(int)cmd1.ExecuteScalar();
        }
        

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //System.Web.UI.WebControls.GridViewCommandEventArgs e1 = null;
       // e = System.Web.UI.WebControls.GridViewCommandEventArgs;
        //Response.Write(e1.CommandName);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "p")
        {
             int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];

            
            //Response.Write(row.Cells[0].Text);
            SqlCommand cmd = new SqlCommand("update attendence set att='1' where attid='" + Session["attid"] + "' and studentid='" + row.Cells[0].Text + "'", conn);
            cmd.ExecuteScalar();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();
        }
        else 
        {
            //Response.Write("a");
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];


            //Response.Write(row.Cells[0].Text);
            SqlCommand cmd = new SqlCommand("update attendence set att=0 where attid='" + Session["attid"] + "' and studentid='" + row.Cells[0].Text + "'", conn);
            cmd.ExecuteScalar();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();

        }

    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView2.Rows[index];


            //Response.Write(row.Cells[0].Text);
            SqlCommand cmd = new SqlCommand("update attendence set att=0 where attid='" + Session["attid"] + "' and studentid='" + row.Cells[0].Text + "'", conn);
            cmd.ExecuteScalar();
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();

    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = GridView3.Rows[index];


        //Response.Write(row.Cells[0].Text);
        SqlCommand cmd = new SqlCommand("update attendence set att=1 where attid='" + Session["attid"] + "' and studentid='" + row.Cells[0].Text + "'", conn);
        cmd.ExecuteScalar();
        GridView1.DataBind();
        GridView2.DataBind();
        GridView3.DataBind();

    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("attendence2.aspx");
       // BindGridviewData();
    }
    protected void BindGridviewData()
    {
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
            dt.Columns.Add(reader["date"].ToString(), typeof(string));
            attdate[numofatt] = reader["date"].ToString();
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
            dtrow["Pacentage"] = Math.Round(Convert.ToDecimal(pas), 2) + "%";
            dt.Rows.Add(dtrow);
        }
        //Bind Data to Columns


        GridView4.DataSource = dt;
        GridView4.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                string path = string.Concat(Server.MapPath("~/Uploaded Folder/" + FileUpload1.FileName));
                FileUpload1.SaveAs(path);
                //String path1 = string.Concat(Server.MapPath("~/Uploaded Folder1/" + FileUpload1.FileName));
                //FileUpload1.SaveAs(path1);
                filename = FileUpload1.FileName;
                // Connection String to Excel Workbook
                string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);
                OleDbConnection connection = new OleDbConnection();
                connection.ConnectionString = excelConnectionString;
                OleDbCommand command = new OleDbCommand("select * from [Sheet1$]", connection);
                connection.Open();
                // Create DbDataReader to Data Worksheet
                DbDataReader dr1 = command.ExecuteReader();
                int numofrow = dr1.Cast<object>().Count();
                dr1.Close(); 
                DbDataReader dr = command.ExecuteReader();

                // String[] exam_name = new String[10];
                //int numofcoloum = 0;
                coloum_name[0] = dr.GetName(0).ToString();
                //ViewState["0"] = coloum_name[0];
                excel = new String[numofrow, dr.FieldCount];

                for (int col = 1; col < dr.FieldCount; col++)
                {

                    coloum_name[col] = dr.GetName(col).ToString();
                  //  ViewState[col + ""] = coloum_name[col];
                    //DropDownList1.Items.Add(new ListItem(coloum_name[col], col + ""));
                    //add(new ListItem(coloum_name[col], coloum_name[col]));

                    // Gets the column name
                    // Console.Write(dr.GetFieldType(col).ToString());    // Gets the column type
                    //Console.Write(dr.GetDataTypeName(col).ToString()); // Gets the column database type
                }
                n = 0;
                while (dr.Read())
                {
                    for (int col = 0; col < dr.FieldCount; col++)
                    {
                        excel[n, col] = dr[coloum_name[col]].ToString();
                    }
                    n++;
                }
                
                //ViewState["n"] = n;
                int fieldcount = dr.FieldCount;
                int attid = 0;
                int exist_att = 0;
                //int temp = 0;
                    for (int j = 1; j < fieldcount; j++)
                    {
                        String search = "SELECT COUNT(*) from fac_attendence where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "' and date='" + DateTime.Parse(coloum_name[j]) + "'";
                        SqlCommand cmd = new SqlCommand(search, conn);
                        int temp = (int)cmd.ExecuteScalar();
                        
                        //Response.Write(j);
                        if (temp == 0)
                        {
                            SqlCommand cmd1;
                            cmd1 = new SqlCommand("insert into fac_attendence values('" + Session["id"] + "','" + Session["courseid"] + "','" + Session["groupid"] + "','" + DateTime.Parse(coloum_name[j]) + "')", conn);
                            cmd1.ExecuteScalar();
                            cmd1 = new SqlCommand("select attid from fac_attendence where facid ='" + Session["id"] + "' and courseid= '" + Session["courseid"] + "' and groupid ='" + Session["groupid"] + "' and date='" + DateTime.Parse(coloum_name[j]) + "'", conn);
                            attid = (int)cmd1.ExecuteScalar();
                            exist_att = 0;
                            //Response.Write(j);
                        }
                        else
                        {
                            SqlCommand cmd1;
                            cmd1 = new SqlCommand("select attid from fac_attendence where facid ='" + Session["id"] + "' and courseid= '" + Session["courseid"] + "' and groupid ='" + Session["groupid"] + "' and date='" + DateTime.Parse(coloum_name[j]) + "'", conn);
                            attid = (int)cmd1.ExecuteScalar();
                            exist_att = 1;
                            //Response.Write(j);
                        }
                        for (int i = 0; i < n; i++)
                        {
                           // ViewState[i + "," + j] = excel[i, j];
                            if (exist_att == 0)
                            {
                                SqlCommand cmd2;
                                cmd2 = new SqlCommand("insert into attendence values('" + excel[i, 0] + "','" + excel[i, j] + "','" + attid + "')", conn1);
                                cmd2.ExecuteScalar();
                                //Response.Write(i);
                            }
                           // Response.Write(excel[i, j]);
                            //Response.Write(i + "," + j + "<br/>");
                        }
                    }
                //ViewState["array"] = excel;
                // SQL Server Connection String
                //string sqlConnectionString = @"Data Source=data";

                // Bulk Copy to SQL Server 
                //SqlBulkCopy bulkInsert = new SqlBulkCopy(conn);
                //bulkInsert.DestinationTableName = "Student_Record";
                //bulkInsert.WriteToServer(dr);
                //Label1.Text = "Ho Gaya";
                    dr.Close();
                    connection.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
            //conn.Close();
        }
    }
    protected void Button4_Click(object sender, System.EventArgs e)
    {
        String search = "SELECT COUNT(*) FROM student_course where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "'";
        SqlCommand cmd = new SqlCommand(search, conn);
        int temp = (int)cmd.ExecuteScalar();
        numOfRows = temp;
        numOfColumns = 1;
        ViewState["cols"] = numOfColumns;
        ViewState["rows"] = numOfRows;
        GenerateTable(numOfColumns, numOfRows);
    }


    protected void Button5_Click(object sender, System.EventArgs e)
    {

        SqlCommand cmd = new SqlCommand("insert into fac_attendence values('" + Session["id"] + "','" + Session["courseid"] + "','" + Session["groupid"] + "','" + DateTime.Today.ToString("MM/dd/yyyy") + "')", conn);
        cmd.ExecuteScalar();
        cmd = new SqlCommand("SELECT attid FROM fac_attendence where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' and facid='" + Session["id"] + "' and date='" + DateTime.Today.ToString("MM/dd/yyyy") +"'", conn);
        int attid = (int)cmd.ExecuteScalar();
        String search = "SELECT * FROM student_course where courseid='" + Session["courseid"] + "' and groupid='" + Session["groupid"] + "' ORDER BY studentid";
        cmd = new SqlCommand(search, conn);
        SqlDataReader reader1 = cmd.ExecuteReader();
        String[] student = new String[100];
        int n = 0;
        while (reader1.Read())
        {
            //string[] fields = new string[1];
            student[n] = reader1["studentid"].ToString();
            //fields[1] = reader["EmpName"].ToString();
            n++;
        }
        reader1.Close();
        // Now you have a list of arrays that you can iterate over
        //Response.Write("succesfull entry");
        if (ViewState["cols"] != null && ViewState["rows"] != null)
        {
            //Find the Table in the page
            // Response.Write("succesfull entry");
            Table table = (Table)Page.FindControl("Table1");
            if (table != null)
            {
                //   Response.Write("succesfull entry");
                //Re create the Table with the current rows and columns
                GenerateTable(int.Parse(ViewState["cols"].ToString()), int.Parse(ViewState["rows"].ToString()));

                // Now we can loop through the rows and columns of the Table and get the values from the TextBoxes
                for (int i = 0; i < int.Parse(ViewState["rows"].ToString()); i++)
                {
                    //     Response.Write("succesfull entry");
                    // reader1.Read();
                    for (int j = 0; j < int.Parse(ViewState["cols"].ToString()); j++)
                    {
                        //Print the values entered
                        if (Request.Form["TextBoxRow_" + i + "Col_" + j] != string.Empty)
                        {
                            SqlCommand cmd1 = new SqlCommand("insert into attendence values('" + student[i] + "','" + Request.Form["TextBoxRow_" + i + "Col_" + j] + "','" + attid + "')", conn);
                            cmd1.ExecuteScalar();
                            //Request.Form["TextBoxRow_" + i + "Col_" + j]
                            //Response.Write(Request.Form["TextBoxRow_" + i + "Col_" + j] + "<BR/>");
                        }
                    }
                }
            }
        }
        Response.Write("<script type='text/javascript'>");
        Response.Write("window.alert('Successfully Added');");
        Response.Write("window.location='attendence1.aspx';");
        Response.Write("</script>");
    }
    protected void Button6_Click(object sender, System.EventArgs e)
    {
        GridView5.Visible = true;
        DataTable dt = new DataTable("GridView_Data");
        foreach (TableCell cell in GridView5.HeaderRow.Cells)
        {
            dt.Columns.Add(cell.Text);
        }
        foreach (GridViewRow row in GridView5.Rows)
        {
            dt.Rows.Add();
            for (int i = 0; i < row.Cells.Count; i++)
            {
                dt.Rows[dt.Rows.Count - 1][i] = row.Cells[i].Text;
            }
        }
        using (XLWorkbook wb = new XLWorkbook())
        {
            wb.Worksheets.Add(dt);

            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;filename=GridView.xlsx");
            using (MemoryStream MyMemoryStream = new MemoryStream())
            {
                wb.SaveAs(MyMemoryStream);
                MyMemoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
        GridView5.Visible = false;
    }
}