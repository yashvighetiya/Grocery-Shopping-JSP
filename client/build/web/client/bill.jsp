<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:if test="${user_name ==  null}">
    <c:redirect url="index.jsp"/>
</c:if>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, shrink-to-fit=9">
<meta name="description" content="Gambolthemes">
<meta name="author" content="Gambolthemes">
<title>Gambo - Bill Invoice</title>

<link rel="icon" type="image/png" href="images/fav.png">

<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/night-mode.css" rel="stylesheet">
<link href="css/step-wizard.css" rel="stylesheet">

<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="vendor/semantic/semantic.min.css">
</head>
<body>

<header class="header clearfix">
<div class="container">
<div class="row">
<div class="col-lg-12">
<div class="top-header-group">
<div class="top-header">
<div class="res_main_logo">
<a href="index.jsp"><img src="images/dark-logo-1.svg" alt=""></a>
</div>
<div class="main_logo ml-0" id="logo">
<a href="index.jsp"><img src="images/logo.svg" alt=""></a>
<a href="index.jsp"><img class="logo-inverse" src="images/dark-logo.svg" alt=""></a>
</div>
<div class="header_right">
<a href="#" class="report-btn hover-btn">Report on Issue</a>
</div>
</div>
</div>
</div>
</div>
</div>
</header>


<div class="bill-dt-bg">
<div class="container">
<div class="row justify-content-center">
<div class="col-lg-8">
    <sql:query dataSource="${db}" var="order_master">
       SELECT * FROM `order_master` WHERE `invoice_no`='${invoice}'
    </sql:query>
       <c:forEach items="${order_master.rows}" var="order_master">
<div class="bill-detail">
    <div class="bill-dt-step">
        <div class="bill-title">
            <h4>User Name </h4>
        </div>
        <div class="bill-descp">
           ${order_master.user_name}
        </div>
    </div>
<div class="bill-dt-step">
<div class="bill-title">
<h4>Items</h4>
</div>
<div class="bill-descp">
    <sql:query dataSource="${db}" var="bill">
        SELECT * FROM `order_detail` WHERE `invoice_no`='${invoice}'
    </sql:query>
    <c:set value="0" var="items"/>
        <c:forEach items="${bill.rows}" var="order_list">
            <c:set value="${items + 1}" var="items"/>
            <span class="item-prdct">${order_list.product_name} (${order_list.product_quantity} Items)</span>
        </c:forEach>

</div>

</div>
<div class="bill-dt-step">
<div class="bill-title">
<h4>Delivery Address</h4>
</div>
<div class="bill-descp">
<div class="itm-ttl">Home / OFFICE</div>
<p class="bill-address">${order_master.address}</p>
</div>
</div>
<div class="bill-dt-step">
<div class="bill-title">
<h4>Payment</h4>
</div>
<div class="bill-descp">

<div class="main-total-cart pl-0 pr-0 pb-0 border-bottom-0">
<h2>Total</h2>
<span>Rs ${order_master.grand_total}</span>
</div>
</div>
</div>
<div class="bill-dt-step">
<div class="bill-title">
<h4>Order Details</h4>
</div>
<div class="bill-descp">

<p class="bill-dt-sl">Invoice ID - <span class="descp-bll-dt">${order_master.invoice_no}</span></p>
<p class="bill-dt-sl">Items - <span class="descp-bll-dt">${items}</span></p>
<p class="bill-dt-sl">Date And Time - <span class="descp-bll-dt">${order_master.date}  , ${order_master.time}</span></p>
</div>
</div>
<div class="bill-dt-step">
<div class="bill-title">
<h4>Payment Option</h4>
</div>
<div class="bill-descp">
<p class="bill-dt-sl"><span class="dlr-ttl25 mr-1"><i class="uil uil-check-circle"></i></span>${order_master.payment_method}</p>
</div>
</div>
<div class="bill-dt-step">
<div class="bill-bottom">
<div class="thnk-ordr">Thanks for Ordering</div>
<a class="print-btn hover-btn" href="javascript:window.print();">Print</a>
</div>
</div>
</div>
       </c:forEach>
</div>
</div>
</div>
</div>


<script src="js/jquery-3.3.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/OwlCarousel/owl.carousel.js"></script>
<script src="vendor/semantic/semantic.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/custom.js"></script>
<script src="js/product.thumbnail.slider.js"></script>
<script src="js/offset_overlay.js"></script>
<script src="js/night-mode.js"></script>
</body>
</html>