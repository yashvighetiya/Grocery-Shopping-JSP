<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<!DOCTYPE html>
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
<h3 class="text-center font-weight-light my-4">Change Password</h3>
</div>
<div class="card-body">
    <form method="post">
<div class="form-group">
<label class="form-label" for="inputPasswordNew">New Password*</label>
<input class="form-control py-3" id="inputPasswordNew" name="newpass1" type="password" placeholder="Enter new password">
</div>
<div class="form-group">
<label class="form-label" for="inputPasswordNewConfirm">Confirmation Password*</label>
<input class="form-control py-3" id="inputPasswordNewConfirm" name="newpass2" type="password" placeholder="Enter New confirmation password">
</div>
<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
    <button class="btn btn-sign hover-btn" name="change_pass" value="changepass">Change Password</button>
</div>
</form>
</div>
    <c:if test="${param.change_pass.equals('changepass')}">
        <c:choose>
        <c:when test="${param.newpass1.equals(param.newpass2)}">
            <c:catch var="exception">
            <sql:update dataSource="${db}" var="change_pass">
           UPDATE `admin_user` SET `admin_password`='${param.newpass2}' WHERE `admin_email`='${user_email}'
            </sql:update>
            </c:catch>
            <c:if test="${change_pass > 0}">
                <c:redirect url="index.jsp"/>
                 <c:set value="Password Changed SuccessFully" var="toast_message" scope="session"/>

            </c:if>
            <c:if test="${exception != null}">
                 <c:set value="Opps! some Error occured" var="toast_message1" scope="session"/>

            </c:if>
        </c:when>
            
            <c:otherwise>
                
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script>var message = 'New Password and Confirm Pass does not Match';
    toastr.info(message);
    </script>
    
            </c:otherwise>
        </c:choose>
    </c:if>
</div>
</div>
</div>
</div>
</main>
</div>
</div>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
<c:if test="${toast_message1 != null}">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script>var message = '${toast_message1}';
    toastr.info(message);
    </script>
    <c:remove var="toast_message1" scope="session"/>
    </c:if>
    