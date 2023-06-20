<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<head>
    <!--toast css file!-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

</head>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<c:if test="${param.remove_pro != null}">
    <c:catch var="exception">
        <sql:update dataSource="${db}" var="i">
            DELETE FROM `cart` where `user_name`='${user_name}' && `user_products`='${param.remove_pro}'
        </sql:update>
    </c:catch>
    <c:if test="${exception != null}">
        <c:set var="toast_message" scope="session" value="Opps! Some Error Occured"/>
    </c:if>
    <c:if test="${i > 0}">
        <c:set var="toast_message" scope="session" value="Product ${param.remove_pro} Removed from Cart"/>
    </c:if>
    <c:redirect url="index.jsp"/>
</c:if>