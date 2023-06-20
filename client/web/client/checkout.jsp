<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
  <head>
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


        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, shrink-to-fit=9">
        <meta name="description" content="Gambolthemes">
        <meta name="author" content="Gambolthemes">
        <title>Gambo - Index</title>

        <link rel="icon" type="image/png" href="images/fav.png">

        <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>
        <link href="css/style.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href="css/night-mode.css" rel="stylesheet">

        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="vendor/semantic/semantic.min.css">

        <!--toast css file!-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
        <script>
            var request;
            function myfunction(id, parameter, operation, user_name)
            {

                var v = document.getElementById("quantity" + id).value;
                if (operation == 'add')
                {
                    v++;

                }
                if (operation == 'sub')
                {
                    if (v > 1)
                    {
                        v--;
                    }

                }
                var url = "update_cart_quantity.jsp?quantity=" + v + "&product_name=" + parameter + "&user_name1=" + user_name;

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
                            var val = request.responseText;
                            document.getElementById("amit" + id).innerHTML = val;
                            //
                            var request1;
                            mytotal();
                            function mytotal()
                            {


                                var url1 = "total.jsp";

                                if (window.XMLHttpRequest) {
                                    request1 = new XMLHttpRequest();
                                } else if (window.ActiveXObject) {
                                    request1 = new ActiveXObject("Microsoft.XMLHTTP");
                                }

                                try {
                                    request1.onreadystatechange = function () {
                                        if (request1.readyState == 4) {
                                            var val1 = request1.responseText;
                                            document.getElementById("total").innerHTML = val1;


                                        }
                                    };
                                    request1.open("GET", url1, true);
                                    request1.send();

                                } catch (e) {
                                    alert("Unable to connect to server");
                                }
                            }
                            //

                        }
                    };
                    request.open("GET", url, true);
                    request.send();

                } catch (e) {
                    alert("Unable to connect to server");
                }
            }


        </script>
    </head>

<div class="wrapper">
    <div class="gambo-Breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="all-product-grid">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-7">
                    <div id="checkout_wizard" class="checkout accordion left-chck145">
                        <div class="payment-secure">
                            <i class="uil uil-padlock"></i>Secure checkout
                        </div>
                        <a href="index.jsp" class="promo-link45">Go Back</a>
                        <a href="payment.jsp" class="promo-link45">Proceed for Payment</a>
                    <div class="checkout-safety-alerts">
                        <p><i class="uil uil-sync"></i>100% Replacement Guarantee</p>
                        <p><i class="uil uil-check-square"></i>100% Genuine Products</p>
                        <p><i class="uil uil-shield-check"></i>Secure Payments</p>
                    </div>
                    </div>
                </div>
            
                <div class="col-lg-4 col-md-5">
                    <div class="pdpt-bg mt-0">
                        <div class="pdpt-title">
                            <h4>Order Summary</h4>
                        </div>
                        <sql:query var="select_cart" dataSource="${db}">
                            SELECT * FROM `cart` WHERE `user_name`='${user_name}';
                        </sql:query>
                        <c:set var="total" value="0"/>
                        <c:if test="${select_cart.rowCount > 0}">
                            <c:set var="total" value="0"/>
                            <c:set var="total_saving" value="0"/>
                            <c:forEach items="${select_cart.rows}" var="items_cart">
                                <sql:query var="product_selection" dataSource="${db}">
                                    SELECT * FROM `gambo_products` WHERE `product_name`='${items_cart.user_products}'
                                </sql:query>
                                <c:forEach items="${product_selection.rows}" var="product_cart">
                                    <c:if test="${product_cart.product_stock > 0}"> 
                                    <c:set value="${(product_cart.product_price - ( (product_cart.product_discount * product_cart.product_price)/100 )) * items_cart.quantity}" var="pro_price"/>
                                    <c:set value="${total + pro_price}" var="total"/>
                                    <c:if test="${product_cart.product_discount > 0}">
                                        <c:set var="total_saving" value="${total_saving + (((product_cart.product_price * product_cart.product_discount)/100)* items_cart.quantity)}"/> 
                                    </c:if>
                                    <div class="right-cart-dt-body">
                                        <div class="cart-item border_radius">
                                            <div class="cart-product-img">
                                                <img src="${product_cart.product_image}" alt="">
                                                <div class="offer-badge"><c:if test="${product_cart.product_discount > 0}">${product_cart.product_discount}% OFF</c:if></div>
                                                </div>
                                                <div class="cart-text">
                                                    <h4>${product_cart.product_name} (${items_cart.quantity} Items)</h4>
                                                <div class="cart-item-price">Rs ${pro_price} <span><c:if test="${product_cart.product_discount > 0}">Rs ${product_cart.product_price * items_cart.quantity}</c:if></span></div>

                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </c:if>
                        <div class="total-checkout-group">

                            <div class="cart-total-dil pt-3">
                                <h4>Delivery Charges</h4>
                                <c:choose>
                                    <c:when test="${total >= 2000}">
                                        <span>Rs 0</span>
                                        <sql:query var="delivery_charges" dataSource="${db}">
                                            SELECT * FROM `delivery_charges_detail`
                                        </sql:query>
                                        <c:forEach items="${delivery_charges.rows}" var="delivery_price">
                                            <c:set value="${delivery_price.Delivery_charge}" var="delivery_charges_saving"/>
                                               <c:remove var="delivery_charges_adding"/>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <sql:query var="delivery_charges" dataSource="${db}">
                                            SELECT * FROM `delivery_charges_detail`
                                        </sql:query>
                                        <c:forEach items="${delivery_charges.rows}" var="delivery_price">
                                            <span>Rs ${delivery_price.Delivery_charge}</span>
                                            <c:remove var="delivery_charges_saving"/>
                                             <c:set value="${delivery_price.Delivery_charge}" var="delivery_charges_adding"/>
                                     
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>


                            </div>
                        </div>
                        <div class="cart-total-dil saving-total ">
                            <h4>Total Saving</h4>
                            <span>Rs ${total_saving + delivery_charges_saving}</span>
                        </div>
                        <div class="main-total-cart">
                            <h2>Total</h2>
                            <c:set scope="session" value="${delivery_charges_adding+total}" var="grand_total"/>
                          
                            <span>Rs ${grand_total}</span>
                        </div>
                       
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>


                            <jsp:include page="footer.jsp"/>


<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="js/jquery-3.3.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/OwlCarousel/owl.carousel.js"></script>
<script src="vendor/semantic/semantic.min.js"></script>
<script src="js/custom.js"></script>
<script src="js/product.thumbnail.slider.js"></script>
<script src="js/offset_overlay.js"></script>
<script src="js/night-mode.js"></script>
</body>
</html>