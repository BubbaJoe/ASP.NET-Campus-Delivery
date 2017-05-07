<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

    <h2>Cart</h2>
        <p id="carthead">Your shopping cart:</p>
            <asp:Button ID="btnRemove" runat="server" Text="Remove Item" OnClick="btnRemove_Click" /><br />
        <asp:ListBox CssClass="size-narrow" ID="lstCart" runat="server" Width="200px"></asp:ListBox>
        <br />
            <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" OnClick="btnEmpty_Click" BackColor="Red" />
        <p id="shopbuttons">
            <asp:Button ID="btnContinue" runat="server"
                PostBackUrl="~/Order.aspx" Text="Continue Shopping" Width="157px" />
            <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" Width="100px" BackColor="Lime" />
        </p>
        <p id="message">
            <asp:Label ID="lblMessage" runat="server" EnableViewState="False"></asp:Label>
        </p>
    <p>
        Subtotal: $
        <asp:Label ID="lblSubtotal" runat="server" EnableViewState="False"></asp:Label>
    </p>
</asp:Content>