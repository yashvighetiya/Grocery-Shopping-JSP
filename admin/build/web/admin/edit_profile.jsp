
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<jsp:include page="admin_header.jsp"/>
<div id="layoutSidenav_content">
    <main>
        <c:catch var="exception_catch">
            <sql:query dataSource="${db}" var="admin_info">
                SELECT * FROM `admin_user` WHERE `admin_email`='${user_email}';
            </sql:query>
        </c:catch>
        <c:if test="${exception_catch != null}">
            <c:set var="toast_message" scope="session" value="Opps ! some Error occured"/>
        </c:if>

        <div class="container-fluid">
            <h2 class="mt-30 page-title">Edit Profile</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active">Edit Profile</li>
            </ol>
            <div class="row">
                <c:forEach items="${admin_info.rows}" var="admin_result">
                    <div class="col-lg-4 col-md-5">
                        <div class="card card-static-2 mb-30">
                            <div class="card-body-table">
                                <div class="shopowner-content-left text-center pd-20">

                                    <div class="shopowner-dt-left">
                                        <h4>Gambo Supermarket</h4>
                                        <span>Admin</span>
                                    </div>
                                    <div class="shopowner-dts">
                                        <div class="shopowner-dt-list">
                                            <span class="left-dt">Username</span>
                                            <span class="right-dt">${admin_result.admin_username}</span>
                                        </div>
                                            <c:set scope="page" value="${admin_result.admin_username}" var="username"/>
                                        <div class="shopowner-dt-list">
                                            <span class="left-dt">Phone</span>
                                            <span class="right-dt">+91${admin_result.admin_phone}</span>
                                        </div>
                                        <div class="shopowner-dt-list">
                                            <span class="left-dt">Email</span>
                                            <span class="right-dt">${admin_result.admin_email}</span>
                                        </div>
                                        <div class="shopowner-dt-list">
                                            <span class="left-dt">Address</span>
                                            <span class="right-dt">${admin_result.admin_address}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="col-lg-8 col-md-7">
                    <div class="card card-static-2 mb-30">
                        <div class="card-title-2">
                            <h4>Edit Profile</h4>
                        </div>
                        <div class="card-body-table">
                            <div class="news-content-right pd-20">
                                <form method="post">
                                    <c:forEach items="${admin_info.rows}" var="admin_result">
                                        <div class="row">

                                            <div class="col-lg-6">
                                                <div class="form-group mb-3">
                                                    <label class="form-label">Last Name*</label>
                                                    <input type="text" class="form-control" value="${admin_result.admin_username}" placeholder="Enter User Name" name="username">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group mb-3">
                                                    <label class="form-label">Email*</label>
                                                    <input type="email" class="form-control" value="${admin_result.admin_email}" placeholder="Enter Email Address" name="email">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group mb-3">
                                                    <label class="form-label">Phone*</label>
                                                    <input type="text" class="form-control" value="${admin_result.admin_phone}" placeholder="Enter Phone Number" name="phone">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group mb-3">
                                                    <label class="form-label">Address*</label>
                                                    <textarea class="text-control" placeholder="Enter Address" name="address">${admin_result.admin_address}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <button class="save-btn hover-btn" type="submit" name="login_now" value="loginnow1">Edit Profile</button>
                                            </div>
                                        </div>

                                        
                                    </c:forEach>
                                </form>
                                        <%--edit code start--%>
                                        <c:if test="${param.login_now.equals('loginnow1')}">
                                            ${param.username}<br><br>
                                            ${param.phone}<br><br>
                                            ${param.address}<br><br>
                                            ${param.email}<br><br>
                                            <c:catch var="catchexception">
                                                <sql:update dataSource="${db}" var="i">
                                                    UPDATE `admin_user` SET `admin_email`='${param.email}',`admin_phone`='${param.phone}',`admin_address`='${param.address}',`admin_username`='${param.username}' WHERE `admin_username`='${username}'
                                                </sql:update>
                                            </c:catch>
                                            <c:if test="${exception_catch != null}">
                                                <c:set var="toast_message" scope="session" value="Opps ! some Error occured"/>
                                            </c:if>
                                            <c:if test="${i == 1}">
                                               
                                                <c:set scope="session" value="${param.email}" var="user_email"/>
                                                <c:set var="toast_message" scope="session" value="Profil is successfully Edited"/>
                                            </c:if>
                                                <c:redirect url="index.jsp"/>
                                        </c:if>
                                        <%--edit code end--%> 
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
