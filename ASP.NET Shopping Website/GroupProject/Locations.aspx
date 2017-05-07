<%@ Page Title="Locations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Locations.aspx.cs" Inherits="Locations" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
    <ContentTemplate>
    <asp:SqlDataSource ID="data" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="SELECT [restName], [restID], [imageUrl], [restDescription] FROM [Restaurant]"></asp:SqlDataSource>
    <h1 class="location-h1"><%: Title %></h1> <hr />
    <div class="container body-content">
        <asp:ListView class="container" ID="ListView1" runat="server" DataSourceID="data" >
          <ItemTemplate>
        <div class="locations-list">
                <asp:Image CssClass="small-image" runat="server" ImageUrl='<%# Eval("imageUrl") %>' Height="60px" />
            <h2><%# Eval("restName") %> &nbsp&nbsp&nbsp
            <asp:LinkButton CssClass="btn-link" Text="more info" OnCommand="ListView_Command" runat="server" CommandName="MoreInformation" CommandArgument='<%# Eval("restID") %>' />
            <asp:Button CommandArgument='<%# Eval("restID") %>' OnCommand="ListView_Command" CommandName="OrderNow" Text="Order Now" CssClass="btn orderlist btn-primary btn-lg" runat="server" />
            </h2>
        </div>
        </ItemTemplate>
         <SelectedItemTemplate>
           <div class="locations-list active-list description">
            <div>
                <h2><%# Eval("restName") %> &nbsp&nbsp&nbsp
                <asp:LinkButton CssClass="btn-link" Text="less info" OnCommand="ListView_Command" runat="server" CommandName="LessInformation" CommandArgument='<%# Eval("restID") %>' />
                <asp:Button CommandArgument='<%# Eval("restID") %>' OnCommand="ListView_Command" CommandName="OrderNow" Text="Order Now" CssClass="btn orderlist btn-primary btn-lg" runat="server" />
                </h2>

                <asp:Image runat="server" CssClass="image-link" ImageUrl='<%# Eval("imageUrl") %>' Height="100px" />

                <p class="description"><%# Eval("restDescription") %></p>
            </div>
                
           </div>
         </SelectedItemTemplate>
         </asp:ListView>
    </div>
        </ContentTemplate>
      <Triggers>
          <asp:AsyncPostBackTrigger ControlID="ListView1"  EventName="ItemCommand" />
      </Triggers>
    </asp:UpdatePanel>
</asp:Content>
