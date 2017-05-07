using System;
using System.Collections.Generic;
using System.Web;

namespace ShoppingCart {

    public class CartItemList
    {
        private List<CartItem> cartItems;

        public CartItemList()
        {
            cartItems = new List<CartItem>();
        }

        public int Count {
            get { return cartItems.Count; }
        }

        public CartItem this[int index]
        {
            get { return cartItems[index]; }
            set { cartItems[index] = value; }
        }

        public CartItem this[string id]
        {
            get {
                foreach (CartItem c in cartItems)
                    if (c.Item.ItemID == id) return c;
                return null;
            }
        }

        public decimal GetCartTotal()
        {
            decimal total = 0;
            foreach (CartItem ci in cartItems)
            {
                total += (decimal)ci.Quantity * ci.Item.ItemPrice;
            }

            return total;
        }

        public static CartItemList GetCart()
        {
            CartItemList cart = (CartItemList) HttpContext.Current.Session["Cart"];
            if (cart == null)
                HttpContext.Current.Session["Cart"] = new CartItemList();
            return (CartItemList) HttpContext.Current.Session["Cart"];
        }

        public void AddItem(Item item, int quantity)
        {
            CartItem c = new CartItem(item, quantity);
            cartItems.Add(c);
        }

        public Int32 GetDisplayItemID(string search)
        {
            foreach(CartItem i in cartItems)
            {
                string displayString =
                i.Item.ItemName + " (" + i.Quantity.ToString()
                + " at " + i.Item.ItemPrice.ToString("c") + " each)";
                if (displayString == search) return Int32.Parse(i.Item.ItemID);
            }
            return -1;
        }

        public Int32 GetDisplayItemQuantity(string search)
        {
            foreach (CartItem i in cartItems)
            {
                string displayString =
                i.Item.ItemName + " (" + i.Quantity.ToString()
                + " at " + i.Item.ItemPrice.ToString("c") + " each)";
                if (displayString == search) return i.Quantity;
            }
            return -1;
        }

        public void RemoveAt(int index)
        {
            cartItems.RemoveAt(index);
        }

        public void Clear()
        {
            cartItems.Clear();
        }
    }


    public class Item
    {
        public string ItemID { get; set; }
        public string ItemName { get; set; }
        public string ItemDescription { get; set; }
        public decimal ItemPrice { get; set; }
        public string ImageFile { get; set; }
    }

    public class CartItem
    {
        public CartItem() { }

        public CartItem(Item item, int quantity)
        {
            this.Item = item;
            this.Quantity = quantity;
        }

        public Item Item { get; set; }
        public int Quantity { get; set; }

        public void AddQuantity(int quantity)
        {
            this.Quantity += quantity;
        }

        public string Display()
        {
            string displayString =
                Item.ItemName + " (" + Quantity.ToString()
                + " at " + Item.ItemPrice.ToString("c") + " each)";

            return displayString;
        }

    }
}