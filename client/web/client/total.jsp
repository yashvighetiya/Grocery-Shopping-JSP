<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<sql:query var="select_cart" dataSource="${db}">
    SELECT * FROM `cart` WHERE `user_name`='${user_name}';
</sql:query>
<c:set var="total" value="0"/>
<c:if test="${select_cart.rowCount > 0}">
    <c:forEach items="${select_cart.rows}" var="items_cart">
        <sql:query var="product_selection" dataSource="${db}">
            SELECT * FROM `gambo_products` WHERE `product_name`='${items_cart.user_products}'
        </sql:query>
            <c:forEach items="${product_selection.rows}" var="product_cart">
                  <c:set value="${(product_cart.product_price - ( (product_cart.product_discount * product_cart.product_price)/100 )) * items_cart.quantity}" var="pro_price"/>
                  <c:set value="${total + pro_price}" var="total"/>
            </c:forEach>
       
    </c:forEach>
             <c:out value="Rs ${total}"/>
</c:if>
