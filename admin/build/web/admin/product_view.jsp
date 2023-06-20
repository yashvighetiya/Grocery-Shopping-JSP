<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<jsp:include page="admin_header.jsp"/>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Shops</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="shops.jsp">Shops</a></li>
                <li class="breadcrumb-item active">Shop view</li>
            </ol>
            <c:catch var="exception">
                <sql:query var="product_list" dataSource="${db}">
                    SELECT * FROM `gambo_products` WHERE `product_id`='${param.product_id}';
                </sql:query>

            </c:catch>

            <c:if test = "${exception != null}"> 
                <c:set value="Opps! Some Error occured" var="toast_message" scope="session"/>
            </c:if>
            <c:forEach items="${product_list.rows}" var="selected_product">
            <div class="row">
                <div class="col-lg-5 col-md-6">
                    <div class="card card-static-2 mb-30">
                        <div class="card-body-table">
                            <div class="shopowner-content-left text-center pd-20">
                                <div class="shop_img">
                                    <img src="${selected_product.product_image}" alt="">
                                </div>
                                <ul class="product-dt-purchases">
                                    <li>
                                        <div class="product-status">
                                            Selling <span class="badge-item-2 badge-status">${selected_product.product_selling}</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="product-status">
                                           Discount <span class="badge-item-2 badge-status">${selected_product.product_discount} %</span>
                                        </div>
                                    </li>
                                </ul>
                                <div class="shopowner-dts">
                                    <div class="shopowner-dt-list">
                                        <span class="left-dt">Price</span>
                                        <span class="right-dt">Rs ${selected_product.product_price} /kg</span>
                                    </div>
                                    <div class="shopowner-dt-list">
                                        <span class="left-dt">Stock</span>
                                        <span class="right-dt">${selected_product.product_stock}</span>
                                    </div>
                                    <div class="shopowner-dt-list">
                                        <span class="left-dt">Selling</span>
                                        <span class="right-dt">${selected_product.product_selling}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </main>
    <jsp:include page="admin_footer.jsp"/>
</div>

<script src="js/jquery-3.4.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
