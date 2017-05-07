using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using ShoppingCart;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Order : Page
{
    private CartItemList cart;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblTotal.Text = "Total = $0.00";
            if (Session["SelectedRest"] != null)
            {
                ddlRestaurants.SelectedValue = Session["SelectedRest"].ToString();
                Session["SelectedRest"] = null;
            }
            lblMessage.Text = "";
            resetCartSize();
            cart = CartItemList.GetCart();
            this.DisplayCart();
        }
    }

    protected void AddToCart(int itemID)
    {
        Item selectedProduct = this.GetSelectedProduct(itemID);
        CartItemList cart = CartItemList.GetCart();
        CartItem cartItem = cart[selectedProduct.ItemID];
        if (cartItem == null)
        {
            cart.AddItem(selectedProduct, 1);
            Console.WriteLine(selectedProduct.ItemName);
        }
        else
        {
            cartItem.AddQuantity(1);
        }
        resetCartSize();
        Session["sessionCart"] = cart;
    }

    protected void rowCommand(object sender,
        GridViewCommandEventArgs e)
    {

        if (e.CommandName == "AddToCart")
        {

            int currentRowIndex = int.Parse((string)e.CommandArgument);
            AddToCart(currentRowIndex);
            DisplayCart();
        }
    }

    private Item GetSelectedProduct(int itemID)
    {
        DataView productsTable = (DataView)
        SqlDataSource3.Select(DataSourceSelectArguments.Empty);
        productsTable.RowFilter = " itemID = '" + itemID + "'";
        DataRowView row = (DataRowView)productsTable[0];
        Item p = new Item();
        p.ItemID = row["itemID"].ToString();
        p.ItemName = row["itemName"].ToString();
        p.ItemDescription = row["itemDescription"].ToString();
        p.ItemPrice = (decimal)row["itemPrice"];
        return p;
    }

    private void DisplayCart()
    {
        cart = CartItemList.GetCart();
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

    private void resetCartSize()
    {
        int count = lstCart.Items.Count;
        if (count < 5)
        {
            lstCart.Height = Unit.Pixel(100);
        }
        else
        {
            lstCart.Height = Unit.Pixel(100 + (16 * (count - 4)));
        }
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        cart = CartItemList.GetCart();
        if (cart.Count > 0)
        {
            List<int> list = lstCart.GetSelectedIndices().ToList<int>();
            // Redundant but the only method that worked for us for some reason
            if (list.Count > 0)
            {
                for(int i = 0; i < lstCart.Items.Count ; i++) {
                    if (lstCart.Items[i].Selected == true)
                    {
                        cart.RemoveAt(i);
                        lstCart.Items.Remove(lstCart.Items[i]);
                        break;
                    }
                }
            }
            else
            {
                lblMessage.Text = "Please select the item you want to remove.";
            }

        }
        Session["sessionCart"] = cart;
        this.DisplayCart();
        resetCartSize();
    }

    protected void btnEmpty_Click(object sender, EventArgs e)
    {
        cart = CartItemList.GetCart();
        if (cart.Count > 0)
        {
            cart.Clear();
            lstCart.Items.Clear();
        }
        Session["sessionCart"] = cart;
        this.DisplayCart();
        resetCartSize();

    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        Session["sessionCart"] = cart;
        Response.Redirect("/Account/Checkout");
        //Response.Redirect(ConfigurationManager.AppSettings["https"]  + "Account/Checkout");
    }

    public CartItemList GetCart()
    {
        return CartItemList.GetCart();
    }
}