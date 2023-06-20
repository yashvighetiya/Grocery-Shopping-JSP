
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<c:if test="${product_id == null}">
<c:if test="${param.product_id == null}">
    <c:set var="toast_message" scope="session" value="Select Product to Edit"/>
    <c:redirect url="products.jsp"/>
</c:if>
</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:catch var="exception">
<sql:query var="category_list" dataSource="${db}" >
    select * from categories
</sql:query>
</c:catch>
    <c:catch var="exception">
<sql:query var="product_select" dataSource="${db}">
    SELECT * FROM `gambo_products` WHERE `product_id`='${param.product_id}'
</sql:query>
    </c:catch>
<c:if test="${exception != null}">
    <c:set var="toast_message" scope="session" value="Opps! some error occured"/>
    <c:redirect url="products.jsp"/>
</c:if>
<jsp:include page="admin_header.jsp"/>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Products</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="products.jsp">Products</a></li>
                <li class="breadcrumb-item active">Edit Product</li>
            </ol>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="card card-static-2 mb-30">
                        <div class="card-title-2">
                            <h4>Edit Product</h4>
                        </div>
                        <form method="post">
                            <c:forEach items="${product_select.rows}" var="pro_info">

                                <c:set scope="session" value="${pro_info.product_id}" var="product_id"/>
                                <div class="card-body-table">
                                    <div class="news-content-right pd-20">
                                        <div class="form-group">
                                            <label class="form-label">Name*</label>
                                            <input type="text" class="form-control" required="required"  placeholder="Category Name" name="product_name" value="${pro_info.product_name}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Category*</label>
                                            <c:catch var="exception">
                                            <sql:query dataSource="${db}" var="category_select">
                                                select category_name from categories where category_id=${pro_info.product_category_id}
                                            </sql:query>
                                            </c:catch>
                                            <c:if test="${exception != null}">  
                                                 <c:set var="toast_message" scope="session" value="Opps! some Error occured"/>
                                                 <c:redirect url="products.jsp"/>
                                            </c:if>
                                            <c:set value="" var="selected"/>
                                            <c:forEach items="${category_select.rows}" var="category_selected">

                                                <c:set var="category_selected_name" value="${category_selected.category_name}"/> 
                                            </c:forEach>

                                            <select id="categtory" required="required"  name="category" class="form-control">

                                                <c:forEach items="${category_list.rows}" var="list">

                                                    <c:if test="${category_selected_name == list.category_name}">
                                                        <c:set value="selected" var="selected"/>
                                                    </c:if>
                                                    <option value="${list.category_id}" ${selected}>${list.category_name}</option>
                                                    <c:set value="" var="selected"/>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">MRP*</label>
                                            <input type="text" class="form-control" placeholder="$0" name="price" required="required" value="${pro_info.product_price}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Discount MRP</label>
                                            <input type="text" class="form-control" placeholder="$0" name="discount"  value="${pro_info.product_discount}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Description*</label>
                                            <div class="card card-editor">
                                                <div class="content-editor">

                                                    <textarea id="edit" required="required"  name="description">${pro_info.product_detail}</textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="form-label">Product Stock*</label>

                                            <input type="text" class="form-control" placeholder=" Eg. 350 " name="product_stock" required="required" value="${pro_info.product_stock}">
                                        </div>
                                        <input class="save-btn hover-btn" type="submit" value="Edit & Next" name="next">
                                    </div>
                                </div>
                            </c:forEach>
                        </form>
                        <c:if test="${param.next.equals('Edit & Next')}">
                            <c:choose>
                                <c:when test="${param.discount != ''}">
                                    <c:catch var="exception">
                                    <sql:update dataSource="${db}" var="i">
                                        UPDATE `gambo_products` SET `product_category_id`='${param.category}',`product_name`='${param.product_name}',`product_detail`='${param.description}',`product_discount`='${param.discount}',`product_price`='${param.price}',`product_stock`='${param.product_stock}' WHERE `product_id`='${product_id}'
                                    </sql:update>
                                    </c:catch>
                                        <c:if test="${exception != null}">  
                                                 <c:set var="toast_message" scope="session" value="Opps! some Error occured"/>
                                                 <c:redirect url="products.jsp"/>
                                            </c:if>
                                    <c:if test="${i == 1}">
                                         <c:set var="toast_message" scope="session" value="Product Edited successfully"/>
                                                
                                         <c:redirect url="edit_product1.jsp"/>
                                    </c:if>
                                   
                                </c:when>
                                <c:otherwise>
                                    <c:catch var="exception">
                                    <sql:update dataSource="${db}" >
                                        UPDATE `gambo_products` SET `product_category_id`='${param.category}',`product_name`='${param.product_name}',`product_detail`='${param.description}',`product_price`='${param.price}',`product_stock`='${param.product_stock}' WHERE `product_id`='${product_id}'
                                    </sql:update>
                                    </c:catch>
                                        <c:if test="${exception != null}">  
                                                 <c:set var="toast_message" scope="session" value="Opps! some Error occured"/>
                                                 <c:redirect url="products.jsp"/>
                                            </c:if>
                                  <c:if test="${i == 1}">
                                         <c:set var="toast_message" scope="session" value="Opps! some Error occured"/>
                                                
                                         <c:redirect url="edit_product1.jsp"/>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
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

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/froala_editor.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/align.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/code_beautifier.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/code_view.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/colors.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/emoticons.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/draggable.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/font_size.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/font_family.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/image.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/file.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/image_manager.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/line_breaker.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/link.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/lists.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/paragraph_format.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/paragraph_style.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/video.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/table.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/url.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/entities.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/char_counter.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/inline_style.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/save.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/fullscreen.min.js"></script>
<script type="text/javascript" src="vendor/froala_editor_3.1.1/js/plugins/quote.min.js"></script>
<script>
    (function () {
        new FroalaEditor("#edit", {
            zIndex: 10
        })
    })()
</script>
</body>
</html>
