<%@ Page Title="Contact us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2> <hr />
    <h3>We'd love to hear from you!</h3>
    <address>
        East Carolina University<br />

    </address>
    <address>
        <asp:Image ID="banner" ImageUrl="/images/ecuSign.jpg" runat="server" />
    </address>
    <address>

        <br />
        <abbr title="Phone">P:252-328-6131</abbr>
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@campusDelivery.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@campusDelivery.com</a><br />
        <strong>Order Inquiries</strong><a href="mailto:Marketing@example.com">Inquiries@campusDelivery.com</a>
    </address>
</asp:Content>
