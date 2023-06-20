
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
<jsp:include page="admin_header.jsp"/>
<sql:query dataSource="${db}" var="delivery_charges">
    SELECT * FROM `gambo_wallet_details`
</sql:query>

<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Edit Wallet Details</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="category.jsp">Edit Wallet Details</a></li>
                <li class="breadcrumb-item active">Wallet Details</li>
            </ol>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="card card-static-2 mb-30">
                        <div class="card-title-2">
                            <h4>Edit Wallet Details</h4>
                        </div>
                        <form method = "post">
                            <div class="card-body-table">
                                <div class="news-content-right pd-20">
                                     <div class="form-group">
                                        <label class="form-label">Get Rupees</label>
                                        <input type="number" class="form-control" value="${delivery_charges.rows[0].get_Rs}" placeholder="Wallet Rupees" required="" name="get_rs">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Percentage Of It can used at Once</label>
                                        <input type="text" class="form-control" value="${delivery_charges.rows[0].per_can_be_used}" placeholder="Percentage Used" required="" name="per_used">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Get on Purchase Of Or More than*</label>
                                        <input type="number" class="form-control" value="${delivery_charges.rows[0].on_purchase_of_or_more_than}" placeholder="Get On Purchase Of More Than" required="" name="on_purchase">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Used on Purchase of or More Than*</label>
                                        <input type="number" class="form-control" value="${delivery_charges.rows[0].used_on_purchase_of}" placeholder="Used On Purchase Of More Than" required="" name="used_on_purchase">
                                    </div>
                                    <input type="text" hidden="" class="form-control"  name="id1" value="${param.id}">
                                    <input type="submit" value="Edit" name="inserts" class="save-btn hover-btn">

                                    <!--<button class="save-btn hover-btn" type="submit">Add New Category</button>!-->
                                </div>
                            </div>
                        </form>
                        <c:if test="${param.inserts.equals('Edit')}">
                            <c:choose>
                                <c:when test="${param.delivery_charges != '' && param.id1 != ''}">
                                    <sql:update dataSource="${db}" var="i">
                                     UPDATE `gambo_wallet_details` SET `get_Rs`='${param.get_rs}',`per_can_be_used`='${param.per_used}',`on_purchase_of_or_more_than`='${param.on_purchase}',`used_on_purchase_of`='${param.used_on_purchase}' WHERE `id`='${param.id1}'
                                    </sql:update>
                                        <c:if test="${i==1}">
                                            <c:set var="toast_message" scope="session" value="Wallet Details Edited"/>
                                    </c:if>
                                    <c:redirect url="wallet_details.jsp"/>
                                   
                               
                                </c:when>
                                <c:otherwise>
                                    <c:set value="Enter City in Field" var="exception"/>
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
  <c:if test="${exception != null}">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>toastr.info('${exception}');
            </script>
            <c:remove var="exception" scope="session"/>
        </c:if>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
