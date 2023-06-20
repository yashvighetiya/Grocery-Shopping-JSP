
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<c:if test="${param.category_id == null}">

    <c:set var="toast_message" scope="session" value="Select Category to Edit"/>
    <c:redirect url="category.jsp"/>

</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<jsp:include page="admin_header.jsp"/>
<c:set scope="session" value="${param.category_id}" var="category_id"/>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Categories</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="category.jsp">Categories</a></li>
                <li class="breadcrumb-item active">Edit Category</li>
            </ol> <sql:query var="categories" dataSource="${db}">
                select * from categories where category_id=${param.category_id}
            </sql:query>
            <form action="" method="post">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="card card-static-2 mb-30">
                            <div class="card-title-2">
                                <h4>Edit New Category</h4>
                            </div>
                            <c:forEach items="${categories.rows}" var="category_list">
                                <div class="card-body-table">
                                    <div class="news-content-right pd-20">

                                        <div class="form-group">
                                            <label class="form-label">Name*</label>
                                            <input type="text" name="name1" class="form-control" placeholder="Category Name" value="${category_list.category_name}">
                                        </div>


                                        <input class="save-btn hover-btn" type="submit" name="next" value="Edit & Next">

                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </form>
            <c:if test="${param.next.equals('Edit & Next')}">
                <c:catch var="Exception">
                    <sql:update dataSource="${db}" var="category_edit">
                        UPDATE `categories` SET `category_name`='${param.name1}' WHERE `category_id`=${category_id}
                    </sql:update>
                    <c:if test="${category_edit == 1}">
                        <c:set var="toast_message" scope="session" value="Category Name successfully Edited"/>
                        <c:redirect url="edit_category1.jsp"/>
                    </c:if>
                </c:catch>
                <c:if test="${Exception != null}">
                    <c:set var="toast_message" scope="session" value="Opps! some error occured"/>
                </c:if>

            </c:if>
        </div>
    </main>

    <jsp:include page="admin_footer.jsp"/>
</div>

<script src="js/jquery-3.4.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
