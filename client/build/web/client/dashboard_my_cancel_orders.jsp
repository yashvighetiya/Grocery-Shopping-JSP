<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:if test="${user_name ==  null}">
    <c:redirect url="index.jsp"/>
</c:if>
<jsp:include page="header.jsp"/>

<head>
    <style>
.button {
  background-color: red; 
  border: none;
  color: white;
  padding: 5px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 4px 2px;
  cursor: pointer;
}


.button3 {border-radius: 8px;}
</style>
</head>
<div class="wrapper">
<div class="gambo-Breadcrumb">
<div class="container">
<div class="row">
<div class="col-md-12">
<nav aria-label="breadcrumb">
<ol class="breadcrumb">
<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
<li class="breadcrumb-item active" aria-current="page">My Orders</li>
</ol>
</nav>
</div>
</div>
</div>
</div>
<div class="dashboard-group">
<div class="container">
<div class="row">
<div class="col-lg-12">
<div class="user-dt">
<div class="user-img">
<img src="images/avatar/img-5.jpg" alt="">
<div class="img-add">
</div>
</div>
     <sql:query dataSource="${db}" var="user_detail">
        SELECT * FROM `users` WHERE `user_name`='${user_name}'
    </sql:query>
<h4>${user_detail.rows[0].user_name}</h4>
<p>+91${user_detail.rows[0].user_contact}</p>
</div>
</div>
</div>
</div>
</div>
<div class="">
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-4">
<div class="left-side-tabs">
<div class="dashboard-left-links">
<a href="dashboard.jsp" class="user-item"><i class="uil uil-box"></i>My Orders</a>
<a href="dashboard_my_cancel_orders.jsp" class="user-item active"><i class="uil uil-box"></i>My Canceled Orders</a>
<a href="dashboard_my_wallet.jsp" class="user-item"><i class="uil uil-wallet"></i>My Wallet</a>
<a href="dashboard_my_wishlist.jsp" class="user-item"><i class="uil uil-heart"></i>Shopping Wishlist</a>
<a href="sign_in.jsp" class="user-item"><i class="uil uil-exit"></i>Logout</a>
</div>
</div>
</div>
<div class="col-lg-9 col-md-8">
<div class="dashboard-right">
<div class="row">
<div class="col-md-12">
<div class="main-title-tab">
<h4><i class="uil uil-box"></i>My Canceled Orders</h4>
</div>
</div>
<div class="col-lg-12 col-md-12">
     <sql:query dataSource="${db}" var="select_order">
        SELECT * FROM `cancel_order_master` WHERE `user_name`='${user_name}'
    </sql:query>
        <c:forEach items="${select_order.rows}" var="order_list">
         <sql:query dataSource="${db}" var="order_details">
        SELECT * FROM `cancel_order_detail` WHERE `cancel_order_id`='${order_list.cancel_order_id}'
    </sql:query>
    <c:set value="0" var="item_count"/>
       <c:set value="" var="item_list"/>
        <c:forEach items="${order_details.rows}" var="order_detail_list">
            <c:set value="${item_count + 1}" var="item_count"/>
            <c:choose>
            <c:when test="${item_list ==  ''}">
                <c:set value="${order_detail_list.product_name} ${order_detail_list.product_quantity}kg" var="item_list"/>
            </c:when>
                <c:otherwise>
                    <c:set value="${item_list} , ${order_detail_list.product_name} ${order_detail_list.product_quantity}kg" var="item_list"/>
                </c:otherwise>
            </c:choose>
 
    </c:forEach>
<div class="pdpt-bg">
<div class="order-body10">
<ul class="order-dtsll">
<li>
<div class="order-dt-img">
<img src="images/groceries.svg" alt="">
</div>
</li>
<li>
<div class="order-dt47">
<h4>Delivery Address - ${order_list.address}</h4>
<p>Delivery - By Gambo</p>
<p>Invoice No - ${order_list.invoice_no}</p>
<div class="order-title">${item_count} Items <span data-inverted="" data-tooltip="${item_list}" data-position="top center">?</span></div>
<c:set  value="${order_list.invoice_no}" var="userId"/>                       

   </div>
</li>
</ul>
<div class="total-dt">
<div class="total-checkout-group">
<div class="cart-total-dil">
<h4>Sub Total</h4>
<span>Rs ${order_list.grand_total - order_list.delivery_charge}</span>

</div>
<div class="cart-total-dil pt-3">
    <h4>Delivery Charges</h4>
<span>Rs ${order_list.delivery_charge}</span>

</div>
<div class="cart-total-dil pt-3">
<h4>Wallet Balance Used</h4>
<c:if test="${order_list.wallet_balance_used > 0}">
    <span>- Rs ${order_list.wallet_balance_used}</span>
</c:if>
<span>- Rs 0</span>
</div>
</div>
<div class="main-total-cart">
<h2>Grand Total</h2>
<span>Rs ${order_list.grand_total}</span>
</div>
</div>

<div class="call-bill">
<div class="delivery-man">
Delivery Boy - <a href="#"><i class="uil uil-phone"></i> Call Us</a>
</div>
</div>
</div>
</div>
</c:forEach>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<jsp:include page="footer.jsp"/>
