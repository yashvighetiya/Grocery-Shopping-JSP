<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:if test="${user_name ==  null}">
    <c:redirect url="index.jsp"/>
</c:if>
<jsp:include page="header.jsp"/>


<div class="wrapper">
<div class="gambo-Breadcrumb">
<div class="container">
<div class="row">
<div class="col-md-12">
<nav aria-label="breadcrumb">
<ol class="breadcrumb">
<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
<li class="breadcrumb-item active" aria-current="page">User Dashboard</li>
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
<a href="dashboard_my_cancel_orders.jsp" class="user-item"><i class="uil uil-wallet"></i>My Canceled Orders</a>
<a href="dashboard_my_wallet.jsp" class="user-item active"><i class="uil uil-wallet"></i>My Wallet</a>
<a href="dashboard_my_wishlist.jsp" class="user-item"><i class="uil uil-heart"></i>Shopping Wishlist</a>
<a href="logout.jsp" class="user-item"><i class="uil uil-exit"></i>Logout</a>
</div>
</div>
</div>
<div class="col-lg-9 col-md-8">
<div class="dashboard-right">
<div class="row">
<div class="col-md-12">
<div class="main-title-tab">
<h4><i class="uil uil-wallet"></i>My Wallet</h4>
</div>
</div>
<sql:query dataSource="${db}" var="balance">
    SELECT * FROM `client_wallet` WHERE `user_name`='${user_name}'
</sql:query>
    <div class="col-lg-6 col-md-12">
<div class="pdpt-bg">
<div class="reward-body-dtt">
<div class="reward-img-icon">
<img src="images/money.svg" alt="">
</div>
<span class="rewrd-title">My Gambo Balance</span>
<h4 class="cashbk-price">Rs ${balance.rows[0].balance}</h4>
<hr>
  <sql:query var="wallet_details" dataSource="${db}">
 SELECT * FROM `gambo_wallet_details`
 </sql:query>
 <span class="rewrd-title">Add Balance of <b><font color="orange">Rs ${wallet_details.rows[0].get_Rs}</font></b> on Purchase of  <b><font color="orange">Rs ${wallet_details.rows[0].on_purchase_of_or_more_than}</font></b></span>
 <hr>
 <span class="rewrd-title">Percent: <b><font color="orange"> ${wallet_details.rows[0].per_can_be_used} %</font></b> of Balance can be used Per Order </span>
<hr>
 <span class="rewrd-title">Balance Can be Used On Purchase of Or More Than <b><font color="orange">Rs ${wallet_details.rows[0].used_on_purchase_of} </font></b> </span>

<span class="date-reward">No of Times Used : ${balance.rows[0].no_of_times_used}</span>
</div>
</div>
</div>




</div>
</div>
</div>
</div>
</div>
</div>
</div>


    <jsp:include page="footer.jsp"/>