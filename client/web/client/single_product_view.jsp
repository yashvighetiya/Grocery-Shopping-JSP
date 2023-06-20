<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<jsp:include page="header.jsp"/>
<sql:query dataSource="${db}" var="single_product">
    select * from gambo_products where product_name="${param.pro_name}"
</sql:query>
    <c:forEach items="${single_product.rows}" var="pro_info">
<div class="wrapper">
<div class="gambo-Breadcrumb">
<div class="container">
<div class="row">
<div class="col-md-12">
<nav aria-label="breadcrumb">
<ol class="breadcrumb">
<li class="breadcrumb-item"><a href="index.html">Home</a></li>

<li class="breadcrumb-item active" aria-current="page">Product Title</li>
</ol>
</nav>
</div>
</div>
</div>
</div>
<div class="all-product-grid">
<div class="container">
<div class="row">
<div class="col-lg-12">
<div class="product-dt-view">
<div class="row">
<div class="col-lg-4 col-md-4">
<div id="sync1" class="owl-carousel owl-theme">
<div class="item">
<img src="${pro_info.product_image}" alt="">
</div>
<div class="item">
<img src="${pro_info.product_image}" alt="">
</div>
<div class="item">
<img src="${pro_info.product_image}" alt="">
</div>
<div class="item">
<img src="${pro_info.product_image}" alt="">
</div>
</div>
<div id="sync2" class="owl-carousel owl-theme">
<div class="item">
<img src="${pro_info.product_image}" alt="">
</div>
<div class="item">
<img src="${pro_info.product_image}" alt="">
</div>
<div class="item">
<img src="${pro_info.product_image}" alt="">
</div>
<div class="item">
<img src="${pro_info.product_image}" alt="">
</div>
</div>
</div>
<div class="col-lg-8 col-md-8">
                                    <div class="product-dt-right">
                                        <h2>${pro_info.product_name}</h2>
                                        <div class="no-stock">
                                            <p class="pd-no">Product ID<span>${pro_info.product_id}</span></p>
                                            <p class="stock-qty">
                                                <span>(
                                                    <c:choose>
                                                        <c:when test="${pro_info.product_stock > 0}">

                                                            In Stock
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set value="disabled" var="cart_disable"/>
                                                            <font color="red">Out Of Stock </font>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    )
                                                </span>
                                            </p>
                                        </div>
                                        <div class="product-radio">
                                            <ul class="product-now">

                                                <li>
                                                    <input type="radio" id="p2" name="product1">
                                                    <label for="p2">1kg</label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="p3" name="product1">
                                                    <label for="p3">2kg</label>
                                                </li>
                                                <li>
                                                    <input type="radio" id="p4" name="product1">
                                                    <label for="p4">3kg</label>
                                                </li>
                                            </ul>
                                        </div>
                                            <p class="pp-descp">${pro_info.product_detail}</p>
                                        <div class="product-group-dt">
                                            <ul>
                                                <c:choose>
                                                    <c:when test="${pro_info.product_discount == 0}">
                                                        <li><div class="main-price color-discount">MRP Price<span>Rs ${pro_info.product_price} /kg</span></div></li> 
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li><div class="main-price color-discount">Discount Price<span>Rs ${pro_info.product_price - ( (pro_info.product_discount * pro_info.product_price)/100 )} /kg</span></div></li>
                                                        <li><div class="main-price mrp-price">MRP Price<span>Rs ${pro_info.product_price} /kg</span></div></li>

                                                        <%-- <span>${new_pro.product_price}</span>--%>
                                                    </c:otherwise>
                                                </c:choose>
                                                <%--
                                            <li><div class="main-price color-discount">Discount Price<span>$15</span></div></li>
                                            <li><div class="main-price mrp-price">MRP Price<span>$18</span></div></li>--%>
                                            </ul>
                                            <ul class="gty-wish-share">
                                                <b><i><u>ADD TO WISHLIST</u></i></b>

                                                <li><span class="like-icon" title="wishlist" onclick="myfunctionwishlist('${new_pro.product_name}')"></span>
                                        </li>
                                            </ul>
                                            <c:choose>
                                                <c:when test="${pro_info.product_stock > 0}">

                                                    <ul class="ordr-crt-share">
                                                        <li><a style="" href="cart.jsp?proname_addtocart=${pro_info.product_name}&pageurl=index.jsp" class="uil uil-shopping-cart-alt add-cart-btn hover-btn">Add to cart</a>
                                                        </li>
                                                    </ul>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div class="pdp-details">
                                            <ul>
                                                <li>
                                                    <div class="pdp-group-dt">
                                                        <div class="pdp-icon"><i class="uil uil-usd-circle"></i></div>
                                                        <div class="pdp-text-dt">
                                                            <span>Lowest Price Guaranteed</span>
                                                            <p>Get difference refunded if you find it cheaper anywhere else.</p>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="pdp-group-dt">
                                                        <div class="pdp-icon"><i class="uil uil-cloud-redo"></i></div>
                                                        <div class="pdp-text-dt">
                                                            <span>Easy Returns & Refunds</span>
                                                            <p>Return products at doorstep and get refund in seconds.</p>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
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
    </c:forEach>

<jsp:include page="footer.jsp"/>