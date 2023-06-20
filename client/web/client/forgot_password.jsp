<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>

<%@page import="java.nio.charset.StandardCharsets" %>
<%@page import="java.security.MessageDigest" %>
<%@page import="java.security.NoSuchAlgorithmException" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.Base64" %>
<%@page import="javax.crypto.Cipher" %>
<%@page import="javax.crypto.spec.SecretKeySpec" %>

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
<title>Gambo - Forgot Password</title>

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
<div class="form-title"><h6>Request a Password Reset</h6></div>

<div class="form-group pos_rel">
<input id="password[old]" name="passwordnew1" type="password" placeholder="Enter New Password" class="form-control lgn_input" required="">
<i class="uil uil-padlock lgn_icon"></i>
</div>
<div class="form-group pos_rel">
<input id="password[new]" name="passwordnew2" type="password" placeholder="Renter Password" class="form-control lgn_input" required="">
<i class="uil uil-padlock lgn_icon"></i>
</div>
<button class="login-btn hover-btn" type="submit" name="reset_pass" value="resetpass">Reset Password</button>
</form>
</div>
    <%-- reset password code start--%>


    <c:if test="${param.reset_pass.equals('resetpass')}">
        
        <c:if test="${param.passwordnew1.equals(param.passwordnew2)}">
         
            <%
                Pattern pattern1 = Pattern.compile("[0-9a-zA-Z@!#$%^&*()-=]{8,25}");
                Matcher matcher1 = pattern1.matcher(request.getParameter("passwordnew1"));
                boolean password_valid = matcher1.matches();
                pageContext.setAttribute("password_valid",password_valid);
                
                HttpSession session2 = request.getSession(true);
                pageContext.setAttribute("user_email1",session2.getAttribute("e2"));
            %>
            <c:if test="${password_valid == true}">
                  
            <%--password encryption--%>
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
                String stringtoencrypt = "";
                
                //encrypt
                try {
                        stringtoencrypt = request.getParameter("passwordnew1");
                        Cipher cipher = Cipher.getInstance(ALGORITHM);
                        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
                        encryptedString = Base64.getEncoder().encodeToString(cipher.doFinal(stringtoencrypt.getBytes("UTF-8")));
                        pageContext.setAttribute("encryptedpass",encryptedString);
                    } catch (Exception e) {
                        out.println("Error while encrypting: " + e.toString());
                    }
            %>
                                
                <sql:update dataSource="${db}">
                    UPDATE users set user_password="${encryptedpass}" where user_email="${user_email1}";
                </sql:update>
                    
                <sql:query dataSource="${db}" var="users">
                    select * from users where user_email="${user_email1}";
                </sql:query>
                    
                <c:forEach var="r" items="${users.rows}">
                    <c:redirect url="index.jsp">
                        <c:remove var="user_name"/>
                        <c:remove var="forgotpass"/>
                        <c:set scope="session" value="${r.user_name}" var="user_name"/>
                    </c:redirect>
                </c:forEach>
                     
            </c:if>
                    
        </c:if>
    </c:if>
    
    <%-- reset password code end--%>
<div class="signup-link">
<p>Go Back - <a href="sign_in.jsp">Sign In Now</a></p>
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