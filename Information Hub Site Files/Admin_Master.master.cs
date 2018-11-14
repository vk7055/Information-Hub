using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        //Session["id"] = null;
        Response.Redirect("Home.aspx");
    }
    protected void NavigationMenu_MenuItemClick(object sender, MenuEventArgs e)
    {

    }
}
