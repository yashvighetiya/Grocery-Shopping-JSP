
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:remove var="user_email" scope="application"/>
                                                           
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description-gambolthemes" content="">
        <meta name="author-gambolthemes" content="">
        <title>Gambo Supermarket Admin</title>
        <link href="css/styles.css" rel="stylesheet">
        <link href="css/admin-style.css" rel="stylesheet">

        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">

        <!--toast css file!-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

    </head>
    <body class="bg-sign">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header card-sign-header">
                                        <h3 class="text-center font-weight-light my-4">Login</h3>
                                    </div>
                                    <div class="card-body">
                                        <form method="post">

                                            <div class="form-group">
                                                <label class="form-label" for="inputEmailAddress">Email*</label>
                                                <input class="form-control py-3" id="inputEmailAddress" type="email" placeholder="Enter email address" name="admin_email" required="required">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label" for="inputPassword">Password*</label>
                                                <input class="form-control py-3" id="inputPassword" type="password" placeholder="Enter password" name="admin_password" required="required">
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" />
                                                    <label class="custom-control-label" for="rememberPasswordCheck">Remember password</label>
                                                </div>
                                            </div>
                                            <%-- sign up now java code start--%>

                                            <c:if test="${param.login_now.equals('loginnow')}">
                                                <c:catch var="admin_login"> 
                                                    <sql:query var="login" dataSource="${db}">
                                                        select * from admin_user where admin_email="${param.admin_email}" and admin_password="${param.admin_password}"
                                                    </sql:query>
                                                </c:catch>
                                                <c:choose>

                                                    <c:when test="${login.rowCount == 1}">
                                                        <c:redirect url="index.jsp">

                                                            <c:forEach items="${login.rows}" var="log_in_name">
                                                                <c:set scope="application" value="${log_in_name.admin_email}" var="user_email"/>
                                                            </c:forEach>
                                                        </c:redirect>
                                                    </c:when>
                                                    <c:when test = "${admin_login != null}"> 
                                                        <c:set value="adminloginexception" var="admin_login_exception" scope="session"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set value="failed_login" var="Loginfail" scope="session"/>
                                                    </c:otherwise>

                                                </c:choose>
                                            </c:if>   

                                            <%-- sign up now java code end--%>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <button class="btn btn-sign hover-btn" type="submit" name="login_now" value="loginnow">LOGIN</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <c:if test="${Loginfail != null}">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>toastr.info('Login Unsuccessful');
            </script>
            <c:remove var="Loginfail" scope="session"/>
        </c:if>
             <c:if test="${admin_login_exception != null}">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>toastr.info('Login Exception generated');
            </script>
            <c:remove var="admin_login_exception" scope="session"/>
        </c:if>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>

