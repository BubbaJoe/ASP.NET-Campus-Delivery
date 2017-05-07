using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingCart;

public partial class Checkout : Page
{

    private CartItemList cart;
    protected void Page_Load(object sender, EventArgs e)
    {

        cart = (CartItemList) Session["sessionCart"];
        if (cart != null)
        {
            DisplayCart();
            lblDeliveryFee.Text = "2";
            double tax = 0.07;
            double fullAmount = 1.07;
            lblTax.Text = System.Math.Round(((cart.GetCartTotal() + 2) * (decimal)tax), 2).ToString();
            lblTotal.Text = System.Math.Round(((cart.GetCartTotal() + 2) * (decimal)fullAmount), 2).ToString();
        }
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

            Server.Transfer("~/ThankYou.aspx");
            Response.Redirect("~/ThankYou.aspx");
        }
    }

    protected void btnContShopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Order");
        
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