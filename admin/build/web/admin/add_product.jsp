<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:catch var="exception">
    <sql:query var="category_list" dataSource="${db}" >
        Select * from categories
    </sql:query>
</c:catch>
<c:if test="${exception != null}">
    <c:set var="toast_message" scope="session" value="Oops! some error occured"/>

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
                <li class="breadcrumb-item active">Add Product</li>
            </ol>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="card card-static-2 mb-30">
                        <div class="card-title-2">
                            <h4>Add New Product</h4>
                        </div>
                        <form method="post">
                            <div class="card-body-table">
                                <div class="news-content-right pd-20">
                                    <div class="form-group">
                                        <label class="form-label">Product Name*</label>
                                        <input type="text" class="form-control" placeholder="Product Name" name="product_name" required="required">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Product Category*</label>
                                        <select id="categtory" name="category" class="form-control" required="required">
                                            <option selected>--Select Category--</option>
                                            <c:forEach items="${category_list.rows}" var="list">
                                                <option value="${list.category_id}">${list.category_name}</option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Product MRP*</label>
                                        <input type="number" class="form-control" placeholder="150 for Rs 150" name="price" required="required">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Product Discount Percentage</label>
                                        <input type="number" class="form-control" placeholder="30 for 30%" name="discount">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Product Description*</label>
                                        <div class="card card-editor">
                                            <div class="content-editor">
                                                <textarea id="edit" name="description" required="required"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Product Stock*</label>
                                        <input type="number" class="form-control" placeholder=" Eg. 350 " name="product_stock" required="required">
                                    </div>
                                    <input name="add_new_product" value="Next" class="save-btn hover-btn" type="submit">
                                </div>
                            </div>
                        </form>
                        <c:if test="${param.add_new_product.equals('Next')}">

                            <c:set scope="session" value="${param.product_name}" var="pro_name" />
                            <c:set scope="session" value=" ${param.category}" var="pro_cat" />
                            <c:set scope="session" value="${param.price}" var="pro_price" />
                            <c:set scope="session" value="${param.product_stock}" var="pro_stock" />
                            <c:set scope="session" value="${param.description}" var="pro_detail" /> 
                            <c:if test="${param.discount != ''}">
                                <c:set scope="session" value="${param.discount}" var="pro_dis" />
                             </c:if>
                            <c:redirect url="add_product1.jsp"/>

                        </c:if>
                        <%--  <c:if test="${param.add_new_product.equals('Next')}">
                              <c:choose>
                              <c:when test="${param.product_name != '' && param.category != '' && param.price != '' && param.description != '' && param.product_stock != '' }">
                                  <c:choose>
                                      <c:when test="${param.discount != ''}">
                                        //Product NAme :  ${param.product_name}<br>
                               //stock :  ${param.product_stock}<br><br>
                              //category no : ${param.category}<br><br>
                             // price :  ${param.price}<br><br>
                              //discount :  ${param.discount}<br><br>
                              //detail :  ${param.description}<br><br>
                              <sql:update dataSource="${db}">
                                  INSERT INTO `gambo_products`(`product_category_id`, `product_name`, `product_detail`, `product_price`, `product_discount`, `product_stock`) VALUES ('${param.category}','${param.product_name}','${param.description}','${param.price}','${param.discount}','${param.product_stock}')
                              </sql:update>
                              <c:redirect url="add_product1.jsp">
                                  <c:set scope="session" value="${param.product_name}" var="new_product_name"/>
                              </c:redirect>
                                      </c:when>
                                      <c:otherwise>
                                       name :    ${param.product_name}<br>
                              stock :   ${param.product_stock}<br><br>
                              category no :  ${param.category}<br><br>
                              price :  ${param.price}<br><br>
                             
                               detail : ${param.description}<br><br>
                                <sql:update dataSource="${db}">
                                  INSERT INTO `gambo_products`(`product_category_id`, `product_name`, `product_detail`, `product_price`, `product_stock`) VALUES ('${param.category}','${param.product_name}','${param.description}','${param.price}','${param.product_stock}')
                              </sql:update>
                                  
                              <c:redirect url="add_product1.jsp">
                                  <c:set scope="session" value="${param.product_name}" var="new_product_name"/>
                              </c:redirect>
                                      </c:otherwise>
                                  </c:choose>
                                  
                               
                              </c:when>
                               
                              <c:otherwise>
                                  <script>
                                      alert("fill all details");
                                      </script>
                              </c:otherwise>
                              </c:choose>
                          </c:if>--%>
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
