<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<jsp:include page="header.jsp"/>
<c:remove var="forgotpass"/>
<div class="wrapper">


    <div class="section145">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="main-title-tt">
                        <div class="main-title-left">
                            <span>Shop By</span>
                            <h2>Categories</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="owl-carousel cate-slider">
                        <sql:query dataSource="${db}" var="category_show">
                            SELECT * FROM `categories`
                        </sql:query>
                            <c:forEach items="${category_show.rows}" var="category_list">
                            <div class="item">
                            <a href="category.jsp?category_id=${category_list.category_id}" class="category-item">
                                <div class="cate-img">
                                    <img src="${category_list.category_image_path}" alt="">
                                </div>
                                <h4> ${category_list.category_name}</h4>
                            </a>
                        </div>
                        </c:forEach>
                        
             <!--             <div class="item">
                            <a href="category.jsp?category_id=2" class="category-item">
                                <div class="cate-img">
                                    <img src="images/category/icon-3.svg" alt="">
                                </div>
                                <h4> Dairy Products </h4>
                            </a>
                        </div>
                      <div class="item">
                            <a href="#" class="category-item">
                                <div class="cate-img">
                                    <img src="images/category/icon-5.svg" alt="">
                                </div>
                                <h4> Nuts </h4>
                            </a>
                        </div>
                        <div class="item">
                            <a href="category.jsp?category_id=6" class="category-item">
                                <div class="cate-img">
                                    <img src="images/category/icon-1.svg" alt="">
                                </div>
                                <h4> Fruits </h4>
                            </a>
                        </div>
                        <div class="item">
                            <a href="category.jsp?category_id=3" class="category-item">
                                <div class="cate-img">
                                    <img src="images/category/icon-10.svg" alt="">
                                </div>
                                <h4> Non Veg </h4>
                            </a>
                        </div>
                        <div class="item">
                            <a href="#" class="category-item">
                                <div class="cate-img">
                                    <img src="images/category/icon-4.svg" alt="">
                                </div>
                                <h4> Beverages </h4>
                            </a>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>


  <div class="section145">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="main-title-tt">
                        <div class="main-title-left">
                            <span>For You</span>
                            <h2>Top Featured Products</h2>
                        </div>
                        <a href="featured_products.jsp" class="see-more-btn">See All</a>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="owl-carousel featured-slider owl-theme">
                     <sql:query dataSource="${db}" var="new_products">
                         SELECT * FROM `gambo_products` ORDER BY product_selling DESC LIMIT 5;
                           
                        </sql:query>
                        <c:forEach var="new_pro" items="${new_products.rows}">
                            <div class="item">
                                <div class="product-item">
                                    <a href="single_product_view.jsp?pro_name=${new_pro.product_name}" class="product-img">
                                        <img src="${new_pro.product_image}" alt="">
                                        <div class="product-absolute-options">
                                             <c:if test="${new_pro.product_discount != 0}"> <span class="offer-badge-1">${new_pro.product_discount}% OFF</span></c:if>
                                             <span class="like-icon" title="wishlist" onclick="myfunctionwishlist('${new_pro.product_name}')"></span>
                                            </div>
                                        </a>
                                        <div class="product-text-dt">

                                            <p>
                                            <span>(
                                                <c:choose>
                                                    <c:when test="${new_pro.product_stock > 0 }">
                                                         <c:set value="" var="cart_disable"/>
                                                        In Stock
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set value="pointer-events: none" var="cart_disable"/>
                                                        <font color="red">Out Of Stock </font>
                                                    </c:otherwise>
                                                </c:choose>)
                                            </span>
                                        </p>
                                        <h4>${new_pro.product_name}</h4>
                                        <div class="product-price">
                                             <c:choose>
                                                <c:when test="${new_pro.product_discount == 0}">
                                                    Rs ${new_pro.product_price} /kg

                                                </c:when>
                                                <c:otherwise>
                                                    Rs ${new_pro.product_price - ( (new_pro.product_discount * new_pro.product_price)/100 )} /kg
                                                    <span>Rs ${new_pro.product_price} /kg</span>
                                                    
                                                </c:otherwise>
                                            </c:choose>                                        
                                        </div>
                                        <c:choose>
                                        <c:when test="${new_pro.product_stock > 0 }">
                                            <span class="cart-icon"><a style="${cart_disable}" href="cart.jsp?proname_addtocart=${new_pro.product_name}&pageurl=index.jsp" class="uil uil-shopping-cart-alt"></a></span>
                                      </c:when>
                                      <c:otherwise>
                                      <br>
                                      </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>

                        </c:forEach> 
   
                </div>
            </div>
        </div>
    </div>


    




    <div class="section145">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="main-title-tt">
                        <div class="main-title-left">
                            <span>For You</span>
                            <h2>Added New Products</h2>
                        </div>
                        <a href="new_products.jsp" class="see-more-btn">See All</a>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="owl-carousel featured-slider owl-theme">
                       <sql:query dataSource="${db}" var="new_products">
                               SELECT * FROM `gambo_products` ORDER BY `product_id` DESC LIMIT 5;  
                        </sql:query>
                        <c:forEach var="new_pro" items="${new_products.rows}">
                            <div class="item">
                                <div class="product-item">
                                    <a href="single_product_view.jsp?pro_name=${new_pro.product_name}" class="product-img">
                                        <img src="${new_pro.product_image}" alt="">
                                        <div class="product-absolute-options">
                                            <span class="offer-badge-1">New <c:if test="${new_pro.product_discount != 0}">${new_pro.product_discount}% OFF</c:if></span>
                                               <span class="like-icon" title="wishlist" onclick="myfunctionwishlist('${new_pro.product_name}')"></span>
                                            </div>
                                        </a>
                                        <div class="product-text-dt">

                                            <p>
                                            <span>(
                                                <c:choose>
                                                    <c:when test="${new_pro.product_stock > 0 }">
                                                         <c:set value="" var="cart_disable"/>
                                                        In Stock
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set value="pointer-events: none" var="cart_disable"/>
                                                        <font color="red"><b>Out Of Stock </b></font>
                                                    </c:otherwise>
                                                </c:choose>)
                                            </span>
                                        </p>
                                        <h4>${new_pro.product_name}</h4>
                                        <div class="product-price">
                                            <c:choose>
                                                <c:when test="${new_pro.product_discount == 0}">
                                                    Rs ${new_pro.product_price} /kg

                                                </c:when>
                                                <c:otherwise>
                                                    Rs ${new_pro.product_price - ( (new_pro.product_discount * new_pro.product_price)/100 )} /kg
                                                    <span>Rs ${new_pro.product_price} /kg</span>
                                                    
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <c:choose>
                                        <c:when test="${new_pro.product_stock > 0 }">
                                            <span class="cart-icon"><a style="${cart_disable}" href="cart.jsp?proname_addtocart=${new_pro.product_name}&pageurl=index.jsp" class="uil uil-shopping-cart-alt"></a></span>
                                      </c:when>
                                      <c:otherwise>
                                      <br>
                                      </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>

                        </c:forEach> 

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

    <jsp:include page="footer.jsp"/>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
  <script>  
var request;  
function myfunctionwishlist(pro_name)  
{  
var url="wishlist_add.jsp?pro_name="+pro_name;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=function () {
                        if (request.readyState == 4) {
                        
            toastr.info('Product Added to wishlist');
           
          
                        }
                    };
                    request.open("GET", url, true);
                    request.send();

}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('amit').innerHTML=val;  
}  
}  
  
</script>