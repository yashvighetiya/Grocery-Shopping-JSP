<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<!DOCTYPE html>
<html lang="en">
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
            var v;
            function myfunction(id, parameter, operation, user_name)
            {

                 v = document.getElementById("quantity" + id).value;
                 
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
                //document.getElementById("mytext").value = "My value";
                document.getElementById("quantity"+id).value = v;
                var url = "update_cart_quantity.jsp?quantity=" + v + "&product_name=" + parameter + "&user_name1=" + user_name;

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
//                            var val = request.responseText;
//                             document.getElementById("amit" + id).innerHTML = val;
                             let abcd = request.responseText;
                             let text = abcd.toString();
                            let result = text.includes("helloo");
                            // alert(abcd);
                            
                             if(result == true)
                             {
                                   v--;
                                 document.getElementById("quantity"+id).value = v;
                                 
                             }
                             else
                             {
                                document.getElementById("amit" + id).innerHTML = text;
                             }
                          
//                            var str = val.charAt(val.length - 1);
//                            document.getElementById("amit" + id).innerHTML = str;
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
    <body>



        <%-- cart code start--%> 
        <c:set value="0" var="i"/>
        <sql:query var="select_cart" dataSource="${db}">
            SELECT * FROM `cart` WHERE `user_name`='${user_name}';
        </sql:query>

        <c:choose>
           
            <c:when test="${select_cart.rowCount > 0}">
                <c:set value="${select_cart.rowCount}" var="as"/>



                <div class="bs-canvas bs-canvas-left position-fixed bg-cart h-100">
                    <div class="bs-canvas-header side-cart-header p-3 ">
                        <div class="d-inline-block  main-cart-title">My Cart <span>(${select_cart.rowCount} Items)</span></div>
                        <button type="button" class="bs-canvas-close close" aria-label="Close"><i class="uil uil-multiply"></i></button>
                    </div>
                    <div class="bs-canvas-body">
                        <div class="cart-top-total">
                            <div class="cart-total-dil">
                                 <sql:query var="wallet_details" dataSource="${db}">
                              SELECT * FROM `gambo_wallet_details`
                                </sql:query>
                              <h4>Balance Of Rupees <b><font color="orange"> Rs ${wallet_details.rows[0].get_Rs}</font></b> On Purchase of <b><font color="orange"> Rs ${wallet_details.rows[0].on_purchase_of_or_more_than}</font></b> </h4>

                            </div>
                            <div class="cart-total-dil pt-2">
                                <h4>Delivery Charges</h4>
                                 <sql:query var="delivery_charges" dataSource="${db}">
                                 SELECT * FROM `delivery_charges_detail`
                                </sql:query>
                                 <c:forEach items="${delivery_charges.rows}" var="delivery_price">
                                <span>Rs ${delivery_price.Delivery_charge}</span>
                                 </c:forEach>
                            </div>
                        </div>
                        <div class="side-cart-items">
                            <c:set var="total" value="0"/>
                            <c:forEach items="${select_cart.rows}" var="items_cart">
                                <sql:query var="product_selection" dataSource="${db}">
                                    SELECT * FROM `gambo_products` WHERE `product_name`='${items_cart.user_products}'
                                </sql:query>
                                <c:forEach items="${product_selection.rows}" var="product_cart">
                                    <c:choose>
                                    <c:when test="${product_cart.product_stock == 0}">
                                         <sql:update dataSource="${db}" var="update_product_table">
                                        UPDATE `cart` SET `quantity`='1' WHERE `user_products`='${product_cart.product_name}'            
                                         </sql:update>
                                           <div class="cart-item" style="background-color:#ff7f7f">
                                        <div class="cart-product-img">
                                            <img src="${product_cart.product_image}" alt="">
                                            <c:if test="${product_cart.product_discount != 0}">
                                                <div class="offer-badge">${product_cart.product_discount}% OFF</div>

                                            </c:if>
                                        </div>
                                        
                                        <div class="cart-text">
                                            <h4>${product_cart.product_name}</h4>
                                            <h5>Out Of Stock</h5>
                                            
                                            <a href="remove_product_cart.jsp?remove_pro=${product_cart.product_name}" class="cart-close-btn"><i class="uil uil-multiply"></i></a>
                                        </div>
                                    </div>
                                    </c:when>
                                    <c:otherwise>
                                         <div class="cart-item">
                                        <div class="cart-product-img">
                                            <img src="${product_cart.product_image}" alt="">
                                            <c:if test="${product_cart.product_discount != 0}">
                                                <div class="offer-badge">${product_cart.product_discount}% OFF</div>

                                            </c:if>


                                        </div>
                                        <c:set value="${(product_cart.product_price - ( (product_cart.product_discount * product_cart.product_price)/100 )) * items_cart.quantity}" var="pro_price"/>
                                        <c:set value="${total + pro_price}" var="total"/>
                                        <div class="cart-text">
                                            <h4>${product_cart.product_name}</h4>

                                            <div class="qty-group">
                                                <div class="quantity buttons_added">
                                                    <form name="vinform" method="post">
                                                        <input type="button" value="-" id="sub{items_cart.id}" class="minus minus-btn" onclick="myfunction(${items_cart.id}, '${product_cart.product_name}', 'sub', '${user_name}')">
                                                        <input type="number" readonly="" step='1' id="quantity${items_cart.id}" value="${items_cart.quantity}" class="input-text qty">
                                                        <input type="button" value="+" id="add{items_cart.id}" class="plus plus-btn" onclick="myfunction(${items_cart.id}, '${product_cart.product_name}', 'add', '${user_name}')">
                                                    </form>
                                                </div>

                                                <div class="cart-item-price" id="amit${items_cart.id}">

                                                    Rs ${(product_cart.product_price - ( (product_cart.product_discount * product_cart.product_price)/100 )) * items_cart.quantity} 
                                                </div>

                                            </div>
                                            <a href="remove_product_cart.jsp?remove_pro=${product_cart.product_name}" class="cart-close-btn"><i class="uil uil-multiply"></i></a>
                                        </div>
                                    </div>
                                    </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="bs-canvas-footer">
                        <div class="cart-total-dil saving-total ">
                            <sql:query var="delivery_charges" dataSource="${db}">
                                 SELECT * FROM `delivery_charges_detail`
                                </sql:query>
                                 <c:forEach items="${delivery_charges.rows}" var="delivery_price">
                            <h4>Delivery Free on Purchase of or more than </h4> <span> Rs ${delivery_price.on_price_less_then}</span>
                                 </c:forEach>
                        </div>
                        <div class="main-total-cart">
                            <h2>Total (Tax included)</h2><span id="total"><c:out value="Rs ${total}"/></span>
                        </div>
                        <div class="checkout-cart">
                            <form method="post">
                                <button name="empty_cart" value="empty_cart_clicked" onclick="return confirm('Do You Really Want to Empty Your Cart?')" class="cart-checkout-btn hover-btn">Empty Cart</button>
                            </form>
                            <c:if test="${param.empty_cart.equals('empty_cart_clicked')}">
                                <c:catch>
                                <sql:update dataSource="${db}" var="empty_cart_query">
                                    DELETE FROM `cart` WHERE `user_name`='${user_name}'
                                </sql:update>
                                </c:catch>
                                <c:if test="${empty_cart_query > 0}">
                                     <c:set var="toast_message" scope="session" value="Your Cart is Empty"/>
                                </c:if>
                            </c:if>
                            <a href="checkout.jsp" class="cart-checkout-btn hover-btn">Proceed to Checkout</a>
                        </div>
                    </div>
                </div>

            </c:when>
            <c:otherwise>

                <div class="bs-canvas bs-canvas-left position-fixed bg-cart h-100">
                    <div class="bs-canvas-header side-cart-header p-3 ">
                        <div class="d-inline-block  main-cart-title">My Cart <span>(0 Items)</span></div>
                        <button type="button" class="bs-canvas-close close" aria-label="Close"><i class="uil uil-multiply"></i></button>
                    </div>
                    <div class="bs-canvas-body">
                        <div class="cart-top-total">
                            <div class="cart-total-dil">
                                 <sql:query var="wallet_details" dataSource="${db}">
                              SELECT * FROM `gambo_wallet_details`
                                </sql:query>
                              <h5>Balance Of Rupees <b><font color="orange">Rs ${wallet_details.rows[0].get_Rs} </font></b>On Purchase of <b><font color="orange">Rs ${wallet_details.rows[0].on_purchase_of_or_more_than}</font></b> </h5>

                            </div>
                            <div class="cart-total-dil pt-2">
                                 <h4>Delivery Charges</h4>
                                 <sql:query var="delivery_charges" dataSource="${db}">
                                 SELECT * FROM `delivery_charges_detail`
                                </sql:query>
                                 <c:forEach items="${delivery_charges.rows}" var="delivery_price">
                                <span>Rs ${delivery_price.Delivery_charge}</span>
                                 </c:forEach>
                            </div>
                        </div><center><br><br><br><br><br><br>
                            <div class="side-cart-items">
                                <b><b> YOUR  CART IS EMPTY</b></b><br><br>
                                Products In Your WishList Is Waiting To Be Yours!
                            </div></center>
                    </div>
                    <div class="bs-canvas-footer">
 <div class="cart-total-dil saving-total ">
                            <sql:query var="delivery_charges" dataSource="${db}">
                                 SELECT * FROM `delivery_charges_detail`
                                </sql:query>
                                 <c:forEach items="${delivery_charges.rows}" var="delivery_price">
                            <h4>Delivery Free on purchase of or more than </h4> <span> Rs ${delivery_price.on_price_less_then}</span>
                                 </c:forEach>
                        </div>
                        <div class="checkout-cart">
                           
                            <a href="" class="cart-checkout-btn hover-btn">Hurry Fill Your Cart And Grab Offers And Be Our Happy Customer</a>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

        <%-- cart code end--%>  


        <header class="header clearfix">
            <div class="top-header-group">
                <div class="top-header">
                    <div class="res_main_logo">
                        <a href="index.jsp"><img src="images/dark-logo-1.svg" alt=""></a>
                    </div>
                    <div class="main_logo" id="logo">
                        <a href="index.jsp"><img src="images/logo.svg" alt=""></a>
                        <a href="index.jsp"><img class="logo-inverse" src="images/dark-logo.svg" alt=""></a>
                    </div>


                    <div class="header_right">
                        <ul>
                          
                            <c:if test="${user_name != null}">
                                <li>
                                    <a href="dashboard_my_wishlist.jsp" class="option_links" title="Wishlist"><i class='uil uil-heart icon_wishlist'></i></a>
                                </li>
                            </c:if>
                            <li class="ui dropdown">
                                <a href="#" class="opts_account">
                                    <img src="images/avatar/img-5.jpg" alt="">
                                    <span class="user__name"><c:choose>
                                            <c:when test="${user_name == null}">Setting</c:when>

                                            <c:otherwise>${user_name}</c:otherwise>
                                        </c:choose></span>
                                    <i class="uil uil-angle-down"></i>
                                </a>
                                <div class="menu dropdown_account">
                                    <div class="night_mode_switch__btn">
                                        <a href="" id="night-mode" class="btn-night-mode">
                                            <i class="uil uil-moon"></i> Night mode
                                            <span class="btn-night-mode-switch">
                                                <span class="uk-switch-button"></span>
                                            </span>
                                        </a>
                                    </div>
                                    <a href="sign_in.jsp" class="item channel_item"><i class="uil uil-box icon__1"></i>Sign In</a>
                                        
                                    <c:if test="${user_name != null}">
                                        <a href="dashboard.jsp" class="item channel_item"><i class="uil uil-box icon__1"></i>My Orders</a>
                                        <a href="dashboard_my_wishlist.jsp" class="item channel_item"><i class="uil uil-heart icon__1"></i>My Wishlist</a>
                                        <a href="dashboard_my_wallet.jsp" class="item channel_item"><i class="uil uil-usd-circle icon__1"></i>My Wallet</a>
                                        
                                        <a href="logout.jsp" class="item channel_item"><i class="uil uil-lock-alt icon__1"></i>Logout</a>
                                    </c:if>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="sub-header-group">
                <div class="sub-header">

                    <nav class="navbar navbar-expand-lg navbar-light py-3">
                        <div class="container-fluid">
                            <button class="navbar-toggler menu_toggle_btn" type="button" data-target="#navbarSupportedContent"><i class="uil uil-bars"></i></button>
                            <div class="collapse navbar-collapse d-flex flex-column flex-lg-row flex-xl-row justify-content-lg-end bg-dark1 p-3 p-lg-0 mt1-5 mt-lg-0 mobileMenu" id="navbarSupportedContent">
                                <ul class="navbar-nav main_nav align-self-stretch">
                                    <li class="nav-item"><a href="index.jsp" class="nav-link active" title="Home">Home</a></li>
                                    <li class="nav-item"><a href="new_products.jsp" class="nav-link new_item" title="New Products">New Products</a></li>
                                    <li class="nav-item"><a href="featured_products.jsp" class="nav-link" title="Featured Products">Featured Products</a></li>
                                    <li class="nav-item">
                                        <div class="ui icon top left dropdown nav__menu">
                                            <a class="nav-link" title="Pages">Pages <i class="uil uil-angle-down"></i></a>
                                            <div class="menu dropdown_page">
                                              
                                               
                                                <a href="sign_in.jsp" class="item channel_item page__links">Sign In</a>
                                                <a href="sign_up1.jsp" class="item channel_item page__links">Sign Up</a>
                                                <a href="sign_up1.jsp?forgot_pass=yes" class="item channel_item page__links">Forgot Password</a>
                                                <a href="contact_us.jsp?link=used" class="item channel_item page__links">Contact Us</a>
                                            </div>
                                        </div>
                                    </li>
                                    
                                    <li class="nav-item"><a href="contact_us.jsp?link=used" class="nav-link" title="Contact">Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                    <div class="catey__icon">
                        <a href="#" class="cate__btn" data-toggle="modal" data-target="#category_model" title="Categories"><i class="uil uil-apps"></i></a>
                    </div>
                    <div class="header_cart order-1"> <c:choose >
                            <c:when test="${user_name != null}">
                                <a href="#" class="cart__btn hover-btn pull-bs-canvas-left" title="Cart"/>
                            </c:when>
                            <c:otherwise>
                                <a href="sign_in.jsp" class="cart__btn hover-btn" title="Cart"/>
                            </c:otherwise>
                        </c:choose><i class="uil uil-shopping-cart-alt"></i><span>Cart</span><i class="uil uil-angle-down"></i></a>
                    </div>
                    <div class="search__icon order-1">
                        <a href="#" class="search__btn hover-btn" data-toggle="modal" data-target="#search_model" title="Search"><i class="uil uil-search"></i></a>
                    </div>
                </div>
            </div>
        </header>

        <c:if test="${toast_message != null}">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>var message = '${toast_message}';
                                                            toastr.info(message);
            </script>
            <c:remove var="toast_message" scope="session"/>
        </c:if>