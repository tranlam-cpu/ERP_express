<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavbarLayout.ascx.cs" Inherits="Erp_express.Component.NavbarLayout" %>

<link href="../Style/layout/navbarLayout.css" rel="stylesheet" type="text/css"/>
<script src="<%= ResolveUrl("~/Scripts/layout/header.js") %>" type="text/javascript"></script>







    <header class="w-100 sticky-top navbar">
        <nav class="d-flex justify-content-between align-items-center w-100 px-3">
            <div class="nav-title">Menu</div>
            <div class="nav-logo">_Lam</div>
            <div><button class="btn-nav btn-title"><div class="px-2">App</div></button></div>
        </nav>
    </header>
    <div class="navbar-container w-100 vh-100">      
        <img class="navbar-image" src="images/wallpaper.jpeg" alt="navbar image" />
        <p class="position-absolute logo">_Lam</p>
    </div> 
    



