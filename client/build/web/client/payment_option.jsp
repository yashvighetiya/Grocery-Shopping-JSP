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
    <title>Gambo - Payment Option</title>

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
</head><center> <BR><BR><BR><BR><BR><BR><BR>
    <div class="checkout-step-body">
        <div class="payment_method-checkout">
            <div class="row">
                <div class="col-md-12">
                    <form method="post"> 
                        <div class="rpt100">
                             <sql:query  dataSource="${db}" var="balance_detail">
                                         SELECT * FROM `gambo_wallet_details` 
                                       </sql:query>
                            <c:if test="${grand_total >= balance_detail.rows[0].used_on_purchase_of}">
                            
                                    <div class="radio-item_1">
                                       <sql:query  dataSource="${db}" var="client_balance">
                                           SELECT * FROM `client_wallet` WHERE `user_name`='${user_name}'
                                       </sql:query>
                                          
                                       <c:set value="${(balance_detail.rows[0].per_can_be_used * (client_balance.rows[0].balance))/100}" var="balance_to_use" scope="session"/>
                                           <label  class="radio-label_1"><b>Use Wallet Balance of Rs ${balance_to_use}</b></label>
                                       <label for="balance1" class="radio-label_1">  <input id="balance1" value="wallet_balance" name="wallet" type="checkbox">    <font color="orange"><b>Use Balance From Wallet</b></font></label>
                                     <br><br>
                                <hr>
                                   </div>
                            </c:if>
                            <ul class="radio--group-inline-container_1">
                                
                               
                                <li>
                                    <div class="radio-item_1">
                                        <input id="cashondelivery1" value="Cash On Delivery" name="paymentmethod" type="radio">
                                        <label for="cashondelivery1" class="radio-label_1">Cash on Delivery</label>
                                    </div>
                                </li><BR> <br><div>(Cash on Delivery will not be available if your order value exceeds Rs 1000)</div><BR><BR>
                                <li>
                                    <div class="radio-item_1">
                                        <input id="card1" value="Card" name="paymentmethod" type="radio">
                                        <label for="card1" class="radio-label_1">Credit / Debit Card</label>
                                    </div>
                                </li>
                            </ul>

                        </div>
                        <c:if test="${param.place_order.equals('Place Order')}">
                            <c:choose>
                            <c:when test="${param.paymentmethod == null}">
                                <c:set value="Please Select Payment Method" var="toast_message"/>
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
                                <script>var message = '${toast_message}';
                                        toastr.info(message);
                                </script>
                                <c:remove var="toast_message"/>
                            </c:when>
                                <c:otherwise>
                                 
                                        <c:if test="${param.paymentmethod.equals('Cash On Delivery')}">
                                            <c:choose>
                                                
                                                <c:when test="${grand_total > 1000}">
                                                     <c:set value="Cash on Delivery not available as your order value exceeds Rs 1000" var="toast_message"/>
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
                                <script>var message = '${toast_message}';
                                        toastr.info(message);
                                </script>
                                <c:remove var="toast_message"/>
                                                </c:when>
                                                <c:otherwise>
                                          
                                                    <c:redirect url="place_order.jsp?payment_method=Cash On Delivery&wallet_balance=${param.wallet}"/>
                                                </c:otherwise>
                                            </c:choose>
                                    </c:if>
                                     <c:if test="${param.paymentmethod.equals('Card')}">
                                          <c:redirect url="place_order.jsp?payment_method=Card&wallet_balance=${param.wallet}"/>
                                  
                                    </c:if>
                                       
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                        <input type="submit" class="next-btn16 hover-btn" name="place_order" value="Place Order">
                    </form>
                </div>
            </div>
        </div>
    </div>
</center>