<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<c:if test="${param.invoice_no == null}">
    <c:set var="toast_message" scope="session" value="Select Order to View"/>
    <c:redirect url="orders.jsp"/>
</c:if>
<jsp:include page="admin_header.jsp"/>
 <sql:query dataSource="${db}" var="order_detail">
        SELECT * FROM `order_detail` WHERE `invoice_no`='${param.invoice_no}' 
    </sql:query>
<div id="layoutSidenav_content">
<main>
<div class="container-fluid">
<h2 class="mt-30 page-title">Orders</h2>
<ol class="breadcrumb mb-30">
<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
<li class="breadcrumb-item"><a href="orders.jsp">Orders</a></li>
<li class="breadcrumb-item active">Order View</li>
</ol>

   
<div class="row">
<div class="col-xl-12 col-md-12">
<div class="card card-static-2 mb-30">
<div class="card-title-2">
<h2 class="title1458">Invoice : ${param.invoice_no}</h2>

</div>
<div class="invoice-content">
<div class="row">

<div class="col-lg-12">
<div class="card card-static-2 mb-30 mt-30">
<div class="card-title-2">
<h4>Recent Orders</h4>
</div>
<div class="card-body-table">
<div class="table-responsive">
<table class="table ucp-table table-hover">
<thead>
<tr>
    <th style="width:130px"><b>Order Id</b></th>
<th><b>Product Name</b></th>

<th style="width:150px" class="text-center"><b>Product Price</b></th>
<th style="width:150px" class="text-center"><b>Product Discount</b></th>
<th style="width:150px" class="text-center"><b>Product Quantity</b></th>
<th style="width:100px" class="text-center"><b>Total Price</b></th>
</tr>
</thead>
<tbody>
     <c:forEach items="${order_detail.rows}" var="order_detail_list">
<tr>
<td>${order_detail_list.order_id}</td>
<td>
${order_detail_list.product_name}
</td>
<td class="text-center">Rs ${order_detail_list.product_price}</td>
<td class="text-center">${order_detail_list.discount_per_product} %</td>
<td class="text-center">${order_detail_list.product_quantity} kg</td>
<td class="text-center">Rs ${order_detail_list.total}</td>
</tr>
     </c:forEach>
</tbody>
</table>
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
</main>
    <jsp:include page="admin_footer.jsp"/>
</div>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
