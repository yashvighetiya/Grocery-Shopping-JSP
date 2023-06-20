<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<jsp:include page="admin_header.jsp"/>
<div id="layoutSidenav_content">
<main>
<div class="container-fluid">
<h2 class="mt-30 page-title">Payment Setting</h2>
<ol class="breadcrumb mb-30">
<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
<li class="breadcrumb-item active">Payment Setting</li>
</ol>
<h4> Active Payments</h4>
<div class="row">
    
<div class="col-lg-4 col-md-6">
<div class="left-side-tabs">
<div class="dashboard-left-links">
    <sql:query dataSource="${db}" var="payment">
        SELECT * FROM `payment_table`
    </sql:query>
     
    <c:forEach items="${payment.rows}" var="payment_method">
        <c:if test="${payment_method.available == 1}">
             <a href="" class="user-item"><i class="fab fa-paypal"></i>${payment_method.payment_type} &nbsp;&nbsp;&nbsp;&nbsp;</a>

        </c:if>
    </c:forEach>
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
