<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<c:if test="${product_id == null}">
    <c:set var="toast_message" scope="session" value="Select Product to Edit"/>

    <c:redirect url="products.jsp"/>
</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<!--
!-->
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
 <sql:query var="products" dataSource="${db}">
   select product_image from gambo_products where product_id=${product_id}
</sql:query>
   <c:forEach items="${products.rows}" var="product_list">
<div class="card-body-table">
<div class="news-content-right pd-20"> 
    <center> <label class="form-label">${product_list.product_name} Product Image</label>
        <form method="post">
                                        <div class="add-cate-img">
                                            <img src="${product_list.product_image}" alt="">
                                        </div>
                                        <input class="save-btn hover-btn" type="submit" name="edit" value="Save & Next">
                                    
                                     </form><br><br>
                                     <c:if test="${param.edit.equals('Save & Next')}">
                                        <c:set var="toast_message" scope="session" value="Product Edited Successfully"/>

                                         <c:redirect url="products.jsp"/>
                                     </c:if>
                                     <label class="form-label"><b>OR</b><br><br><br> Upload New Image For Product</label>
                                     <br><br>
    <form method = "post" enctype="multipart/form-data" action="edit_product2.jsp">
 <div class="form-group">

<div class="input-group">
<div class="custom-file">
    
<input type="file" name="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04">

    
<label class="custom-file-label" for="inputGroupFile04">Choose Image</label>
</div>
</div>
    
<input name="add_new_product" value="Edit Product" class="save-btn hover-btn" type="submit">
</div>
        </form>
    </center>
</div>
   
</div>
   </c:forEach>
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


