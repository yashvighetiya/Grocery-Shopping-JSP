<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<jsp:include page="header.jsp"/>


<div class="wrapper">
    <div class="gambo-Breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Featured Products</li>
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
                    <div class="product-top-dt">
                        <div class="product-left-title">
                            <h2>Featured Products</h2>
                        </div>

                    </div>
                </div>
            </div>

            <sql:query dataSource="${db}" var="new_products">
             SELECT * FROM `gambo_products` ORDER BY product_selling DESC LIMIT 8;
                        
            </sql:query>

           <div class="product-list-view">
                <div class="row">
                    <c:forEach var="new_pro" items="${new_products.rows}">
                        <div class="col-lg-3 col-md-6">
                            <div class="product-item mb-30">
                                <a href="single_product_view.jsp?pro_name=${new_pro.product_name}" class="product-img">
                                    <img src="${new_pro.product_image}" alt="">
                                    <div class="product-absolute-options">
                                        <span class="offer-badge-1">NEW 
                                            <c:if test="${new_pro.product_discount > 0}">

                                                ${new_pro.product_discount}% OFF

                                            </c:if>
                                        </span>
                                        <span class="like-icon" title="wishlist" onclick="myfunctionwishlist('${new_pro.product_name}')"></span>
                                           
                                    </div>
                                </a>
                                <div class="product-text-dt">
                                    <p>
                                        <span>(
                                            <c:choose>
                                                <c:when test="${new_pro.product_stock > 0}">
                                                    In Stock
                                                </c:when>
                                                <c:otherwise>
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
                                            <span class="cart-icon"><a style="" href="cart.jsp?proname_addtocart=${new_pro.product_name}&pageurl=new_products.jsp" class="uil uil-shopping-cart-alt"></a></span>
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