using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingCart;
using GroupProject;
using System.Data.SqlClient;
using System.Configuration;

public partial class Checkout : Page
{

    private CartItemList cart;
    protected void Page_Load(object sender, EventArgs e)
    {
        DisplayCart();
        lblDeliveryFee.Text = "2";
        double tax = 0.07;
        double fullAmount = 1.07;
        lblTax.Text = System.Math.Round(((cart.GetCartTotal() + 2) * (decimal)tax), 2).ToString();
        lblTotal.Text = System.Math.Round(((cart.GetCartTotal() + 2) * (decimal)fullAmount), 2).ToString();
        
        //else Response.Redirect("/Order");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Session["sessionCart"] = cart;
            Session["firstName"] = txtFirstName.Text;
            Session["lastName"] = TxtLastName.Text;
            Session["address"] = txtAddress.Text;
            Session["cost"] = lblTotal.Text;
            Session["date"] = System.DateTime.Now;
            Session["payMeth"] = ddlCardType.SelectedValue;

            bool Error = false;

            // Get the user id
            Guid userID;
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            con.Open();
            string query = "SELECT userID FROM [User] WHERE userName = '"+ Context.User.Identity.Name+"';";
            SqlCommand cmd = new SqlCommand(query, con);
            userID = (Guid)cmd.ExecuteScalar();
            //try { userID = (Guid)cmd.ExecuteScalar(); } catch (Exception ee) { ErrorMessage.Text = ee.Message; Error = true; goto SKIPQUERY; }

            // insert order
            Guid OrderID = Guid.NewGuid();
            string paymentInfo = txtFirstNameB.Text + ":" + TxtLastNameB.Text + ":" + txtAddressB.Text + ":" + txtZIPB.Text + ":" + ddlCardType.SelectedValue + txtCCN.Text + ":" + txtCCV.Text;
            query = "INSERT INTO [Order] (orderID,total,address,paymentInfo,userID,date) VALUES ('"+OrderID+"','"+lblTotal.Text+"','"+txtAddress.Text+"','"+paymentInfo+"','"+ userID +"','"+ DateTime.Now +"');";
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            //try { cmd.ExecuteNonQuery(); } catch (Exception ee) { ErrorMessage.Text = ee.Message; Error = true; goto SKIPQUERY; }

            // Submit each item in OrderItems
            foreach(ListItem i in lstCart.Items)
            {
                query = "INSERT INTO [orderItems] (orderItemID,orderID,itemID,itemQuantity) VALUES ('" + Guid.NewGuid() + "','" + OrderID + "','"+ cart.GetDisplayItemID(i.Text) +"','"+ cart.GetDisplayItemQuantity(i.Text) + "');";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                //try { cmd.ExecuteNonQuery(); } catch (Exception ee) { ErrorMessage.Text = ee.Message; Error = true; goto SKIPQUERY; }
            }
            
            //SKIPQUERY:
            //if (Error != true)
                Server.Transfer("~/Account/ThankYou.aspx");
        }
    }

    public void CreateUser(string id, string un)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        con.Open();
        string query = "INSERT INTO [User] (userID,userName) VALUES ('" + id + "','" + un + "');";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
    }

    protected void btnContShopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Order");
        //Response.Redirect(ConfigurationManager.AppSettings["http"] + "/Order");
    }

    private void DisplayCart()
    {
        cart = CartItemList.GetCart();
        if (cart != null)
        {
            lstCart.Items.Clear();
            CartItem item;
            for (int i = 0; i < cart.Count; i++)
            {
                item = cart[i];
                lstCart.Items.Add(item.Display());
                lblTotal.Text = "Total = " + String.Format("{0:C2}", cart.GetCartTotal());
            }

            if (lstCart.Items.Count <= 0) lstCart.Items.Add("Empty Cart");
        }
    }

    
    protected void txtFirstName_TextChanged(object sender, EventArgs e)
    {
        Session["firstName"] = txtFirstName.Text;
    }
}