<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:if test="${user_name ==  null}">
    <c:redirect url="index.jsp"/>
</c:if>
<head>
    <style>
.button {
  background-color: orange; 
  border: none;
  color: white;
  padding: 5px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 4px 2px;
  cursor: pointer;
}


.button3 {border-radius: 8px;}
</style>
</head>
<jsp:include page="header.jsp"/>


<div class="wrapper">
    <div class="gambo-Breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">User Dashboard</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="dashboard-group">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="user-dt">
                        <div class="user-img">
                            <img src="images/avatar/img-5.jpg" alt="">
                            <div class="img-add">
                                <input type="file" id="file">
                                </div>
                        </div>
                         <sql:query dataSource="${db}" var="user_detail">
        SELECT * FROM `users` WHERE `user_name`='${user_name}'
    </sql:query>
                        <h4>${user_detail.rows[0].user_name}</h4>
                        <p>+91${user_detail.rows[0].user_contact}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4">
                    <div class="left-side-tabs">
                        <div class="dashboard-left-links">
                            <a href="dashboard.jsp" class="user-item"><i class="uil uil-box"></i>My Orders</a>
<a href="dashboard_my_cancel_orders.jsp" class="user-item"><i class="uil uil-wallet"></i>My Canceled Orders</a>
                            <a href="dashboard_my_wallet.jsp" class="user-item"><i class="uil uil-wallet"></i>My Wallet</a>
                            <a href="dashboard_my_wishlist.jsp" class="user-item active"><i class="uil uil-heart"></i>Shopping Wishlist</a>
                            <a href="logout.jsp" class="user-item"><i class="uil uil-exit"></i>Logout</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8">
                    <div class="dashboard-right">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="main-title-tab">
                                    <h4><i class="uil uil-heart"></i>Shopping Wishlist</h4> 
    
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="pdpt-bg">
                                    <div class="wishlist-body-dtt">
                                        <c:if test="${param.product_name != null}">
                                            <sql:update dataSource="${db}" var="remove_wislist">
                                                DELETE FROM `wishlist` WHERE `user_name`='${user_name}' AND `wishlist_product`='${param.product_name}'
                                            </sql:update>
                                                <c:if test="${remove_wislist > 0}">
                                                   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
                                                    <script>toastr.info('${param.product_name} Removed From wishlist');
                                                    </script>
                                                </c:if>
                                                              
                                                                 </c:if>    
                                        <sql:query dataSource="${db}" var="wishlist">
                                            SELECT * FROM `wishlist` WHERE `user_name`='${user_name}'
                                        </sql:query>
                                        <c:forEach items="${wishlist.rows}" var="wishlist_pro">
                                            <sql:query dataSource="${db}" var="products">
                                                SELECT * FROM `gambo_products` WHERE `product_name`='${wishlist_pro.wishlist_product}'
                                            </sql:query>
                                            <div class="cart-item">
                                                <div class="cart-product-img">
                                                    <img src="${products.rows[0].product_image}" alt="">
                                                    <c:if test="${products.rows[0].product_discount > 0}">
                                                        <div class="offer-badge">${products.rows[0].product_discount}% OFF</div>
                                                    </c:if>

                                                </div>
                                                <div class="cart-text">
                                                    <h4>${wishlist_pro.wishlist_product}</h4>
                                                    <c:choose>
                                                        <c:when test="${products.rows[0].product_discount == 0}">
                                                         
                                                             <div class="cart-item-price">   Rs ${products.rows[0].product_price} /kg</div>
                                                        </c:when>
                                                        <c:otherwise>
                                                               <div class="cart-item-price"> Rs ${products.rows[0].product_price - ( (products.rows[0].product_discount * products.rows[0].product_price)/100 )} /kg
                                                            <span>Rs ${products.rows[0].product_price} /kg</span></div>

                                                        </c:otherwise>
                                                    </c:choose> 
                                                             <form method="post">
                                                                      <button type="submit"  class="cart-close-btn" name="product_name" value="${wishlist_pro.wishlist_product}"><i class="uil uil-trash-alt"></i></button>
                                                             </form>
                                                          
                                                </div>
                                                               <span class="cart-icon"><a style="${cart_disable}" href="cart.jsp?proname_addtocart=${wishlist_pro.wishlist_product}&pageurl=dashboard_my_wishlist.jsp" class="uil uil-shopping-cart-alt"></a></span>
                             
                                            </div>
                                                     
                                        </c:forEach>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
 

<jsp:include page="footer.jsp"/>