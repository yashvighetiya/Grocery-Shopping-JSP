<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
        <script>
            var request;
            function sendInfo()
            {
                var v = document.vinform.fullname.value;

                var url = "select_username.jsp?val=" + v;


                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = function () {
                        // alert(1);
                        if (request.readyState == 4) {
                            var val = request.responseText;
                            document.getElementById('printoutput').innerHTML = val;
                        }
                    };
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }

            function getInfo() {
                if (request.readyState == 4) {
                    var val = request.responseText;
                    document.getElementById('amit').innerHTML = val;
                }

            }

        </script>

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
                                            <div class="form-title"><h6>Sign Up</h6></div>
                                            <div class="form-group pos_rel">
                                                <input id="fullname" name="fullname" type="text" placeholder="User name" onkeyup="sendInfo()" class="form-control lgn_input" required="">
                                                <i class="uil uil-user-circle lgn_icon"></i>
                                                <font color="red"><div id="printoutput"></div></font>
                                            </div>

                                            <div class="form-group pos_rel">
                                                <input id="phonenumber" name="phone" type="text" maxlength="10" placeholder="Phone Number" class="form-control lgn_input" required="">
                                                <i class="uil uil-mobile-android-alt lgn_icon"></i>
                                                 <font color="red"><div id="phoneoutput"></div></font>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input id="password1" name="password1" type="password" placeholder="New Password" autocomplete="off" class="form-control lgn_input" required="">
                                                <i class="uil uil-padlock lgn_icon"></i>
                                                <font color="red"><div id="passoutput"></div></font>
                                            </div>
                                            <div class="form-group pos_rel">
                                                <input id="password2" name="password2" type="password" placeholder="Confrim Password" class="form-control lgn_input" required="">
                                                <i class="uil uil-padlock lgn_icon"></i>
                                                <font color="red"><div id="confirmpassoutput"></div></font>
                                            </div>

                                            <%-- sign up now java code start--%>
                                            <%-- password validation start--%>
                                            <script>
                                                var request1;
                                                $(document).ready(function () {
                                                    $("input").focusout(function () {
                                                        if ($(password1).val() == '') {
                                                        } else {
                                                            sendInfo1();
                                                            function sendInfo1()
                                                            {
                                                                var v1 = document.vinform.password1.value;

                                                                var url1 = "password_validation.jsp?val1=" + v1;


                                                                if (window.XMLHttpRequest) {
                                                                    request1 = new XMLHttpRequest();
                                                                } else if (window.ActiveXObject) {
                                                                    request1 = new ActiveXObject("Microsoft.XMLHTTP");
                                                                }

                                                                try {
                                                                    request1.onreadystatechange = function () {

                                                                        if (request1.readyState == 4) {
                                                                            var val2 = request1.responseText;

                                                                            document.getElementById('passoutput').innerHTML = val2;

                                                                        }
                                                                    };
                                                                    request1.open("GET", url1, true);
                                                                    request1.send();
                                                                } catch (e) {
                                                                    alert("Unable to connect to server");
                                                                }
                                                            }

                                                            //$(pass1).css('border', 'solid 2px green');	
                                                        }

                                                    }).trigger("focusout");
                                                });
                                            </script>
                                            <%-- password ajax validation over--%>
                                            <%-- confirm password validation start--%>
                                           
                                            <script>
                                                var request3;
                                                $(document).ready(function () {
                                                    $("input").focusout(function () {
                                                        if ($(password2).val() == '') {
                                                        } else {
                                                            var v3 = document.vinform.password2.value;
                                                            var v4 = document.vinform.password1.value;
                                                            if (v3 !== v4)
                                                            {
                                                                $(password2).css('border', 'solid 3px red');
                                                                document.getElementById('confirmpassoutput').innerHTML = 'Confrim Password Does Not Match with Password';
                                                            } else
                                                            {
                                                                $(password2).css('border', 'solid 3px green');
                                                                $(password1).css('border', 'solid 3px green');
                                                                document.getElementById('confirmpassoutput').innerHTML = '';
                                                            }
                                                        }

                                                    }).trigger("focusout");
                                                });
                                            </script>
                                            <%-- confirm password ajax validation over--%>
                                              <%-- fullname  ajax validation start--%>
                                               <script>
                                                var request5;
                                                $(document).ready(function () {
                                                    $("input").focusout(function () {
                                                        if ($(fullname).val() == '') {
                                                        } else {
                                                            sendInfo5();
                                                            function sendInfo5()
                                                            {
                                                                var v5 = document.vinform.fullname.value;

                                                                var url5 = "fullname_validation.jsp?val1=" + v5;


                                                                if (window.XMLHttpRequest) {
                                                                    request5 = new XMLHttpRequest();
                                                                } else if (window.ActiveXObject) {
                                                                    request5 = new ActiveXObject("Microsoft.XMLHTTP");
                                                                }

                                                                try {
                                                                    request5.onreadystatechange = function () {

                                                                        if (request5.readyState == 4) {
                                                                            var val5 = request5.responseText;

                                                                            document.getElementById('printoutput').innerHTML = val5;

                                                                        }
                                                                    };
                                                                    request5.open("GET", url5, true);
                                                                    request5.send();
                                                                } catch (e) {
                                                                    alert("Unable to connect to server");
                                                                }
                                                            }

                                                            //$(pass1).css('border', 'solid 2px green');	
                                                        }

                                                    }).trigger("focusout");
                                                });
                                            </script>
                                             <%-- fullname  ajax validation over--%>
                                             <%-- phone  ajax validation start--%>
                                               <script>
                                                var request6;
                                                $(document).ready(function () {
                                                    $("input").focusout(function () {
                                                        if ($(phonenumber).val() == '') {
                                                        } else {
                                                            sendInfo6();
                                                            function sendInfo6()
                                                            {
                                                                var v6 = document.vinform.phone.value;

                                                                var url6 = "phone_validation.jsp?val1=" + v6;


                                                                if (window.XMLHttpRequest) {
                                                                    request6 = new XMLHttpRequest();
                                                                } else if (window.ActiveXObject) {
                                                                    request6 = new ActiveXObject("Microsoft.XMLHTTP");
                                                                }

                                                                try {
                                                                    request6.onreadystatechange = function () {

                                                                        if (request6.readyState == 4) {
                                                                            var val6 = request6.responseText;

                                                                            document.getElementById('phoneoutput').innerHTML = val6;

                                                                        }
                                                                    };
                                                                    request6.open("GET", url6, true);
                                                                    request6.send();
                                                                } catch (e) {
                                                                    alert("Unable to connect to server");
                                                                }
                                                            }

                                                            //$(pass1).css('border', 'solid 2px green');	
                                                        }

                                                    }).trigger("focusout");
                                                });
                                            </script>
                                             <%-- phone  ajax validation over--%>
                                            <c:if test="${param.sign_up_now.equals('signupnow')}">

                                                <c:if test="${param.password1.equals(param.password2)}">
                                                    <%
                                                        Pattern pattern = Pattern.compile("[0-9]{10}");
                                                        Matcher matcher = pattern.matcher(request.getParameter("phone"));
                                                        boolean phone_valid = matcher.matches();
                                                        pageContext.setAttribute("phone_valid", phone_valid);

                                                        Pattern pattern1 = Pattern.compile("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20}$");
                                                        Matcher matcher1 = pattern1.matcher(request.getParameter("password1"));
                                                        boolean password_valid = matcher1.matches();
                                                        pageContext.setAttribute("password_valid", password_valid);

                                                        Pattern pattern2 = Pattern.compile("[a-zA-Z0-9@_#.]{3,25}");
                                                        Matcher matcher2 = pattern2.matcher(request.getParameter("fullname"));
                                                        boolean name_valid = matcher2.matches();
                                                        pageContext.setAttribute("name_valid", name_valid);

                                                        HttpSession session2 = request.getSession(true);
                                                        pageContext.setAttribute("user_email1", session2.getAttribute("e2"));
                                                    %>

                                                    <c:if test="${phone_valid == true && password_valid == true && name_valid == true}">

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
                                                                stringtoencrypt = request.getParameter("password1");
                                                                Cipher cipher = Cipher.getInstance(ALGORITHM);
                                                                cipher.init(Cipher.ENCRYPT_MODE, secretKey);
                                                                encryptedString = Base64.getEncoder().encodeToString(cipher.doFinal(stringtoencrypt.getBytes("UTF-8")));
                                                                pageContext.setAttribute("encryptedpass", encryptedString);
                                                            } catch (Exception e) {
                                                                out.println("Error while encrypting: " + e.toString());
                                                            }
                                                            
                                                              //date and time
                                                               Date date = new Date();
                                                                SimpleDateFormat formatter = new SimpleDateFormat("yy/MM/dd");
                                                                String date1 = formatter.format(date);
                                                                 pageContext.setAttribute("date", date1);

                                                        %>
                                                        <c:catch>
                                                        <sql:update dataSource="${db}" var="insert_data">
                                                            insert into users(user_name,user_password,user_contact,user_email,date) values("${param.fullname}","${encryptedpass}","${param.phone}","${user_email1}","${date}");
                                                        </sql:update>
                                                        </c:catch>
                                                        <c:if test="${insert_data > 0}">
                                                            <c:catch>
                                                            <sql:update dataSource="${db}" var="insert_balance">
                                                     INSERT INTO `client_wallet`(`user_name`, `balance`, `user_contact`, `user_email`) VALUES ('${param.fullname}','200','${param.phone}','${user_email1}')
                                                        </sql:update>
                                                            </c:catch>
                                                        <c:if test="${insert_balance > 0}">
                                                            <c:remove var="user_name"/>
                                                        <c:remove var="cart_email"/>
                                                        <c:set scope="application" value="${param.fullname}" var="user_name"/>
                                                        <c:set var="cart_email" value="${param.user_email1}" scope="session"/>
                                                       <script> 
                                                            window.location.href = "index.jsp";
                                                         </script>
                                                        </c:if>
                                                             
                                                        </c:if>
                                                       

                                                    </c:if>

                                                </c:if>

                                            </c:if>
                                            <%-- sign up now java code ends--%>

                                            <button class="login-btn hover-btn" type="submit" name="sign_up_now" value="signupnow">Sign Up Now</button>
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