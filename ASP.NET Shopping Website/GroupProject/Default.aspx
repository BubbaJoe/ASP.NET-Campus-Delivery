<%@ Page Title="Campus Delivery" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron" style="background-image:url(/Images/ECUJoyner.jpg); background-repeat:no-repeat; height:600px">
        <h1 class="jumbo-text">Campus Delivery</h1>
        <p class="lead" style="color:white;">Restaurants including Chick-fil-a, Panda Express, Burger Studio, Subway, Chili&#39;s and more!</p>
        <p><a href="/Order" class="btn btn-primary btn-lg">Order now &raquo;</a></p>
    </div>
    <div class="row">
        <div class="col-md-4">
            <h2>How to Deliver?</h2>
            <p style="width:80%">
                You can use your Pirate buck and meals too also order food.</p>
            <p>
                <a class="btn btn-default" href="/Account/Login">Log in now &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Why Deliver?</h2>
            <p style="width:80%">
                Studying at the library with friends or Just too lazy to leave your dorm? Campus Delivery is perfect for you.
            </p>
            <p>
                <a class="btn btn-default" href="/order">Order now &raquo;</a>
            </p>
        </div>
        <div class="col-md-4" style="align-content:center; align-items:center; vertical-align:central">
            <h2>Where to Deliver?</h2>
            <p style="width:80%">
                Order from anywhere on-campus and deliver anywhere on campus.
            </p>
            <p>
                <a class="btn btn-default" href="/Location">Find a location &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
