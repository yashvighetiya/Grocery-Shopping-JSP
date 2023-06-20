<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<c:if test="${pro_name == null}">
    <c:set var="toast_message" scope="session" value="Fill all details to Add Products"/>

    <c:redirect url="add_product.jsp"/>
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
<li class="breadcrumb-item active">Add Product</li>
</ol>
<div class="row">
<div class="col-lg-6 col-md-6">
<div class="card card-static-2 mb-30">
<div class="card-title-2">
<h4>Add New Product</h4>
</div>
  <form method = "post" enctype="multipart/form-data" action="add_product2.jsp">
<div class="card-body-table">
<div class="news-content-right pd-20">
 <div class="form-group">
<label class="form-label">Category Image*</label>
<div class="input-group">
<div class="custom-file">
<input type="file" name="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04">
<label class="custom-file-label" for="inputGroupFile04">Choose Image</label>
</div>
</div>
</div>
    
<input name="add_new_product" value="Add New Product" class="save-btn hover-btn" type="submit">
</div>
</div>
    </form>
   
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


