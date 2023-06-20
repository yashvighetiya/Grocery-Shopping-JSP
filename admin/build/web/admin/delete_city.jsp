<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<c:if test="${param.city_id == null}">
    <c:set value="Select Product to Delete" var="toast_message" scope="session"/>

    <c:redirect url="products.jsp"/>
</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:catch var="catchtheException">
    <sql:update dataSource="${db}" var="i">
       DELETE FROM `city` WHERE `id`='${param.city_id}'
    </sql:update>
</c:catch>

<c:if test="${i == 1}">
    <c:set value="City is successfully Removed" var="toast_message" scope="session"/>

</c:if>
<c:if test="${catchtheException !=null}">
    <c:set value="Opps! some Error occured while Removing City" var="toast_message" scope="session"/>

</c:if>
<c:redirect url="delivery_details.jsp"/> 