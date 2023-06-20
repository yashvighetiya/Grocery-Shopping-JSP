<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<jsp:include page="admin_header.jsp"/>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Canceled Orders</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active">Cancel Orders</li>
            </ol>
            <div class="row justify-content-between">
                 <c:set value="SELECT * FROM `cancel_order_master` ORDER BY `invoice_no` DESC;" var="select_query_order" scope="session"/>
                <sql:query dataSource="${db}" var="order_master">
                  SELECT * FROM `cancel_order_master` ORDER BY `invoice_no` DESC;
                </sql:query>

                <div class="col-lg-12 col-md-12">
                    <form method="post">
                      
                    <div class="bulk-section mt-30">
                    <div class="search-by-name-input">
                        <input type="date" class="form-control" name="date">
                    </div>
                        <div class="input-group">
                            <c:set value="disabled" var="disability"/>
                             <c:if test="${param.date != ''}">
                                <c:if test="${param.login_now.equals('Search Category')}">
                                   
                                    <c:set value="${param.date}" var="select_query2" scope="session"/>
                                    <c:set value="" var="disability"/>
                                    </c:if>
                                </c:if>
                            <c:if test="${param.login_now.equals('see all')}">
                                <c:remove var="select_query2" scope="session"/>
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
                            <h4>All Canceled Orders</h4>
                        </div>
                        <div class="card-body-table">
                            <div class="table-responsive">
                                <table class="table ucp-table table-hover">
                                    <thead>
                                        <tr>

                                    <th style="width:130px"><center><b>Cancel Order ID</b></center></th>
                                 <th style="width:130px"><center><b>Invoice No</b></center></th>
                                    <th><center><b>User Name</b></center></th>
                                    <th style="width:200px"><center><b>Date & Time</b></center></th>
                                    <th style="width:300px"><center><b>Address</b></center></th>
                                    <th style="width:130px"><center><b>Payment Method</b></center></th>
                                    <th style="width:130px"><center><b>Total</b></center></th>
                                    <th style="width:130px"><center><b>Delivery Charges</b></center></th>
                                    <th style="width:130px"><center><b>Gambo Wallet Balance</b></center></th>
                                    <th style="width:130px"><center><b>Grand Total</b></center></th>
                                    <th style="width:100px"><center><b>Action</b></center></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${select_query2 != null}">
                                                <c:catch var="exception">
                                                    <sql:query var="order_master" dataSource="${db}">
                                                          SELECT * FROM `cancel_order_master` WHERE `cancel_date`='${select_query2}' ORDER BY `invoice_no` DESC;
                                                        </sql:query>
                                                      
                                                </c:catch>
                                                       
                                                <c:if test = "${exception != null}"> 
                                                    <c:set value="Opps! Some Error occured" var="toast_message" scope="session"/>
                                                 </c:if>
                                               
                                            </c:when>
                                            <c:otherwise>
                                                <sql:query var="order_master" dataSource="${db}">
                                                    <c:out value="${select_query_order}"/>
                                                </sql:query>
                                            </c:otherwise>
                                        </c:choose>
                                         
                                        <c:forEach items="${order_master.rows}" var="order_master_list">
                                            <tr>
                                                 <td><center>${order_master_list.cancel_order_id}</center></td>
                                                <td><center>${order_master_list.invoice_no}</center></td>
                                        <td><center>
                                            ${order_master_list.user_name}
                                        </center>
                                        </td>
                                        <td><center>
                                            <span class="delivery-time">${order_master_list.cancel_date}</span>
                                            <span class="delivery-time">${order_master_list.cancel_time}</span>
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
                                                        Rs ${order_master_list.grand_total - delivery.Delivery_charge + order_master_list.wallet_balance_used}

                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </center>
                                        </td>
                                        <td><center>

                                            
                                                        Rs ${order_master_list.delivery_charge}
                                                   
                                        </center>
                                        </td>
                                         <td><center>- Rs ${order_master_list.wallet_balance_used}</center></td>
<td><center><font color='darkpink'><b>Rs ${order_master_list.grand_total}</b></font></center></td>
                                        <td class="action-btns">
                                            <a href="cancel_order_view.jsp?cancel_order_id=${order_master_list.cancel_order_id}" class="views-btn"><center><i class="fas fa-eye"></i></center></a>

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
