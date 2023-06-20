<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<sql:query dataSource="${db}" var="use_details">
    SELECT * FROM `users` WHERE `user_name`='${user_name}'
</sql:query>
<br>
<c:forEach var="abc" items="${use_details.rows}">
    <%
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yy/MM/dd");
        String date1 = formatter.format(date);

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String time = dtf.format(now);

        pageContext.setAttribute("date", date1);

        pageContext.setAttribute("time", time);
    %>

    <c:catch>
        <sql:query dataSource="${db}" var="delivery_charges">
            SELECT * FROM `delivery_charges_detail` 
        </sql:query>
    </c:catch>
    <c:choose>
        <c:when test="${grand_total >= delivery_charges.rows[0].on_price_less_then}">
            <c:set value="0" var="delivery_charges"/>
        </c:when>
        <c:otherwise>
            <c:set value="${delivery_charges.rows[0].Delivery_charge}" var="delivery_charges"/>
        </c:otherwise>
    </c:choose>
   <%----%>
   <%----%>
   <c:catch>
       <sql:query dataSource="${db}" var="wallet_details1">
           SELECT * FROM `gambo_wallet_details` 
       </sql:query>
   </c:catch>
       <c:if test="${grand_total >= wallet_details1.rows[0].on_purchase_of_or_more_than}">

                <sql:query dataSource="${db}" var="balance_client1">
                    SELECT * FROM `client_wallet` WHERE `user_name`='${user_name}'
                </sql:query>
               
                <sql:update dataSource="${db}" var="balance_update1">
                    UPDATE `client_wallet` SET `balance`='${balance_client1.rows[0].balance + wallet_details1.rows[0].get_Rs}' WHERE `user_name`='${user_name}'
                </sql:update>
               
       </c:if>
   <%----%>
   <c:set scope="page" var="balance_to_really_use" value="no"/>
            <c:if test="${param.wallet_balance.equals('wallet_balance')}">
                <c:set scope="session" var="grand_total" value="${grand_total - balance_to_use}"/>
                 <c:set scope="page" var="balance_to_really_use" value="yes"/>
                <c:catch>
                <sql:query dataSource="${db}" var="balance_client">
                    SELECT * FROM `client_wallet` WHERE `user_name`='${user_name}'
                </sql:query>
                </c:catch>
                <c:catch>
                <sql:update dataSource="${db}" var="balance_update">
                    UPDATE `client_wallet` SET `balance`='${balance_client.rows[0].balance - balance_to_use}',`no_of_times_used`='${balance_client.rows[0].no_of_times_used + 1}' WHERE `user_name`='${user_name}'
                </sql:update>
                </c:catch>
            </c:if>
                <c:if test="${balance_to_really_use.equals('no')}">
                    <c:set value="0" var="balance_to_use"/>
                </c:if>
                
         <%----%>
    <c:catch var="exception">
        <sql:update dataSource="${db}" var="i">
            INSERT INTO `order_master`( `user_id`, `user_name`, `user_email`, `phone_no`, `payment_method`, `date`, `time`, `grand_total`, `address`, `delivery_charge` , `wallet_balance_used`) VALUES ('${abc.user_id}','${abc.user_name}','${abc.user_email}','${abc.user_contact}','${param.payment_method}','${date}','${time}','${grand_total}','${Address}','${delivery_charges}','${balance_to_use}')
        </sql:update>
    </c:catch>
    <c:if test="${i > 0}">
         
        <c:set value="${abc.user_orders + 1}" var="order"/>
        <sql:update dataSource="${db}" var="user_order_update">
            UPDATE `users` SET `user_orders`='${order}' WHERE `user_email`='${abc.user_email}'
        </sql:update>
    </c:if>

    <c:if test="${i != 1 || exception != null}">
        <c:set value="Cash on Delivery not available as your order value exceeds Rs 1000" var="toast_message"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <script>var message = '${toast_message}';
            toastr.info(message);
        </script>
        <c:remove var="toast_message"/>
    </c:if>



</c:forEach>
<c:if test="${i == 1}">

    <c:catch var="exception">
        <sql:query var="select_cart" dataSource="${db}">
            SELECT * FROM `cart` WHERE `user_name`='${user_name}';
        </sql:query>
    </c:catch>
    <c:forEach items="${select_cart.rows}" var="items_cart">
        product_name : ${items_cart.user_products} quan: ${items_cart.quantity}

        <c:catch var="exception">
            <sql:query var="product_select_query" dataSource="${db}">
                SELECT * FROM `gambo_products` WHERE `product_name`='${items_cart.user_products}'
            </sql:query>
        </c:catch>
        <c:forEach items="${product_select_query.rows}" var="pro_details">
            `product_discount`='${pro_details.product_discount}'
            `product_price`='${pro_details.product_price}'
            total= '${(pro_details.product_price - ((pro_details.product_discount * pro_details.product_price)/100)) * items_cart.quantity}'
            <c:catch var="exception">
                <sql:query dataSource="${db}" var="order_master">
                    SELECT invoice_no,user_email FROM `order_master` ORDER BY `invoice_no` DESC LIMIT 1;  
                </sql:query>
            </c:catch>
            <c:forEach items="${order_master.rows}" var="get_master_detail">
                <c:catch var="exception">
                    <sql:update dataSource="${db}" var="j">
                        INSERT INTO `order_detail`(`invoice_no`, `user_email`, `user_name`, `product_name`, `product_quantity`, `product_price`, `total`, `date`, `time`, `discount_per_product`) VALUES ('${get_master_detail.invoice_no}','${get_master_detail.user_email}','${user_name}','${items_cart.user_products}','${items_cart.quantity}','${pro_details.product_price}','${(pro_details.product_price - ((pro_details.product_discount * pro_details.product_price)/100)) * items_cart.quantity}','${date}','${time}','${pro_details.product_discount}')
                    </sql:update>
                </c:catch>

                <c:if test="${j > 0}">
                    <c:catch var="exception">
                        <sql:query var="select_data" dataSource="${db}">
                            SELECT * FROM `gambo_products` WHERE product_name='${items_cart.user_products}'
                        </sql:query>
                    </c:catch>
                    <c:forEach items="${select_data.rows}" var="selecting_data">
                        <c:set value="${selecting_data.product_selling + items_cart.quantity}" var="product_selling"/>
                        <c:set value="${selecting_data.product_stock - items_cart.quantity}" var="product_stock"/>
                    </c:forEach>
                    <c:catch var="exception">
                        <sql:update dataSource="${db}" var="update_product_table">
                            UPDATE `gambo_products` SET `product_selling`='${product_selling}',`product_stock`='${product_stock}' WHERE `product_name`='${items_cart.user_products}'
                        </sql:update>
                    </c:catch>
                </c:if>
                <c:set scope="application" value="${get_master_detail.invoice_no}" var="invoice"/>
            </c:forEach>
        </c:forEach>
        <br><br>
    </c:forEach>
</c:if>
<c:if test="${j > 0}">
    <c:catch var="exception">
        <c:catch var="exception">
            <sql:update dataSource="${db}" var="k">
                DELETE FROM `cart` WHERE `user_name`='${user_name}'
            </sql:update>
        </c:catch>
        <c:catch var="exception">
            <sql:query dataSource="${db}" var="selling_city">
                SELECT * FROM `city` where `city`='${city}'
            </sql:query>
        </c:catch>
        <c:forEach items="${selling_city.rows}" var="single_city">
            <c:catch var="exception">
                <sql:update dataSource="${db}">
                    UPDATE `city` SET `selling`='${single_city.selling + 1}' WHERE `city`='${city}'
                </sql:update>
            </c:catch>
        </c:forEach>

    </c:catch>
    <c:if test="${k > 0}">
        <c:catch var="exception">
        <sql:update dataSource="${db}" var="i">
            INSERT INTO `cancel_order_timelimit`(`invoice_no`, `time_left`) VALUES ('${invoice}','yes')
          </sql:update>
         </c:catch>
        <c:if test="${param.payment_method.equals('Cash On Delivery')}">
            <c:redirect url="order_placed.jsp"/>
        </c:if>
        <c:if test="${param.payment_method.equals('Card')}">
            <c:redirect url="payuform.jsp"/>
        </c:if>
        
    </c:if>

</c:if>
<c:if test="${j <= 0}">
    <c:set value="Some Error occured!!" var="toast_message"/>
    <c:redirect url="index.jsp"/>
</c:if>