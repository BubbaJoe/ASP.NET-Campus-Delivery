using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using GroupProject;
using System.Data.SqlClient;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = UserName.Text };
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            CreateUser(user.Id,user.UserName);
        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }

    public void CreateUser(string id, string un)
    {
        SqlConnection con =  new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        string query = "INSERT INTO [User] (userID,userName) VALUES ('"+id+"','"+un+"');";
        SqlCommand cmd = new SqlCommand(query,con);
        cmd.ExecuteNonQuery();
        //try { cmd.ExecuteNonQuery(); } catch (Exception e) { ErrorMessage.Text = e.Message; }
    }

}