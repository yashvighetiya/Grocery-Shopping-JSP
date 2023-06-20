<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${user_email == null}">
    <c:redirect url="admin_login.jsp"/>
</c:if>
<c:if test="${param.user_id == null}">
    <c:set value="Select Id to Remove Contact Us Details" var="toast_message" scope="session"/>

    <c:redirect url="contact_us.jsp"/>
</c:if>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:catch var="catchtheException">
    <sql:update dataSource="${db}" var="i">
     DELETE FROM `contact_us` WHERE `id`='${param.user_id}'
    </sql:update>
</c:catch>
     <c:if test="${i == 1}">
    <c:set value="Contact Details is successfully Removed" var="toast_message" scope="session"/>

</c:if>
<c:if test="${catchtheException !=null}">
    <c:set value="Opps! some Error occured while Removing Contact Us Details" var="toast_message" scope="session"/>

</c:if>
<c:redirect url="contact_us.jsp"/> 