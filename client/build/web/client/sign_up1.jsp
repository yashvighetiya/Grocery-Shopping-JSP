<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.regex.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, shrink-to-fit=9">
<meta name="description" content="Gambolthemes">
<meta name="author" content="Gambolthemes">
<title>Gambo - Sign Up</title>

<link rel="icon" type="image/png" href="images/fav.png">

<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/night-mode.css" rel="stylesheet">
<link href="css/step-wizard.css" rel="stylesheet">

<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
<link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="vendor/semantic/semantic.min.css">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

</head>
<body>
<div class="sign-inup">
<div class="container">
<div class="row justify-content-center">
<div class="col-lg-5">
<div class="sign-form">
<div class="sign-inner">
<div class="sign-logo" id="logo">
<a href="index.jsp"><img src="images/logo.svg" alt=""></a>
<a href="index.jsp"><img class="logo-inverse" src="images/dark-logo.svg" alt=""></a>
</div>
<c:set value="Sign Up" var="whichpage"/> 
<%--forgot pass code start--%>

<c:if test="${param.forgot_pass == 'yes'}">
    <c:set scope="session" value="yes" var="forgotpass"/> 
    <c:set var="whichpage" value="Forgot Password"/>
</c:if>

<%--forgot pass code ends--%>
<div class="form-dt">
<div class="form-inpts checout-address-step">
    <form method="post">
    <div class="form-title"><h6>${whichpage}</h6></div>

<div class="form-group pos_rel">
<input id="email[address]" name="emailaddress" type="email" placeholder="Email Address" class="form-control lgn_input" required="">
<i class="uil uil-envelope lgn_icon"></i>
</div>


<%--otp code start--%>
<c:if test="${param.send_btn=='send' && param.emailaddress!=''}">
    
    <%
        HttpSession session2 = request.getSession(true);
        session2.setAttribute("e2",request.getParameter("emailaddress"));
        pageContext.setAttribute("user_email1",session2.getAttribute("e2"));
    %>
    
    <c:choose>
        <c:when test="${forgotpass == 'yes'}">
            
            <sql:query var="emailmatch" dataSource="${db}">
                select * from users where user_email="${user_email1}"
            </sql:query>
                
            <c:choose>
                
                <c:when test="${emailmatch.rowCount == 0}">
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>toastr.info('Enter Valid Email Address');
            </script>
                </c:when>
                    
                <c:otherwise>
                   <c:redirect url="sign_up2.jsp"/>
                </c:otherwise>
                    
            </c:choose>
                    
        </c:when>
        <c:otherwise>
            <sql:query var="emailmatch1" dataSource="${db}">
                select * from users where user_email="${param.emailaddress}"
            </sql:query>
             
            <c:choose>
                
                <c:when test="${emailmatch1.rowCount == 0}">
                   <c:redirect url="sign_up2.jsp"/>
                </c:when>
                    
                <c:otherwise>
                     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>toastr.info('Your email is already Registered');
            </script>
                </c:otherwise>
                    
            </c:choose>
              <%--  <c:redirect url="sign_up2.jsp"/>--%>
        </c:otherwise>
                    
    </c:choose>
    
</c:if>
<%--otp code end--%>

<div class="form-group pos_rel">
<label class="control-label">Verification Code Will Send To Your Mail </label>
</div>

<button class="login-btn hover-btn" type="submit" name="send_btn" value="send">Send OTP</button>

</form>
</div>
<div class="signup-link">
<p>I have an account? - <a href="sign_in.jsp">Sign In Now</a></p>
</div>
</div>
</div>
</div>
<div class="copyright-text text-center mt-3">
<i class="uil uil-copyright"></i>Copyright 2022 <b>Gambolthemes</b> . All rights reserved
</div>
</div>
</div>
</div>
</div>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/OwlCarousel/owl.carousel.js"></script>
<script src="vendor/semantic/semantic.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/custom.js"></script>
<script src="js/product.thumbnail.slider.js"></script>
<script src="js/offset_overlay.js"></script>
<script src="js/night-mode.js"></script>
</body>
</html>