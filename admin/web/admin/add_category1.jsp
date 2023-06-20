
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<c:if test="${category_name == null}">
     <c:set var="toast_message" scope="session" value="Add Category Name"/>
    <c:redirect url="add_category.jsp"/>
</c:if>
<jsp:include page="admin_header.jsp"/>


<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Categories</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="category.jsp">Categories</a></li>
                <li class="breadcrumb-item active">Add Category</li>
            </ol>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="card card-static-2 mb-30">
                        <div class="card-title-2">
                            <h4>Add New Category</h4>
                        </div>
                        <form method = "post" enctype="multipart/form-data" action="add_category2.jsp">
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
                                    <input type="submit" value="Add New Category" name="inserts" class="save-btn hover-btn">

                                    <!--<button class="save-btn hover-btn" type="submit">Add New Category</button>!-->
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
</body>
</html>
