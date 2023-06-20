<%-- 
    Document   : footer
    Created on : 21 Dec, 2021, 8:39:31 AM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="footer">
<div class="footer-first-row">
<div class="container">
<div class="row">
<div class="col-md-6 col-sm-6">
<ul class="call-email-alt">
<li><a href="#" class="callemail"><i class="uil uil-dialpad-alt"></i>1800-000-000</a></li>
<li><a href="#" class="callemail"><i class="uil uil-envelope-alt"></i><span class="__cf_email__" data-cfemail="aac3c4ccc5eacdcbc7c8c5d9dfdacfd8c7cbd8c1cfde84c9c5c7">[email&#160;protected]</span></a></li>
</ul>
</div>
<div class="col-md-6 col-sm-6">
<div class="social-links-footer">
<ul>
<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
<li><a href="#"><i class="fab fa-twitter"></i></a></li>
<li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
<li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
<li><a href="#"><i class="fab fa-instagram"></i></a></li>
<li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
</ul>
</div>
</div>
</div>
</div>
</div>
<div class="footer-second-row">
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-6 col-sm-6">
<div class="second-row-item">
<h4>Categories</h4>
<sql:query dataSource="${db}" var="category">
    SELECT * FROM `categories` 
</sql:query>
<ul>
    <c:forEach items="${category.rows}" var="category_list">
        <li><a href="category.jsp?category_id=${category_list.category_id}">${category_list.category_name}</a></li>

    </c:forEach>

</ul>
</div>
</div>
<div class="col-lg-3 col-md-6 col-sm-6">
<div class="second-row-item">
<h4>Useful Links</h4>
<ul>

<li><a href="contact_us.jsp">Contact Us</a></li>
</ul>
</div>
</div>
<div class="col-lg-3 col-md-6 col-sm-6">
<div class="second-row-item">
<h4>Top Cities</h4>
<sql:query dataSource="${db}" var="city">
    SELECT * FROM `city` 
</sql:query>
    
<ul>
    <c:forEach items="${city.rows}" var="city_list">
        <li><a href="">${city_list.city}</a></li>
    </c:forEach>

</ul>
</div>
</div>
<div class="col-lg-3 col-md-6 col-sm-6">
<div class="second-row-item-app">
<h4>Download App</h4>
<ul>
<li><a href="#"><img class="download-btn" src="images/download-1.svg" alt=""></a></li>
<li><a href="#"><img class="download-btn" src="images/download-2.svg" alt=""></a></li>
</ul>
</div>
<div class="second-row-item-payment">
<h4>Payment Method</h4>
<div class="footer-payments">
<ul id="paypal-gateway" class="financial-institutes">
<li class="financial-institutes__logo">
<img alt="Visa" title="Visa" src="images/footer-icons/pyicon-6.svg">
</li>
<li class="financial-institutes__logo">
<img alt="Visa" title="Visa" src="images/footer-icons/pyicon-1.svg">
</li>
<li class="financial-institutes__logo">
<img alt="MasterCard" title="MasterCard" src="images/footer-icons/pyicon-2.svg">
</li>
<li class="financial-institutes__logo">
<img alt="American Express" title="American Express" src="images/footer-icons/pyicon-3.svg">
</li>
<li class="financial-institutes__logo">
<img alt="Discover" title="Discover" src="images/footer-icons/pyicon-4.svg">
</li>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="footer-last-row">
<div class="container">
<div class="row">
<div class="col-md-12">
<div class="copyright-text">
<i class="uil uil-copyright"></i>Copyright 2022 <b>Gambolthemes</b> . All rights reserved
</div>
</div>
</div>
</div>
</div>
</footer>


<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="js/jquery-3.3.1.min.js"></script>
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