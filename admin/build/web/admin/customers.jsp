<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<jsp:include page="admin_header.jsp"/>
<div id="layoutSidenav_content">
    <main>

        <c:set value="SELECT * FROM `users`" var="select_query_customer"/>         
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Customers</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active">Customers</li>
            </ol>
            <form method="post">
                <div class="bulk-section mt-30">

                    <div class="input-group">



                    </div>
                </div>
            </form><br>
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="card card-static-2 mb-30">
                        <div class="card-title-2">
                            <h4>All Customers</h4>
                        </div>
                        <div class="card-body-table">
                            <div class="table-responsive">
                                <table class="table ucp-table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width:60px"><input type="checkbox" class="check-all"></th>
                                            <th style="width:60px">ID</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Total Purchase</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <sql:query var="users" dataSource="${db}">
                                            <c:out value="${select_query_customer}"/>
                                        </sql:query>

                                        <c:forEach items="${users.rows}" var="user_list">
                                            <tr>
                                                <td><input type="checkbox" class="check-item" name="ids[]" value="10"></td>
                                                <td>${user_list.user_id}</td>

                                                <td>${user_list.user_name}</td>
                                                <td>${user_list.user_email}</td>
                                                <td>+91${user_list.user_contact}</td>
                                                <sql:query dataSource="${db}" var="master">
                                                    SELECT SUM(`grand_total`) AS "total" FROM `order_master` WHERE user_id='${user_list.user_id}';
                                                </sql:query>
                                               
                                                    <td>Rs <b><font color='blue'> <c:out value="${master.rows[0].total}"/></font></b>
                                                        <c:if test="${master.rows[0].total == null}">
                                                            0
                                                    </c:if>
                                                    </td>
                                                <td class="action-btns">
                                                    <a href="customer_view.jsp?user_id=${user_list.user_id}" class="view-shop-btn" title="View"><i class="fas fa-eye"></i></a>
                                                    <a href="delete_user.jsp?user_id=${user_list.user_id}" class="delete-btn" title="Edit"><i class="fas fa-trash-alt" onclick="return confirm('Do You Really Want to Remove User?')"></i></a>
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
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="js/jquery-3.4.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
