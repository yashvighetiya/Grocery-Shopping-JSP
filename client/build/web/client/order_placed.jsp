<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<jsp:include page="header.jsp"/>


<div class="wrapper">
<div class="gambo-Breadcrumb">
<div class="container">
<div class="row">
<div class="col-md-12">
<nav aria-label="breadcrumb">
<ol class="breadcrumb">
<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
<li class="breadcrumb-item active" aria-current="page">Order Placed</li>
</ol>
</nav>
</div>
</div>
</div>
</div>
<div class="all-product-grid">
<div class="container">
<div class="row justify-content-center">
<div class="col-lg-6 col-md-8">
<div class="order-placed-dt">
<i class="uil uil-check-circle icon-circle"></i>
<h2>Order Successfully Placed</h2>
<p>Thank you for your order! will receive order Soon</p>
<div class="delivery-address-bg">
<div class="title585">
<div class="pln-icon"><i class="uil uil-telegram-alt"></i></div>
<h4>Your order will be sent to this address</h4>
</div>
    <sql:query dataSource="${db}" var="order_placed">
      SELECT * FROM `order_master` WHERE `invoice_no`='${invoice}'  
    </sql:query>
      <c:forEach items="${order_placed.rows}" var="order_master_details">
<ul class="address-placed-dt1">
<li><p><i class="uil uil-map-marker-alt"></i>Address :<span>${Address}</span></p></li>
<li><p><i class="uil uil-phone-alt"></i>Phone Number :<span>+91${order_master_details.phone_no}</span></p></li>
<li><p><i class="uil uil-envelope"></i>Email Address :<span></span>${order_master_details.user_email}</p></li>
<li><p><i class="uil uil-card-atm"></i>Payment Method :<span>${order_master_details.payment_method}</span></p></li>
</ul>
      
<div class="stay-invoice">
<div class="st-hm">Stay Home<i class="uil uil-smile"></i></div>
<a href="bill.jsp" class="invc-link hover-btn">Print Bill</a>
</div>
<div class="placed-bottom-dt">
The payment of <span>Rs ${order_master_details.grand_total}</span> you'll make when the deliver arrives with your order.
</div>
</c:forEach>
</div>
</div>
</div>
</div>
</div>
</div>
</div>


    <jsp:include page="footer.jsp"/>