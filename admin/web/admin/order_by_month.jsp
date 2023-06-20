<%--<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<form>
    <input type="month" name="month_picker"/>
    <button type="submit" name="login_now" value="Search Category">Search Orders</button>
                               
</form>
<c:if test="${sub.equals('123')}">
   
</c:if>
<c:if test="${param.login_now.equals('Search Category')}">
    ${param.month_picker}<br>
    month ${fn:substringAfter(param.month_picker, "-")} 
    <br>  year ${fn:substringBefore(param.month_picker, "-")} 
  <sql:query dataSource="${db}" var="month">
        
SELECT * FROM `order_master` WHERE MONTH(date)='${fn:substringAfter(param.month_picker, "-")}' AND YEAR(date)='${fn:substringBefore(param.month_picker, "-")}';
    </sql:query>
<c:forEach items="${month.rows}" var="selected">
        ${selected.invoice_no}
    </c:forEach>
</c:if>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<jsp:include page="admin_header.jsp"/>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Orders</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active">Orders</li>
            </ol>
            <div class="row justify-content-between">
                 <c:set value="SELECT * FROM `order_master` ORDER BY `invoice_no` DESC;" var="select_see_all" scope="session"/>
                <sql:query dataSource="${db}" var="order_master">
                    SELECT * FROM `order_master` 
                </sql:query>

                <div class="col-lg-12 col-md-12">
                    <form method="post">
                       
                    <div class="bulk-section mt-30">
                    <div class="search-by-name-input">
                      <input type="month" name="month_picker"/>
                    </div>
                        <div class="input-group">
                            <c:set value="disabled" var="disability"/>
                            <c:if test="${param.month_picker != ''}">
                                <c:if test="${param.login_now.equals('Search Category')}">
                                    <c:set value="${param.month_picker}" var="select_query3" scope="session"/>
                                    <c:set value="" var="disability"/>
                                </c:if>
                            </c:if>
                            <c:if test="${param.login_now.equals('see all')}">
                                <c:remove var="select_query3" scope="session"/>
                                <c:set value="disabled" var="disability"/>
                                </c:if>
                            <div class="input-group-append">
                                <button class="status-btn hover-btn" type="submit" name="login_now" value="Search Category">Search Orders</button>
                                <button class="status-btn hover-btn" type="submit" name="login_now" value="see all" ${disability}>See All</button>
                            </div>
                           
                        </div>
                    </div>
                    </form>
                    <br>
                    <div class="card card-static-2 mb-30">
                        <div class="card-title-2">
                            <h4>All Orders</h4>
                        </div>
                        <div class="card-body-table">
                            <div class="table-responsive">
                                <table class="table ucp-table table-hover">
                                    <thead>
                                        <tr>

                                    <th style="width:130px"><center><b>Order ID</b></center></th>
                                    <th><center><b>User Name</b></center></th>
                                    <th style="width:200px"><center><b>Date & Time</b></center></th>
                                    <th style="width:300px"><center><b>Address</b></center></th>
                                    <th style="width:130px"><center><b>Payment Method</b></center></th>
                                    <th style="width:130px"><center><b>Total</b></center></th>
                                    <th style="width:130px"><center><b>Delivery Charges</b></center></th>
                                    <th style="width:130px"><center><b>Grand Total</b></center></th>
                                    <th style="width:100px"><center><b>Action</b></center></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${select_query3 != null}">
                                                <c:catch var="exception">
                                                    <sql:query var="order_master" dataSource="${db}">
                                                        SELECT * FROM `order_master` WHERE MONTH(date)='${fn:substringAfter(param.month_picker, "-")}' AND YEAR(date)='${fn:substringBefore(param.month_picker, "-")}' ORDER BY `invoice_no` DESC;
                                                    </sql:query>
                                               
                                                </c:catch>
                                                       
                                                <c:if test = "${exception != null}"> 
                                                    <c:set value="Opps! Some Error occured" var="toast_message" scope="session"/>
                                                 </c:if>
                                               
                                            </c:when>
                                            <c:otherwise>
                                                <sql:query var="order_master" dataSource="${db}">
                                                    <c:out value="${select_see_all}"/>
                                                </sql:query>
                                               
                                            </c:otherwise>
                                        </c:choose>
                                         
                                        <c:forEach items="${order_master.rows}" var="order_master_list">
                                            <tr>
                                                <td><center>${order_master_list.invoice_no}</center></td>
                                        <td><center>
                                            ${order_master_list.user_name}
                                        </center>
                                        </td>
                                        <td><center>
                                            <span class="delivery-time">${order_master_list.date}</span>
                                            <span class="delivery-time">${order_master_list.time}</span>
                                        </center>
                                        </td>
                                        <td><center>${order_master_list.address}</center></td>
                                        <td><center>
                                            <span class="badge-item badge-status">${order_master_list.payment_method}</span>
                                        </center>
                                        </td>
                                        <sql:query dataSource="${db}" var="delivery_charges">
                                            SELECT * FROM `delivery_charges_detail`
                                        </sql:query>
                                        <td> <center>
                                            <c:forEach items="${delivery_charges.rows}" var="delivery">
                                                <c:choose>
                                                    <c:when test="${order_master_list.grand_total >= delivery.on_price_less_then}">
                                                        Rs ${order_master_list.grand_total}
                                                    </c:when>
                                                    <c:otherwise>
                                                        Rs ${order_master_list.grand_total - delivery.Delivery_charge}

                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </center>
                                        </td>
                                        <td><center>

                                            <c:forEach items="${delivery_charges.rows}" var="delivery">
                                                <c:choose>
                                                    <c:when test="${order_master_list.grand_total >= delivery.on_price_less_then}">
                                                        Rs 0
                                                    </c:when>
                                                    <c:otherwise>
                                                        Rs ${delivery.Delivery_charge}
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </center>
                                        </td>
                                        <td><center>Rs ${order_master_list.grand_total}</center></td>
                                        <td class="action-btns">
                                            <a href="order_view.jsp?invoice_no=${order_master_list.invoice_no}" class="views-btn"><center><i class="fas fa-eye"></i></center></a>

                                        </td>
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
    </main>

    <jsp:include page="admin_footer.jsp"/>
</div>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
