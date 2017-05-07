<%@ Page Title="Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <h2>Order
    </h2><hr />
    <asp:UpdatePanel ID="UpdateCart" runat="server">
        <ContentTemplate>
            <div class="col-lg-7">
                <div style="width:500px">
                    <div style="float:left">
                        Restaurant:<asp:DropDownList  CssClass="dropdown-order form-control" ID="ddlRestaurants" runat="server" DataSourceID="SqlDataSource1" DataTextField="restName" DataValueField="restID" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                    <div style="float:right">
                        Food Category:
                        <asp:DropDownList CssClass="dropdown-order form-control" ID="ddlCategory" runat="server" DataSourceID="SqlDataSource2" DataTextField="displayName" DataValueField="categoryName" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                        SelectCommand="SELECT [restName], [restID] FROM [Restaurant]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                        SelectCommand="SELECT [categoryName], [displayName] FROM [ItemCategory]"></asp:SqlDataSource>
                </div>
                <asp:GridView ID="GridView1" runat="server" OnRowCommand="rowCommand" AutoGenerateColumns="False" Width="600px" AllowPaging="True" PageSize="5" PagerStyle-HorizontalAlign="Center" PagerStyle-VerticalAlign="Middle" HorizontalAlign="Left"
                    CssClass="table table-striped" DataSourceID="sqlDataSource3" AlternatingRowStyle-Wrap="False" GridLines="None">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                    <PagerStyle CssClass="pagination" HorizontalAlign="Center" VerticalAlign="Middle"></PagerStyle>
                    <Columns>
                        <asp:BoundField DataField="itemName" HeaderText="Name" SortExpression="itemName" ReadOnly="True"></asp:BoundField>
                        <asp:BoundField DataField="itemDescription" HeaderText="Description" SortExpression="itemDescription" />
                        <asp:BoundField DataField="itemPrice" HeaderText="Price" SortExpression="itemPrice" DataFormatString='{0:C2}' />
                        <asp:TemplateField HeaderText="Add to Cart">
                            <ItemTemplate>
                                <asp:Button ID="addToCartBtn" CssClass="btn btn-primary btn-sm" Text="Add to Cart"
                                    runat="server" CommandName="AddToCart" CommandArgument=' <%# Eval("itemID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField CommandName="AddToCart" />
                    </Columns>
                    <FooterStyle CssClass="pagination" HorizontalAlign="Center" VerticalAlign="Middle"></FooterStyle>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                    SelectCommand="SELECT [itemID], [itemName], [itemDescription], [itemPrice] FROM [Item] WHERE (([restID] = @restID) AND ([itemCategory] = @itemCategory))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlRestaurants" Name="restID"
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlCategory" Name="itemCategory" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                    SelectCommand="SELECT * FROM [Item] WHERE ([restID] = @ID) AND ([itemCategory] = @C) ORDER BY [itemName]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlRestaurants" Name="ID"
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlCategory" Name="C"
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div class="col-lg-5 cart">
                <h2>Shopping Cart</h2>
                <asp:Button ID="btnRemove" runat="server" Text="Remove Item" CssClass="btn btn-primary btn-sm" OnClick="btnRemove_Click" />
                <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" CssClass="btn btn-primary btn-sm" OnClick="btnEmpty_Click" />
                <br />

                <asp:ListBox CssClass="form-control list-box" ID="lstCart" runat="server" ></asp:ListBox>
                <br />
                <p id="shopbuttons">
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" Width="100px" CssClass="btn btn-primary btn-sm" OnClick="btnCheckOut_Click" />
                </p>
                <p id="message">
                    <asp:Label ID="lblTotal" runat="server" /><br />
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </p>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand" />
            <asp:AsyncPostBackTrigger ControlID="btnRemove" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnEmpty" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="ddlRestaurants" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlCategory" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
