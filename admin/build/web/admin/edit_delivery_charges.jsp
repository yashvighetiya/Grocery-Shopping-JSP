
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
    SELECT * FROM `delivery_charges_detail`
</sql:query>

<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h2 class="mt-30 page-title">Delivery City</h2>
            <ol class="breadcrumb mb-30">
                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="category.jsp">Delivery City</a></li>
                <li class="breadcrumb-item active">Add Delivery City</li>
            </ol>
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="card card-static-2 mb-30">
                        <div class="card-title-2">
                            <h4>Add New City</h4>
                        </div>
                        <form method = "post">
                            <div class="card-body-table">
                                <div class="news-content-right pd-20">
                                    <div class="form-group">
                                        <label class="form-label">Delivery Charge*</label>
                                        <input type="number" class="form-control" value="${delivery_charges.rows[0].Delivery_charge}" placeholder="Delivery Charges" required="" name="delivery_charges">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Delivery Charge on Price Less than*</label>
                                        <input type="number" class="form-control" value="${delivery_charges.rows[0].on_price_less_then}" placeholder="On Price less Than" required="" name="on_price_less_than">
                                    </div>
                                    <input type="text" hidden="" class="form-control" placeholder="On Price less Than" name="id1" value="${param.id}">
                                    <input type="submit" value="Edit" name="inserts" class="save-btn hover-btn">

                                    <!--<button class="save-btn hover-btn" type="submit">Add New Category</button>!-->
                                </div>
                            </div>
                        </form>
                        <c:if test="${param.inserts.equals('Edit')}">
                            <c:choose>
                                <c:when test="${param.delivery_charges != '' && param.id1 != ''}">
                                    <sql:update dataSource="${db}" var="i">
                                     UPDATE `delivery_charges_detail` SET `Delivery_charge`='${param.delivery_charges}',`on_price_less_then`='${param.on_price_less_than}' WHERE `id`='${param.id1}'
                                    </sql:update>
                                        <c:if test="${i==1}">
                                            <c:set var="toast_message" scope="session" value="Delivery Details Edited"/>
                                    </c:if>
                                    <c:redirect url="delivery_details.jsp"/>
                                   
                               
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
