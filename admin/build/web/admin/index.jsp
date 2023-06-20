<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<jsp:include page="admin_header.jsp"/>
 <%
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yy/MM/dd");
        String date1 = formatter.format(date);
      pageContext.setAttribute("date", date1);

       
    %>
<div id="layoutSidenav_content">
<main>
<div class="container-fluid">
<h2 class="mt-30 page-title">Dashboard</h2>
<ol class="breadcrumb mb-30">
<li class="breadcrumb-item active">Dashboard</li>
</ol>
<div class="row">
<div class="col-xl-3 col-md-6">
<div class="dashboard-report-card purple">
<div class="card-content">
     <sql:query dataSource="${db}" var="today_orders_query">
         SELECT * FROM `order_master` WHERE `date`='${date}';
    </sql:query>
<span class="card-title">Today Transactions</span>
<span class="card-count">${today_orders_query.rowCount}</span>
</div>
</div>
</div>
<sql:query dataSource="${db}" var="today_product_query">
        SELECT SUM(`product_quantity`) AS "total_product" FROM `order_detail` WHERE `date`='${date}';
    </sql:query>
<div class="col-xl-3 col-md-6">
<div class="dashboard-report-card red">
<div class="card-content">
<span class="card-title">Today Product Sold</span>
<c:choose>
    <c:when test="${today_product_query.rows[0].total_product > 0}">
        <span class="card-count">${today_product_query.rows[0].total_product}</span>
    </c:when>
    <c:otherwise>
       <span class="card-count">0</span>
 
    </c:otherwise>
</c:choose>

</div>

</div>
</div>
       
<div class="col-xl-3 col-md-6">
<div class="dashboard-report-card info">
<div class="card-content">
     <sql:query dataSource="${db}" var="today_cancel_orders_query">
        SELECT * FROM `cancel_order_master` WHERE `cancel_date`='${date}';
    </sql:query>
<span class="card-title">Today Cancel Orders</span>
<span class="card-count">${today_cancel_orders_query.rowCount}</span>
</div>

</div>
</div>
    
    <sql:query dataSource="${db}" var="today_income_query">
         SELECT SUM(`grand_total`) AS "today_total" FROM `order_master` WHERE `date`='${date}';
    </sql:query>
<div class="col-xl-3 col-md-6">
<div class="dashboard-report-card success">
<div class="card-content">
<span class="card-title">Today Income</span>
<c:choose>
    <c:when test="${today_income_query.rows[0].today_total > 0}">
        <span class="card-count">Rs ${today_income_query.rows[0].today_total}</span>
    </c:when>
    <c:otherwise>
       <span class="card-count">Rs 0</span>
 
    </c:otherwise>
</c:choose>

</div>
<div class="card-media">
<i class="fas fa-money-bill rpt_icon"></i>
</div>
</div>
</div>
<%----%>
<div class="col-xl-3 col-md-6">
<div class="dashboard-report-card success">
<div class="card-content">
<span class="card-title">Total Categories</span>
  <sql:query dataSource="${db}" var="categories">
       SELECT * FROM `categories`;
    </sql:query>

  
       <span class="card-count"> ${categories.rowCount}</span>
 
   
</div>
</div>
</div>
<%----%>
<%----%>
<div class="col-xl-3 col-md-6">
<div class="dashboard-report-card info">
<div class="card-content">
     <sql:query dataSource="${db}" var="products">
     SELECT * FROM `gambo_products` 
    </sql:query>
<span class="card-title">Total Products</span>
<span class="card-count">${products.rowCount}</span>
</div>
</div>
</div>
<%----%>
<%----%>
<div class="col-xl-3 col-md-6">
<div class="dashboard-report-card red">
<div class="card-content">
    <sql:query dataSource="${db}" var="no_stock_products">
     SELECT * FROM `gambo_products` WHERE `product_stock`='0'
    </sql:query>
<span class="card-title">No Stock Products</span>

        <span class="card-count">${no_stock_products.rowCount}</span>
   

</div>

</div>
</div>
<%----%>
<%----%>
<div class="col-xl-3 col-md-6">
<div class="dashboard-report-card purple">
<div class="card-content">
     <sql:query dataSource="${db}" var="customers">
       SELECT * FROM `users`
    </sql:query>
<span class="card-title"> Customers</span>
<span class="card-count">${customers.rowCount}</span>
</div>
</div>
</div>
<%----%>
</div>
</div>
</main>
    <jsp:include page="admin_footer.jsp"/>
</div>

<script src="js/jquery-3.4.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/chart/highcharts.js"></script>
<script src="vendor/chart/exporting.js"></script>
<script src="vendor/chart/export-data.js"></script>
<script src="vendor/chart/accessibility.js"></script>
<script src="js/scripts.js"></script>
<script src="js/chart.js"></script>
</body>
</html>
