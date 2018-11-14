using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
//using System.Windows.Forms;
public partial class FileUploader : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString); 
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
        conn.Open();
        StatusLabel.Text = "";
       // FileDescription.Attributes.Add("onFocus", "test()");
    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        Boolean Error = false;
        String ftemp = "", finsert = "",checkfile = "",cinsert="",fid=""; int fcount = 0, i=0, var = 0,fid2=0;
        //int checkoutNumber=0;
        //SortedBindingList<Tracker.Business.Equipment> eqList = Tracker.Business.EquipmentList.FetchAll();
        //int checkoutNumber = 0;
        /*foreach (GridViewRow row in this.Courses.Rows)
        {
            CheckBox chkMultiSelect_Out = (CheckBox)row.FindControl("chkMultiSelect_Out");
            if (chkMultiSelect_Out.Checked)
            {
                Response.Write(chkMultiSelect_Out.TabIndex);
                //checkoutNumber++;
                
                //Tracker.Business.Equipment equip = Tracker.Business.Equipment.GetByIdentification(Int32.Parse(row.ID.ToString()));
                //eqList.Add(equip);
            }

        }*/
        //Response.Write(checkoutNumber);
       
        if (FileUploadControl.HasFile)
        {
            try
            {
                //FileUploadControl.DataBind();
                    FileDescription.Visible = true;
                    String Unit = "";
                    double size = 0.0;
                    string filename = Path.GetFileName(FileUploadControl.FileName);
                    //FileUploadControl.FileContent;
                    string ext = Path.GetExtension(FileUploadControl.FileName);
                    ext = ext.Substring(1);
                    string check = "SELECT count(*) from Extensions where f_ext='" + ext + "'";
                    SqlCommand com1 = new SqlCommand(check, conn);
                    int val = (int)com1.ExecuteScalar();
                    if (val == 0)
                    {
                        Response.Write("File Type Not Supported.");
                        Error = true;
                    }
                    else
                    {
                        size = FileUploadControl.FileBytes.Length;
                        if ((size / (1024 * 1024)) > 10.0)
                        {
                            Response.Write(" File size should not exceed 10 MB.");
                            Error = true;
                        }

                        if (size < 1024)
                            Unit = "Bytes";
                        else if (size < 1024 * 1024)
                        {
                            Unit = "KBytes";
                            size /= 1024;
                            size = (Math.Truncate(size * 100)) / 100;
                        }
                        else
                        {
                            Unit = "MBytes";
                            size /= 1024 * 1024;
                            size = (Math.Truncate(size * 100)) / 100;
                        }
                    }

                    if (Error == false)
                    {
                        
                       String[] name_split=filename.Split('.');
                        ftemp=name_split[0];
                       // Response.Write(ftemp);
                        checkfile = "SELECT COUNT(*) FROM [File] WHERE (f_name = @fname)";
                        do
                        {
                            SqlCommand com2 = new SqlCommand(checkfile, conn);
                            com2.Parameters.AddWithValue("@fname", ftemp);
                            fcount = (int)com2.ExecuteScalar();
                            if (fcount == 0)
                            {
                                finsert = "Insert Into [File] (f_name,f_ext,description,u_date,studentid) values('" + ftemp + "','" + ext + "','" + FileDescription.Text + "','" + DateTime.Today.ToString("MM/dd/yyyy") + "','" + Session["id"].ToString() + "')";
                                
                                SqlCommand com3 = new SqlCommand(finsert, conn);
                                com3.ExecuteScalar();
                                fid = " Select FileID from [File] where f_name=@fname";
                                SqlCommand com4 = new SqlCommand(fid, conn);
                                com4.Parameters.AddWithValue("@fname", ftemp);
                                fid2=(int)com4.ExecuteScalar();
                                for (i = 0; i < courseList.Items.Count; i++)
                                {
                                    if (courseList.Items[i].Selected)
                                    {
                                        cinsert = "Insert Into [File_course] (FileID,courseid,facid) values('" + fid2 + "','" + courseList.Items[i].Text + "','"+"none" +"')";
                                        SqlCommand com5 = new SqlCommand(cinsert, conn);
                                        com5.ExecuteScalar();
                                    }
                                }
                                
                                var = -1;
                            }
                            else
                            {
                                ++var;
                                ftemp = name_split[0] + var.ToString();
                            }
                        } while (var != -1);
                        
                        FileUploadControl.SaveAs(Server.MapPath("~/uploads/temp/") + ftemp+"."+ext);
                        ftemp = ""; fid2 = 0;
                        StatusLabel.Text = "Upload status: File successfully uploaded!.         " + filename + "       " + size + "  " + Unit;
                        FileDescription.Text = "";
                        for (int items = 0; items < courseList.Items.Count; items++)
                        {
                            courseList.ClearSelection();
                        } 
                    }
                }
            
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
            
        }
        else
            StatusLabel.Text = " Choose File first.";
        conn.Close();
    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void FileDescription_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
    }
    private void FileDescription_Click(object sender, System.EventArgs e)
    {
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
      //  Courses.SelectedRow.Cells[0].Text = "cancel";
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}