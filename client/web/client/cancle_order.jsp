
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
 <sql:query dataSource="${db}" var="timelimit_check">  
     SELECT * FROM `cancel_order_timelimit` WHERE `invoice_no`='${param.invoice_no}'
 </sql:query>
 <c:if test="${timelimit_check.rowCount > 0}">
 <sql:query dataSource="${db}" var="order_detail">
     SELECT * FROM `order_detail` WHERE `invoice_no`='${param.invoice_no}'
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
      
      <sql:query dataSource="${db}" var="invoice_master_table">
          SELECT * FROM `order_master` WHERE `invoice_no`='${param.invoice_no}'
      </sql:query>
        <%
       
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String time = dtf.format(now);

     
        pageContext.setAttribute("time", time);
    %>
          <c:forEach items="${invoice_master_table.rows}" var="select_invoice_detail">
               <sql:update dataSource="${db}" var="add_cancel_master">
                   INSERT INTO `cancel_order_master`(`invoice_no`, `user_email`, `user_name`, `phone_no`, `payment_method`, `cancel_date`, `cancel_time`, `grand_total`, `address`, `delivery_charge`, `wallet_balance_used`, `user_id`) VALUES ('${select_invoice_detail.invoice_no}','${select_invoice_detail.user_email}','${select_invoice_detail.user_name}','${select_invoice_detail.phone_no}','${select_invoice_detail.payment_method}','${select_invoice_detail.date}','${time}','${select_invoice_detail.grand_total}','${select_invoice_detail.address}','${select_invoice_detail.delivery_charge}','${select_invoice_detail.wallet_balance_used}','${select_invoice_detail.user_id}')
         </sql:update>
          </c:forEach>
                 <sql:query dataSource="${db}" var="select_invoice_order_detail">
                    SELECT * FROM `order_detail` WHERE `invoice_no`='${param.invoice_no}'
                </sql:query>
     <c:forEach items="${select_invoice_order_detail.rows}" var="invoice_order_list">
           <sql:query dataSource="${db}" var="select_invoice_order_master">
                    SELECT * FROM `cancel_order_master` WHERE `invoice_no`='${param.invoice_no}'
                </sql:query>
                <c:if test="${select_invoice_order_master.rows[0].payment_method != 'Cash On Delivery'}">
                      <sql:query dataSource="${db}" var="wallet_balance">
                   SELECT * FROM `client_wallet` WHERE `user_name`='${user_name}'
                </sql:query>
           <sql:update dataSource="${db}">
               UPDATE `client_wallet` SET `balance`='${select_invoice_order_master.rows[0].grand_total + wallet_balance.rows[0].balance}' WHERE `user_name`='${user_name}'
        </sql:update> 
                </c:if>
                  
       
     <sql:update dataSource="${db}" var="add_cancel_details">
         INSERT INTO `cancel_order_detail`(`cancel_order_id`, `user_email`, `user_name`, `product_name`, `product_quantity`, `product_price`, `total`, `cancel_date`, `cancel_time`, `discount_per_product`) VALUES ('${select_invoice_order_master.rows[0].cancel_order_id}','${invoice_order_list.user_email}','${invoice_order_list.user_name}','${invoice_order_list.product_name}','${invoice_order_list.product_quantity}','${invoice_order_list.product_price}','${invoice_order_list.total}','${invoice_order_list.date}','${time}','${invoice_order_list.discount_per_product}')
      </sql:update>
     </c:forEach>
       <c:if test="${cart_table > 0}">
           <sql:update dataSource="${db}" var="detail_table">
               DELETE FROM `order_detail` WHERE `invoice_no`='${param.invoice_no}'
           </sql:update>
           <c:if test="${detail_table > 0}">
                <sql:update dataSource="${db}" var="master_table">
             DELETE FROM `order_master` WHERE `invoice_no`='${param.invoice_no}'
           </sql:update>
              <sql:update dataSource="${db}" >
              DELETE FROM `cancel_order_timelimit` WHERE `invoice_no`='${param.invoice_no}'
           </sql:update>
           <c:if test="${master_table > 0}">
               <c:redirect url="dashboard_my_orders.jsp"/>
           </c:if>
           </c:if>
       </c:if>
            
 </c:if>
                <c:redirect url="dashboard.jsp"/>