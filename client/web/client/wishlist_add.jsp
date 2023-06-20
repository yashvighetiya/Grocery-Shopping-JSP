
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<head> <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
       
</head>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:choose>
    <c:when test="${user_name == null}">
        <c:redirect url="sing_in.jsp"/>
    </c:when>
    <c:otherwise>
        <sql:query dataSource="${db}" var="product_wishlist_select">
    SELECT * FROM `wishlist` WHERE `user_name`='${user_name}' AND `wishlist_product`='${param.pro_name}'
</sql:query>
<c:choose>
    <c:when test="${product_wishlist_select.rowCount > 0}">
       
    </c:when>
    <c:otherwise>
        <sql:update dataSource="${db}" var="wishlist">
    INSERT INTO `wishlist`(`user_name`, `wishlist_product`) VALUES ('${user_name}','${param.pro_name}')
</sql:update>

    </c:otherwise>
</c:choose>
    </c:otherwise>
</c:choose>



