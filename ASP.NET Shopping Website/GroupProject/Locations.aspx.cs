using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Locations : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void ListView_Command(object sender, CommandEventArgs e)
    {
        if(e.CommandName == "MoreInformation")
        {
            ListView1.SelectedIndex = Int16.Parse(e.CommandArgument.ToString())-1; //ListView1.Items[Int16.Parse(e.CommandArgument.ToString())];
        }
        else if(e.CommandName == "LessInformation")
        {
            ListView1.SelectedIndex = - 1;
        }
        else if(e.CommandName == "OrderNow")
        {
            
            Session.Add("SelectedRest", e.CommandArgument.ToString());
            Response.Redirect("/Order");
        }
    }
}