<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<c:if test="${param.category_id == null}">
    <c:set value="Select Category to Delete" var="toast_message" scope="session"/>
   
    <c:redirect url="category.jsp"/>
</c:if>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<body>
<c:catch var="catchtheException">
    <sql:update dataSource="${db}" var="i">
        DELETE FROM `categories` WHERE `category_id`='${param.category_id}';
    </sql:update>
</c:catch>
        
        
<c:if test="${i == 1}">
     <c:set value="Category is successfully Deteled" var="toast_message" scope="session"/>
    <c:redirect url="category.jsp"/>
</c:if>
        
        
<c:if test = "${catchtheException != null}"> 
    <c:set value="Category cant be deleted as it contains few Products" var="toast_message" scope="session"/>
    <c:redirect url="category.jsp"/>
</c:if>
</body>