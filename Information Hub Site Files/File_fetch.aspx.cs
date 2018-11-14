using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using iTextSharp.text.pdf;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
public partial class File_fetch : System.Web.UI.Page
{
    SqlConnection conn=new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);   
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
       /* int i=0;
        String x = Server.MapPath("~/uploads/temp/abc.pdf");
        Response.Write(x);
       // PdfReader pdfReader = new PdfReader(x);
        var pdfReader = new PdfReader(x); //other filestream etc
        byte[] pageContent = pdfReader .GetPageContent(1); //not zero based
        byte[] utf8 = Encoding.Convert(Encoding.Default, Encoding.UTF8, pageContent);
        string textFromPage = Encoding.UTF8.GetString(utf8);
        List<string> list = new List<string>();
        list = ExtractPdfContent(textFromPage);
       // Response.Write(list[0]);
        while (i<list.Count())
        {
            test.Text += list[i]; i++;
        }
    }
    protected void Search_TextChanged(object sender, EventArgs e)
    {
       
    }
    const string PdfTableFormat = @"\(.*\)Tj";
    Regex PdfTableRegex = new Regex(PdfTableFormat, RegexOptions.Compiled);

    List<string> ExtractPdfContent(string rawPdfContent)
    {
        var matches = PdfTableRegex.Matches(rawPdfContent);

        var list = matches.Cast<Match>()
            .Select(m => m.Value
                .Substring(1) //remove leading (
                .Remove(m.Value.Length - 4) //remove trailing )Tj
                .Replace(@"\)", ")") //unencode parens
                .Replace(@"\(", "(")
                .Trim()
            )
            .ToList();
        return list;*/
    }
    protected void DeptDrop_SelectedIndexChanged(object sender, EventArgs e)
    {
        //DeptDrop.DataBind();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string f_ext="", ext = "";
        String f_name=GridView1.SelectedRow.Cells[1].Text;
        f_ext = "SELECT [f_ext] FROM [File] WHERE ([f_name] = '" + f_name + "') ";
        SqlCommand com = new SqlCommand(f_ext, conn);
        ext = (String)com.ExecuteScalar();
       // String f_id="Select FileID FROM File where f_name= '"+f_name+"' ";
        String get_type = "Select f_type FROM [Extensions] where f_ext= '" + ext + "' ";
        SqlCommand com2 = new SqlCommand(get_type, conn);
        String ftype = (String)com2.ExecuteScalar();
        Response.ContentType = get_type+"/"+ext;
        Response.AppendHeader("Content-Disposition", "attachment; filename="+f_name.Trim()+"."+ext);
        Response.TransmitFile(Server.MapPath("~/uploads/temp/"+f_name.Trim()+"."+ext));
        Response.End();
        conn.Close();
    }
    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        DropDownList2.DataBind();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

   /* protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
       // Page.SetFocus("TextBox1");
        //TextBox1.DataBind();
        int i = 0;
        //String[] search = TextBox1.Text.Split(' ');
        SqlCommand com0 = new SqlCommand("Select count(*) from [File]", conn);
        int cnt = (int)com0.ExecuteScalar();

        String[] Table = new String[cnt];
        String[] name = new String[cnt];

        GridView1.DataBind();
        SqlCommand com = new SqlCommand("SELECT * from [File]", conn);
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            Table[i] = reader["description"].ToString();
            name[i] = reader["f_name"].ToString();
            i++;
        }
        reader.Close();

        i = 0; int j;
        if (TextBox1.Text != "")
        {
            Label1.Text = "";
            do
            {
                for (j = 0; j < search.Length; j++)
                {
                    if (Table[i].Contains(search[j]) || name[i].Contains(search[j]))
                    {
                        Label1.Text += Table[i] + "   " + name[i] + "<br>";
                        //Response.Write(name[i] + "                     " + "<br>");
                       // GridView1.Rows[i].Cells[1].Text = Label1.Text;
                    }
                }
                j = 0;
                ++i;
            } while (i < cnt);
            if (Label1.Text == "")
                Label1.Text = "Not found";
        }
    */
    
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}