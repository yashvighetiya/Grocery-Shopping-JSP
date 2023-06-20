<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.regex.*"%>

<%@page import="java.nio.charset.StandardCharsets" %>
<%@page import="java.security.MessageDigest" %>
<%@page import="java.security.NoSuchAlgorithmException" %>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.Base64" %>
<%@page import="javax.crypto.Cipher" %>
<%@page import="javax.crypto.spec.SecretKeySpec" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
﻿<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=9">
        <meta name="description" content="Gambolthemes">
        <meta name="author" content="Gambolthemes">
        <title>Payment Details</title>
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
                                        <form name="vinform" method="post">  
                                            <div class="form-title"><h6>Address Details</h6></div>

                                            <div class="form-group pos_rel">
                                                <input name="block_no" type="text" placeholder="Flat / House / Office No" class="form-control lgn_input" required="">

                                            </div>
                                            <div class="form-group pos_rel">
                                                <input  name="society_name" type="text" id="user_name" placeholder="Street / Society / Office Name" class="form-control lgn_input" required="">

                                                
                                            </div>

                                            <div class="form-group pos_rel">
                                                <input name="pincode" type="text" placeholder="Pincode" class="form-control lgn_input" required="">

                                            </div>
                                            <c:catch var="exception">
                                            <sql:query dataSource="${db}" var="city">
                                                SELECT * FROM `city`
                                            </sql:query>
                                            </c:catch>
                                            <select id="categtory" name="cities" class="form-control" required="required">  
                                                <option selected value="">--Select City--</option>
                                                <c:forEach items="${city.rows}" var="city_list">
                                                    <option value="${city_list.city}">${city_list.city}</option>
                                                </c:forEach>
                                            </select>
                                            <br>
                                            <%-- sign up now java code start--%>


                                            <c:if test="${param.sign_up_now.equals('signupnow')}">
                                                <c:set scope="session" value="${param.block_no},${param.society_name},${param.cities},${param.pincode}" var="Address"/>
                                                <c:set value="${param.cities}" var="city" scope="session"/>
                                                
 <c:redirect url="payment_option.jsp"/>
                                            </c:if>
                                            <%-- sign up now java code ends--%>

                                            <button class="login-btn hover-btn" type="submit" name="sign_up_now" value="signupnow">Proceed to Pay</button>
                                        </form>
                                        <br>
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