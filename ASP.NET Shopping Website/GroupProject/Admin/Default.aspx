<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server"> <style>.grid{float:left}</style>
    <h1 class="text-center">Admin Data Viewer</h1>

    <h2>Users</h2>
    <asp:GridView ID="GridView1" CssClass="grid table table-hover table-striped" DataSourceID="SqlDataSource1" runat="server" AutoGenerateColumns="False" DataKeyNames="userID" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="userID" HeaderText="userID" ReadOnly="True" SortExpression="userID" />
            <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
        </Columns>
    </asp:GridView>
    <h2>Items</h2>
    <asp:GridView ID="GridView2" CssClass="grid table table-hover table-striped" DataSourceID="SqlDataSource2" runat="server" AutoGenerateColumns="False" DataKeyNames="itemID" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="itemID" HeaderText="itemID" ReadOnly="True" SortExpression="itemID" />
            <asp:BoundField DataField="itemCategory" HeaderText="itemCategory" SortExpression="itemCategory" />
            <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
            <asp:BoundField DataField="itemDescription" HeaderText="itemDescription" SortExpression="itemDescription" />
            <asp:BoundField DataField="itemPrice" HeaderText="itemPrice" SortExpression="itemPrice" />
        </Columns>
        <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:GridView>
    <h2>Orders</h2>
    <asp:GridView ID="GridView3" CssClass="grid table table-hover table-striped" DataSourceID="SqlDataSource3" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="orderID" HeaderText="orderID" ReadOnly="True" SortExpression="orderID" />
            <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="paymentInfo" HeaderText="paymentInfo" SortExpression="paymentInfo" />
            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
            <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [userID], [userName] FROM [User]"></asp:SqlDataSource>

    &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [itemID], [itemCategory], [itemName], [itemDescription], [itemPrice] FROM [Item]"></asp:SqlDataSource>

    &nbsp;<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [orderID], [total], [address], [paymentInfo], [date], [userID] FROM [Order]"></asp:SqlDataSource>
</asp:Content>

