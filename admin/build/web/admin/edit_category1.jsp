
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<c:if test="${category_id == null}">

    <c:set var="toast_message" scope="session" value="Select Category to Edit"/>
    <c:redirect url="category.jsp"/>

</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<jsp:include page="admin_header.jsp"/>


    
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Categories</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="category.jsp">Categories</a></li>
                <li class="breadcrumb-item active">Edit Category</li>
            </ol><c:catch var="Exception"> 
            <sql:query var="categories" dataSource="${db}">
                            select * from categories where category_id=${category_id}
                        </sql:query>
            </c:catch>
                        <c:if test="${Exception != null}">
                            <c:set var="toast_message" scope="session" value="Opps! some Exception occured"/>
                            <c:redirect url="category.jsp"/>
                        </c:if>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="card card-static-2 mb-30">
                        <div class="card-title-2">
                            <h4>Edit Category</h4>
                        </div>${cat_name}

 <c:forEach items="${categories.rows}" var="category_list">
                        <div class="card-body-table">
                            <div class="news-content-right pd-20">

                                <div class="form-group">
                                    <center> <label class="form-label">${category_list.category_name} Category Image</label>
                                        <form method="post">
                                        <div class="add-cate-img">
                                            <img src="${category_list.category_image_path}" alt="">
                                        </div>
                                        <input class="save-btn hover-btn" type="submit" name="edit" value="Save">
                                    
                                     </form><br><br>
                                     <c:if test="${param.edit.equals('Save')}">
                                       <c:set var="toast_message" scope="session" value="SuccessFully Edited"/>
                                       <c:remove var="category_id" scope="session"/>
                                         <c:redirect url="category.jsp"/>
                                     </c:if>
                                     <label class="form-label"><b>OR</b><br><br><br> Upload New Image For Category</label>
                                     <br><br>
                                       <form method = "post" enctype="multipart/form-data" action="edit_category2.jsp">
                                        <div class="input-group">
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" name="file">
                                                <label class="custom-file-label" for="inputGroupFile04">Choose Image</label>
                                            </div>
                                        </div>
                                        <input class="save-btn hover-btn" type="submit" name="upload_edit" value="Upload and Edit Category">
                                    </form>
                                     
                                   </center>
                                </div>


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
</body>
</html>
