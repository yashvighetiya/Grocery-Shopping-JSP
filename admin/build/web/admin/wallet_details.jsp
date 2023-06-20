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

        <c:set value="SELECT * FROM `city`" var="select_query_customer"/>         
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Wallet Details</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active">Wallet Details</li>
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
                            <h4><b>Wallet Details</b></h4>
                        </div>
                        <div class="card-body-table">
                            <div class="table-responsive">
                                <table class="table ucp-table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width:60px"><input type="checkbox" class="check-all"></th>
                                            <th style="width:60px"><b>ID</b></th>
                                            <th><b>Percentage Can Be Used at Once</b></th>
                                            <th><b>Get Rupees</b></th>
                                           <th><b>Can Be Used On Purchase of Rupees</b></th>
                                            <th><b>Get Balance On Purchase of Rupees</b></th>
                                                   <th><b>Action</b></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <sql:query var="users" dataSource="${db}">
                                         SELECT * FROM `gambo_wallet_details`
                                        </sql:query>

                                        <c:forEach items="${users.rows}" var="user_list">
                                            <tr>
                                                <td><input type="checkbox" class="check-item" name="ids[]" value="10"></td>
                                                <td>${user_list.id}</td>

                                                <td>${user_list.per_can_be_used} %</td>
                                                <td>Rs ${user_list.get_Rs}</td>
                                                 <td>Rs ${user_list.used_on_purchase_of}</td>
                                                 <td>Rs ${user_list.on_purchase_of_or_more_than}</td>
                                                   <td class="action-btns">
                                                     <a href="edit_wallet_details.jsp?id=${user_list.id}" class="edit-btn" title="Edit"><i class="fas fa-edit"></i></a>
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
