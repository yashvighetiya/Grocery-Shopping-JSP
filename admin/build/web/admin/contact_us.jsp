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

        <c:set value="SELECT * FROM `contact_us`" var="select_query_customer"/>         
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Contact Us</h2>
           <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active">Contact Us</li>
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
                                            <th>User Subject</th>
                                            <th>User Message</th>
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
                                                <td>${user_list.id}</td>

                                                <td>${user_list.user_name}</td>
                                                <td>${user_list.user_email}</td>
                                                <td>${user_list.user_subject}</td>
                                               
                                               
                                                    <td>
                                                       ${user_list.user_message} 
                                                    </td>
                                                <td class="action-btns">
                                                    <a href="delete_contact_us.jsp?user_id=${user_list.id}" class="delete-btn" title="Edit"><i class="fas fa-trash-alt" onclick="return confirm('Do You Really Want to Delete Contact Us Details?')"></i></a>
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
