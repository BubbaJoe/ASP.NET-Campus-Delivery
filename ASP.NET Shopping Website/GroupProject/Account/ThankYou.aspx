<%@ Page Title="Thank You," Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ThankYou.aspx.cs" Inherits="ThankYou" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>
        <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
    </h2>

    <h3>Receipt:</h3>

        First Name: <asp:Label ID="lblFirstName" runat="server"></asp:Label>

        <br />
        Last Name: <asp:Label ID="lblLastName" runat="server"></asp:Label>

        <br />

        Date: <asp:Label ID="lblDate" runat="server"></asp:Label>

        <br />
        Total: $<asp:Label ID="lblCost" runat="server"></asp:Label>

        <br />
        Payment Method: <asp:Label ID="lblPayMeth" runat="server"></asp:Label>

        <br />
        Address: <asp:Label ID="lblAddress" runat="server"></asp:Label>


        <div>
        Items Ordered:<br />
            <asp:ListBox CssClass="form-control size-narrow" ID="lstCart" runat="server" Width="400px"></asp:ListBox>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="INSERT INTO Order (orderID, cost, address, paymentMethod, customerID, date) 
            VALUES [1, @price, @address, @payMeth, 8 ,@date]">
            <InsertParameters>
                <asp:formparameter name="price" formfield="lblCost" />
                <asp:formparameter name="address"  formfield="lblAddress" />
                <asp:formparameter name="payMeth"  formfield="lblPayMeth" />
                <asp:formparameter name="date"  formfield="lblDate" />
            </InsertParameters>
        </asp:SqlDataSource>

        <br />


</asp:Content>
