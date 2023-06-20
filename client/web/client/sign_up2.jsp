<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.regex.*"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///groceries" password="" user="root" var="db" scope="session"/>

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
<div class="form-dt">
<div class="form-inpts checout-address-step">
    <form method="post">
<div class="form-title"><h6>Sign Up</h6></div>

<c:if test="${otp_incorrect.equals('wrong_otp')}">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>toastr.info('Enter correct OTP(OTP Resent)');
            </script>
            <c:remove scope="session" var="otp_incorrect"/>
</c:if>

<%--otp code start--%>
<c:if test="${param.verification != 'verify'}">
    
    <%!
        public String otp = ""; 
    %>
    <%
      
        if(request.getParameter("emailaddress")!="")
        {
            //Generationg otp
            Random r=new Random();
            String rand_char="abcedfghijklmnopqrstuvwxyz"+"1234567890"+"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            otp="";
            
            for(int i=0; i<4; i++)
            {
                otp+=rand_char.charAt(r.nextInt(rand_char.length()));
            }
            //Creating a result for getting status that messsage is delivered or not!
            
            String result;

            // Get recipient's email-ID, message & subject-line from textfield page
            HttpSession session2 = request.getSession(true);
                    
            final String to = (String) session2.getAttribute("e2");

            final String subject = "GAMBO otp alert";

            final String messg = "Hi!\n\nHere is the verification code (OTP) for your GAMBO registration : "+otp+"\n\nPlease do not share it with anyone\n\nThank You\n-GAMBO Super Market";

    

            // Sender's email ID and password needs to be mentioned

            final String from = "yashvi.ghetiya1@gmail.com";

            final String pass = "yashvi@952001";



            // Defining the gmail host

            String host = "smtp.gmail.com";



            // Creating Properties object

            Properties props = new Properties();



            // Defining properties

            props.put("mail.smtp.host", host);

            props.put("mail.transport.protocol", "smtp");

            props.put("mail.smtp.auth", "true");

            props.put("mail.smtp.starttls.enable", "true");

            props.put("mail.user", from);

            props.put("mail.password", pass);

            props.put("mail.port", "443");

 

            // Authorized the Session object.

            Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

                @Override

                protected PasswordAuthentication getPasswordAuthentication() {

                    return new PasswordAuthentication(from, pass);

                }


            });

 

            try {

                // Create a default MimeMessage object.

                MimeMessage message = new MimeMessage(mailSession);

                // Set From: header field of the header.

                message.setFrom(new InternetAddress(from));

                // Set To: header field of the header.

                message.addRecipient(Message.RecipientType.TO,

                        new InternetAddress(to));

                // Set Subject: header field

                message.setSubject(subject);

                // Now set the actual message

                message.setText(messg);

                // Send message

                Transport.send(message);

                result = "Your mail sent successfully....";

            } catch (MessagingException mex) {

                mex.printStackTrace();

                result = "Error: unable to send mail....";

            }
               session.setAttribute("sign_up_otp",otp);
               out.println(otp);
               out.println(result);
        } 
        else
        {
            out.println("null value");
        }
          

%>
    
</c:if>

<%--otp code end--%>

<div class="form-group pos_rel">
<label class="control-label">Enter Verification Code Send To Your Mail </label>
<ul class="code-alrt-inputs signup-code-list">
<li>
    <input id="code[1]" name="number1" type="text" placeholder="" class="form-control input-md" >
</li>
<li>
<input id="code[2]" name="number2" type="text" placeholder="" class="form-control input-md" >
</li>
<li>
<input id="code[3]" name="number3" type="text" placeholder="" class="form-control input-md" >
</li>
<li>
    <input id="code[4]" name="number4" type="text" placeholder="" class="form-control input-md" >
</li>

</ul>

</div>


<%-- sign up now java code start--%>


<c:if test="${param.verification.equals('verify')}">
       
            <%
                String user_otp=(String)session.getAttribute("sign_up_otp");
                
                pageContext.setAttribute("user_otp",user_otp);
            %>
           <c:set value="${param.number1}${param.number2}${param.number3}${param.number4}" var="otp_correct"/>
           <c:choose>
           <c:when test="${otp_correct.equals(user_otp)}">
               <c:if test="${forgotpass == null}">
                   <c:redirect url = "sign_up.jsp"/>
               </c:if>
               
               <c:if test="${forgotpass != null}">
                   <c:redirect url = "forgot_password.jsp"/>
               </c:if>
           </c:when>
               <c:otherwise>
                   <c:set scope="session" value="wrong_otp" var="otp_incorrect"/>
                     <c:redirect url = "sign_up2.jsp"/>
               </c:otherwise>
           </c:choose>
</c:if>
<%-- sign up now java code ends--%>

<button class="login-btn hover-btn" type="submit"  name="verification" value="verify">VERIFICATION</button>
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