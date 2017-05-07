<%@ Page Title="About us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2> <hr />
    <h3>What do we do?</h3>
    <p>We are Campus Delivery.  Our services include buying food from popular restaurants such as Chick-Fil-A, Panda Express, and Starbucks, and then delivering
        them to your location near East Carolina University.
    </p>
    <h3>Policies:</h3>
    <p>Cost of service is equal to the cost of the food being purchased, tax, and a $2 delivery fee.</p>
    <p>No returns/refunds are offered on meals once delivered.</p>

    <asp:Image ID="imgECU" imageURL="/images/ECUSign2.jpg" runat="server" />


</asp:Content>
