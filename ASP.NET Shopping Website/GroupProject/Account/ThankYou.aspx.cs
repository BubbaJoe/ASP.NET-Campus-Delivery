using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingCart;


public partial class ThankYou : Page
{
    private CartItemList cart;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["firstName"] != null)
        {
            string fName = Session["firstName"].ToString();
            lblFirstName.Text = Session["firstName"].ToString();
            if (Session["lastName"] != null)
            {

                string lName = Session["lastName"].ToString();
                lblLastName.Text = Session["lastName"].ToString();
                lblName.Text = fName + " " + lName;
            }
            Session["address"].ToString();
            Session["cost"].ToString();
            Session["date"].ToString();
            Session["payMeth"].ToString();
        }
        if(Session["address"] != null)
        {
            lblAddress.Text = Session["address"].ToString();
        }
        if (Session["cost"] != null)
        {
            lblCost.Text = Session["cost"].ToString();
        }
        if (Session["date"] != null)
        {
            lblDate.Text = Session["date"].ToString();
        }
        if (Session["payMeth"] != null)
        {
            lblPayMeth.Text = Session["payMeth"].ToString();
        }
        if (Session["sessionCart"] != null)
        {
            cart = (CartItemList)Session["sessionCart"];
            DisplayCart();
        }
    }

    private void DisplayCart()
    {
        if (cart != null)
        {
            lstCart.Items.Clear();
            CartItem item;
            for (int i = 0; i < cart.Count; i++)
            {
                item = cart[i];
                lstCart.Items.Add(item.Display());
            }

            if (lstCart.Items.Count <= 0) lstCart.Items.Add("Empty Cart");
        }
    }

}