<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description-gambolthemes" content="">
<meta name="author-gambolthemes" content="">
<title>Gambo Supermarket Admin</title>
<link href="css/styles.css" rel="stylesheet">
<link href="css/admin-style.css" rel="stylesheet">

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/froala_editor.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/froala_style.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/plugins/code_view.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/plugins/colors.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/plugins/emoticons.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/plugins/image_manager.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/plugins/image.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/plugins/line_breaker.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/plugins/table.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/plugins/char_counter.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/plugins/video.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/plugins/fullscreen.css">
<link rel="stylesheet" href="vendor/froala_editor_3.1.1/css/plugins/file.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">

<!--toast css file!-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-light bg-clr">
<a class="navbar-brand logo-brand" href="index.jsp">Gambo Supermarket</a>
<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
<a href="index.jsp" class="frnt-link"><i class="fas fa-external-link-alt"></i>Home</a>
<ul class="navbar-nav ml-auto mr-md-0">
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
<a class="dropdown-item admin-dropdown-item" href="edit_profile.jsp">Edit Profile</a>
<a class="dropdown-item admin-dropdown-item" href="change_password.jsp">Change Password</a>
<a class="dropdown-item admin-dropdown-item" href="admin_login.jsp">Logout</a>
</div>
</li>
</ul>
</nav>
<div id="layoutSidenav">
<div id="layoutSidenav_nav">
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
<div class="sb-sidenav-menu">
<div class="nav">
<a class="nav-link" href="index.jsp">
<div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
Dashboard
</a>
<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCategories" aria-expanded="false" aria-controls="collapseCategories">
<div class="sb-nav-link-icon"><i class="fas fa-list"></i></div>
Categories
<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
</a>
<div class="collapse" id="collapseCategories" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
<nav class="sb-sidenav-menu-nested nav">
<a class="nav-link sub_nav_link" href="category.jsp">All Categories</a>
<a class="nav-link sub_nav_link" href="add_category.jsp">Add Category</a>
</nav>
</div>
    
<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProducts" aria-expanded="false" aria-controls="collapseProducts">
<div class="sb-nav-link-icon"><i class="fas fa-box"></i></div>
Products
<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
</a>
<div class="collapse" id="collapseProducts" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
<nav class="sb-sidenav-menu-nested nav">
<a class="nav-link sub_nav_link" href="products.jsp">All Products</a>
<a class="nav-link sub_nav_link" href="add_product.jsp">Add Product</a>
</nav>
</div>
    <!---->
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDelivery" aria-expanded="false" aria-controls="collapseDelivery">
<div class="sb-nav-link-icon"><i class="fas fa-box"></i></div>
Delivery
<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
</a>
    <div class="collapse" id="collapseDelivery" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
<nav class="sb-sidenav-menu-nested nav">
<a class="nav-link sub_nav_link" href="delivery_details.jsp">Delivery Details</a>
<a class="nav-link sub_nav_link" href="delivery_city.jsp">Add City</a>
</nav>
    </div>
    <!---->
    <!---->
    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseorder" aria-expanded="false" aria-controls="collapseDelivery">
<div class="sb-nav-link-icon"><i class="fas fa-cart-arrow-down"></i></div>
Orders
<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
</a>
    <div class="collapse" id="collapseorder" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
<nav class="sb-sidenav-menu-nested nav">
<a class="nav-link sub_nav_link" href="orders.jsp">All Orders</a>
<a class="nav-link sub_nav_link" href="order_by_month.jsp">Orders By Month</a>
<a class="nav-link sub_nav_link" href="cancel_orders.jsp">All Canceled Orders</a>
</nav>
    </div>
    <!---->

<a class="nav-link" href="customers.jsp">
<div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
Customers
</a>
    <a class="nav-link" href="contact_us.jsp">
<div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
Contact us
</a>
<a class="nav-link" href="wallet_details.jsp">
<div class="sb-nav-link-icon"><i class="fas fa-gift"></i></div>
Wallet
</a>
<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSettings" aria-expanded="false" aria-controls="collapseSettings">
<div class="sb-nav-link-icon"><i class="fas fa-cog"></i></div>
Setting
<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
</a>
<div class="collapse" id="collapseSettings" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
<nav class="sb-sidenav-menu-nested nav">
<a class="nav-link sub_nav_link" href="payment_setting.jsp">Payment Settings</a>
</nav>
</div>
</div>
</div>
</nav>
</div>
    
    <c:if test="${toast_message != null}">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script>var message = '${toast_message}';
    toastr.info(message);
    </script>
    <c:remove var="toast_message" scope="session"/>
    </c:if>
    
   