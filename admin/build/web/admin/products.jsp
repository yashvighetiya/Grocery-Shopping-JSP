<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<jsp:include page="admin_header.jsp"/>
<div id="layoutSidenav_content">
    <main>
        <c:set value="select * from gambo_products" var="select_query_product" scope="session"/>

        <div class="container-fluid">
            <h2 class="mt-30 page-title">Products</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active">Products</li>
            </ol>
            <div class="row justify-content-between">
                <div class="col-lg-12">
                    <a href="add_product.jsp" class="add-btn hover-btn">Add New</a>
                </div>
                <div class="col-lg-5 col-md-6">
                    <form method="post">
                    <div class="bulk-section mt-30">
                        <div class="search-by-name-input">
                            <input type="search" class="form-control" placeholder="Search Category" name="category_name">
                        </div>
                        <div class="input-group">
                            <c:set value="disabled" var="disability"/>
                                <c:if test="${param.login_now.equals('Search Category')}">
                                    <c:set value="${param.category_name}" var="select_query1" scope="session"/>
                                    <c:set value="" var="disability"/>
                                </c:if>
                            <c:if test="${param.login_now.equals('see all')}">
                                <c:remove var="select_query1" scope="session"/>
                                <c:set value="disabled" var="disability"/>
                                </c:if>
                            <div class="input-group-append">
                                <button class="status-btn hover-btn" type="submit" name="login_now" value="Search Category">Search Category</button>
                                <button class="status-btn hover-btn" type="submit" name="login_now" value="see all" ${disability}>See All</button>
                            </div>
                           
                        </div>
                    </div>
                    </form>
                </div>
                <div class="col-lg-12 col-md-12">
                    <div class="card card-static-2 mt-30 mb-30">
                        <div class="card-title-2">
                            <h4>All Products</h4>
                        </div>
                        <div class="card-body-table">
                            <div class="table-responsive">
                                <table class="table ucp-table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width:60px"><input type="checkbox" class="check-all"></th>
                                            <th style="width:60px">ID</th>
                                            <th style="width:100px">Image</th>
                                            <th>Name</th>
                                            <th>Category</th>
                                            <th>Stock (in kg)</th>
                                             <th>Selling</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody><c:choose>
                                            <c:when test="${select_query1 != null}">
                                                <c:catch var="exception">
                                                    <sql:query var="product_list" dataSource="${db}">
                                                        SELECT * FROM `gambo_products` WHERE `product_name` LIKE '%${select_query1}%';
                                                    </sql:query>
                                                      
                                                </c:catch>
                                                       
                                                <c:if test = "${exception != null}"> 
                                                    <c:set value="Opps! Some Error occured" var="toast_message" scope="session"/>
                                                 </c:if>
                                               
                                            </c:when>
                                            <c:otherwise>
                                                <sql:query var="product_list" dataSource="${db}">
                                                    <c:out value="${select_query_product}"/>
                                                </sql:query>
                                            </c:otherwise>
                                        </c:choose>
                                         
                                        <c:forEach items="${product_list.rows}" var="pro">
                                            <tr>
                                                <td><input type="checkbox" class="check-item" name="ids[]" value="1"></td>
                                                <td>${pro.product_id}</td>
                                                <td>
                                                    <div class="cate-img-5">
                                                        <img src="${pro.product_image}" alt="">
                                                    </div>
                                                </td>
                                                <td>${pro.product_name}</td>
                                                <sql:query var="category_name" dataSource="${db}">
                                                    select category_name from categories where category_id=${pro.product_category_id}
                                                </sql:query>
                                                <c:forEach items="${category_name.rows}" var="category_name">
                                                    <td>${category_name.category_name}</td>
                                                </c:forEach>
                                                <td><c:choose>
                                                        <c:when test="${pro.product_stock <= 250}">
                                                            <div style="color:red"><b>Only ${pro.product_stock}</b></div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${pro.product_stock}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${pro.product_selling}</td>
                                                <td class="action-btns">
                                                    <a href="product_view.jsp?product_id=${pro.product_id}" class="view-shop-btn" title="View"><i class="fas fa-eye"></i></a>
                                                    <a href="edit_product.jsp?product_id=${pro.product_id}" class="edit-btn" title="Edit"><i class="fas fa-edit"></i></a>
                                                    <a href="delete_product.jsp?product_id=${pro.product_id}" class="delete-btn" title="Delete" onclick="return confirm('Do You Really Want to perform Delete Operation?')"><i class="fas fa-trash-alt"></i></a>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="admin_footer.jsp"/>
</div>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
