<%@page import="java.sql.*"%>


<%@page import="java.nio.charset.StandardCharsets" %>
<%@page import="java.security.MessageDigest" %>
<%@page import="java.security.NoSuchAlgorithmException" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.Base64" %>
<%@page import="javax.crypto.Cipher" %>
<%@page import="javax.crypto.spec.SecretKeySpec" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, shrink-to-fit=9">
<meta name="description" content="Gambolthemes">
<meta name="author" content="Gambolthemes">
<title>Gambo - Sign In</title>

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

 <!--toast css file!-->
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
<div class="form-dt">
<div class="form-inpts checout-address-step">
    <form method="post">
<div class="form-title"><h6>Sign In</h6></div>

<%-- sign up now java code start--%>

<c:if test="${param.sign_in_now.equals('signinnow')}">
   <%
    SecretKeySpec secretKey;
    byte[] key;
    final String ALGORITHM = "AES";
   
    

    //preparesecretkey 
    String myKey = "secrete";
    MessageDigest sha = null;
    
    key = myKey.getBytes(StandardCharsets.UTF_8);
    sha = MessageDigest.getInstance("SHA-1");
    key = sha.digest(key);
    key = Arrays.copyOf(key, 16);
    secretKey = new SecretKeySpec(key, ALGORITHM);
    String encryptedString = "";
    String abc = "";
    
    //encrypt
    try {
            abc = request.getParameter("user_password1");
            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            encryptedString = Base64.getEncoder().encodeToString(cipher.doFinal(abc.getBytes("UTF-8")));
            pageContext.setAttribute("encryptedpassword",encryptedString);
                  
        } catch (Exception e) {
            out.println("Error while encrypting: " + e.toString());
        }
    
%>
    <sql:query var="log_in" dataSource="${db}">
        select * from users where user_email="${param.emailaddress1}" and user_password="${encryptedpassword}"
    </sql:query>
        <c:choose>
                
                <c:when test="${log_in.rowCount == 0}">
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>toastr.info('Enter valid username and password');
            </script>
          
                </c:when>
                    
                <c:otherwise>
                   <c:redirect url="index.jsp">
                      <c:remove var="user_name"/>
                      <c:remove var="cart_email"/>
                      <c:forEach items="${log_in.rows}" var="log_in_name">
                                <c:set scope="application" value="${log_in_name.user_name}" var="user_name"/>
                                 <c:set var="cart_email" value="${param.emailaddress1}" scope="session"/>
                            </c:forEach>
                      </c:redirect>
                </c:otherwise>
                    
            </c:choose>
</c:if>

<%-- sign in now java code end--%>

<div class="form-group pos_rel">
<input id="email[address]" name="emailaddress1" type="email" placeholder="Email Address" class="form-control lgn_input" >
<i class="uil uil-envelope lgn_icon"></i>
</div>
<div class="form-group pos_rel">
<input id="password1" name="user_password1" type="password" placeholder="Enter Password" class="form-control lgn_input" required="">
<i class="uil uil-padlock lgn_icon"></i>
</div>
<button class="login-btn hover-btn" type="submit" name="sign_in_now" value="signinnow">Sign In Now</button>
</form>
</div>
<div class="password-forgor">
<a href="sign_up1.jsp?forgot_pass=yes">Forgot Password?</a>
</div>
<div class="signup-link">
<p>Don't have an account? - <a href="sign_up1.jsp">Sign Up Now</a></p>
</div>
</div>
</div>
</div>
<div class="copyright-text text-center mt-3">
<i class="uil uil-copyright"></i>Copyright 2020 <b>Gambolthemes</b> . All rights reserved
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