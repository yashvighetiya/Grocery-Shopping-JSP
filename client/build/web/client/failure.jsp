<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
 <sql:query dataSource="${db}" var="order_detail">
     SELECT * FROM `order_detail` WHERE `invoice_no`='${invoice}'
 </sql:query>
 <c:forEach items="${order_detail.rows}" var="order_detail_list">
     <sql:update dataSource="${db}" var="cart_table">
       INSERT INTO `cart`( `user_products`, `quantity`, `user_name`) VALUES ('${order_detail_list.product_name}','${order_detail_list.product_quantity}','${user_name}')
     </sql:update>
       <sql:query dataSource="${db}" var="order_detail1">
     SELECT * FROM `gambo_products` WHERE `product_name`='${order_detail_list.product_name}'
 </sql:query>
      <sql:update dataSource="${db}" var="cart_table">
      UPDATE `gambo_products` SET `product_selling`='${order_detail1.rows[0].product_selling - order_detail_list.product_quantity}',`product_stock`='${order_detail1.rows[0].product_stock + order_detail_list.product_quantity}' WHERE `product_name`='${order_detail_list.product_name}'
     </sql:update>
 </c:forEach>
       
       <c:if test="${cart_table > 0}">
           <sql:update dataSource="${db}" var="detail_table">
               DELETE FROM `order_detail` WHERE `invoice_no`='${invoice}'
           </sql:update>
           <c:if test="${detail_table > 0}">
                <sql:update dataSource="${db}" var="master_table">
             DELETE FROM `order_master` WHERE `invoice_no`='${invoice}'
           </sql:update>
           <c:if test="${master_table > 0}">
               <c:redirect url="index.jsp"/>
           </c:if>
           </c:if>
       </c:if>