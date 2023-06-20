<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<jsp:include page="admin_header.jsp"/>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<div id="layoutSidenav_content">
<main>
    <sql:query dataSource="${db}" var="customer_detail">
        SELECT * FROM `users` WHERE `user_id`='${param.user_id}'
    </sql:query>
   
    <c:forEach items="${customer_detail.rows}" var="detail">
<div class="container-fluid">
<h2 class="mt-30 page-title">Customers</h2>
<ol class="breadcrumb mb-30">
<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
<li class="breadcrumb-item"><a href="customers.jsp">Customers</a></li>
<li class="breadcrumb-item active">Customer View</li>
</ol>
<div class="row">
<div class="col-lg-5 col-md-6">
<div class="card card-static-2 mb-30">
<div class="card-body-table">
<div class="shopowner-content-left text-center pd-20">
<div class="customer_img">
<img src="images/avatar/img-1.jpg" alt="">
</div>
<div class="shopowner-dt-left mt-4">
<h4>${detail.user_name}</h4>
<span>Customer</span>
</div>
<ul class="product-dt-purchases">
<li>
<div class="product-status">
Total Orders <span class="badge-item-2 badge-status">${detail.user_orders}</span>
</div>
</li>
<li>
<div class="product-status">
    <sql:query dataSource="${db}" var="customer_balance">
    SELECT * FROM `client_wallet` WHERE `user_name`='${detail.user_name}'
</sql:query>
Balance Used <span class="badge-item-2 badge-status">${customer_balance.rows[0].no_of_times_used} Times</span>
</div>
</li>
</ul>
<div class="shopowner-dts">
<div class="shopowner-dt-list">
<span class="left-dt">Name</span>
<span class="right-dt">${detail.user_name}</span>
</div>
<div class="shopowner-dt-list">
<span class="left-dt">Email</span>
<span class="right-dt">${detail.user_email}</span>
</div>
<div class="shopowner-dt-list">
<span class="left-dt">Phone</span>
<span class="right-dt">+91${detail.user_contact}</span>
</div>
<div class="shopowner-dt-list">
<span class="left-dt">Gambo Balance</span>

<span class="right-dt">Rs ${customer_balance.rows[0].balance}</span>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
 <div class="col-lg-12 col-md-12">
                    <div class="card card-static-2 mt-30 mb-30">
                        <div class="card-title-2">
                            <h4>All Orders</h4>
                        </div>
                        <div class="card-body-table">
                            <div class="table-responsive">
                                <table class="table ucp-table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width:60px"><input type="checkbox" class="check-all"></th>
                                            <th style="width:60px">Invoice</th>
                                            <th style="width:100px">Date</th>
                                            <th>Time</th>
                                            <th>Address</th>
                                            <th>Total</th>
                                             <th>Payment Method</th>
                                          
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <sql:query var="product_list" dataSource="${db}">
                                                       SELECT * FROM `order_master` WHERE `user_id`='${param.user_id}'
                                                    </sql:query>
                                                  
                                            
                                        <c:forEach items="${product_list.rows}" var="pro">
                                            <tr>
                                                <td><input type="checkbox" class="check-item" name="ids[]" value="1"></td>
                                                <td>${pro.invoice_no}</td>
                                                <td>${pro.date} </td>
                                                <td>${pro.time}</td>
                                                <td>${pro.address}</td>
                                                <td>Rs ${pro.grand_total} </td>
                                                <td>${pro.payment_method}</td>
                                              

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

<div class="col-lg-12 col-md-12">
                    <div class="card card-static-2 mt-30 mb-30">
                        <div class="card-title-2">
                            <h4>All Canceled Orders</h4>
                        </div>
                        <div class="card-body-table">
                            <div class="table-responsive">
                                <table class="table ucp-table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width:60px"><input type="checkbox" class="check-all"></th>
                                            <th style="width:60px">Invoice</th>
                                            <th style="width:100px">Date</th>
                                            <th>Time</th>
                                            <th>Address</th>
                                            <th>Total</th>
                                             <th>Payment Method</th>
                                          
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <sql:query var="product_list" dataSource="${db}">
                                                    SELECT * FROM `cancel_order_master` WHERE `user_id`='${param.user_id}'
                                                    </sql:query>
                                                  
                                            
                                        <c:forEach items="${product_list.rows}" var="pro">
                                            <tr>
                                                <td><input type="checkbox" class="check-item" name="ids[]" value="1"></td>
                                                <td>${pro.invoice_no}</td>
                                                <td>${pro.cancel_date} </td>
                                                <td>${pro.cancel_time}</td>
                                                <td>${pro.address}</td>
                                                <td>Rs ${pro.grand_total} </td>
                                                <td>${pro.payment_method}</td>
                                              

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

</div>
    </c:forEach>
</main>
    <jsp:include page="admin_footer.jsp"/>
    
</div>

<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="js/jquery-3.4.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
