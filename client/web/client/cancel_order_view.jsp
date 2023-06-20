<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<c:if test="${user_name ==  null}">
    <c:redirect url="index.jsp"/>
</c:if>
<jsp:include page="header.jsp"/>

<head>
    <style>
.button {
  background-color: red; 
  border: none;
  color: white;
  padding: 5px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 4px 2px;
  cursor: pointer;
}


.button3 {border-radius: 8px;}
</style>
</head>
<div class="wrapper">
<div class="gambo-Breadcrumb">
<div class="container">
<div class="row">
<div class="col-md-12">
<nav aria-label="breadcrumb">
<ol class="breadcrumb">
<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
<li class="breadcrumb-item active" aria-current="page">My Orders</li>
</ol>
</nav>
</div>
</div>
</div>
</div>
<div class="dashboard-group">
<div class="container">
<div class="row">
<div class="col-lg-12">
<div class="user-dt">
<div class="user-img">
<img src="images/avatar/img-5.jpg" alt="">
<div class="img-add">

</div>
</div>
    <sql:query dataSource="${db}" var="user_detail">
        SELECT * FROM `users` WHERE `user_name`='${user_name}'
    </sql:query>
<h4>${user_detail.rows[0].user_name}</h4>
<p>+91${user_detail.rows[0].user_contact}</p>
</div>
</div>
</div>
</div>
</div>
<div class="">
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-4">
<div class="left-side-tabs">
<div class="dashboard-left-links">

<a href="dashboard.jsp" class="user-item active"><i class="uil uil-box"></i>My Orders</a>
<a href="dashboard_my_cancel_orders.jsp" class="user-item active"><i class="uil uil-box"></i>My Canceled Orders</a>
<a href="dashboard_my_wallet.jsp" class="user-item"><i class="uil uil-wallet"></i>My Wallet</a>
<a href="dashboard_my_wishlist.jsp" class="user-item"><i class="uil uil-heart"></i>Shopping Wishlist</a>
<a href="logout.jsp" class="user-item"><i class="uil uil-exit"></i>Logout</a>
</div>
</div>
</div>
<div class="col-lg-9 col-md-8">
<div class="dashboard-right">
<div class="row">
<div class="col-md-12">
<div class="main-title-tab">
<h4><i class="uil uil-box"></i>My Orders</h4>
</div>
</div>
<div class="col-lg-12 col-md-12">
    <sql:query dataSource="${db}" var="select_order">
        SELECT * FROM `order_master` WHERE `user_name`='${user_name}' && `invoice_no`='${param.invoice_no}'
    </sql:query>
        <c:forEach items="${select_order.rows}" var="order_list">
         <sql:query dataSource="${db}" var="order_details">
        SELECT * FROM `order_detail` WHERE `invoice_no`='${order_list.invoice_no}'
    </sql:query>
    <c:set value="0" var="item_count"/>
       <c:set value="" var="item_list"/>
        <c:forEach items="${order_details.rows}" var="order_detail_list">
            <c:set value="${item_count + 1}" var="item_count"/>
            <c:choose>
            <c:when test="${item_list ==  ''}">
                <c:set value="${order_detail_list.product_name} ${order_detail_list.product_quantity}kg" var="item_list"/>
            </c:when>
                <c:otherwise>
                    <c:set value="${item_list} , ${order_detail_list.product_name} ${order_detail_list.product_quantity}kg" var="item_list"/>
                </c:otherwise>
            </c:choose>
 
    </c:forEach>
       <div class="pdpt-bg">

<div class="order-body10">
<ul class="order-dtsll">
<li>

</li>
<li>
<div class="order-dt47">
<p>Delivery - By Gambo</p>
<p>${item_list}</p>
<br>

<c:set  value="${order_list.invoice_no}" var="userId"/>
<script>
  
var intervalId = window.setInterval(function(){
   myfunction();
            var request;
           
//alert(userId);
            function myfunction()
            {

               //alert('gun');
                var url = "example2.jsp?invoice=" + ${order_list.invoice_no} ;

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
                            
                        
                         var val1 = request.responseText;
                         document.getElementById("timer").innerHTML = val1;
       
                        }
                    };
                    request.open("GET", url, true);
                    request.send();

                } catch (e) {
                    alert("Unable to connect to server");
                }
            }


        
},1000)
</script>

<sql:query dataSource="${db}" var="time_left">
    SELECT * FROM `cancel_order_timelimit` WHERE `invoice_no`='${order_list.invoice_no}'
</sql:query>
    
    <font color='red'><b><h5 id="timer"></h5></b></font><br>
<c:if test="${time_left.rowCount > 0}">
    <form>
    <a class="button button3" href='cancle_order.jsp?invoice_no=${order_list.invoice_no}' onclick="return confirm('Do You Really Want to perform Delete Operation?')">Cancel Order</a>
    </form>
         
</c:if>
                             
</div>
</div>
</li>
</ul>

</div>
</div>
        </c:forEach>

</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>


    <jsp:include page="footer.jsp"/>
    <!--
<head>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
      
</head>
<script>function fetchdata(){
 var request;  
 myfunctionwishlist();
function myfunctionwishlist()  
{  
var url="example2.jsp";  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=function () {
                        if (request.readyState == 4) {
                         document.getElementById("def").value = "done";
            toastr.info('Product Added to wishlist');
           
          
                        }
                    };
                    request.open("GET", url, true);
                    request.send();

}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('amit').innerHTML=val;  
}  
}  
}

$(document).ready(function(){
 setTimeout(fetchdata,3000);
 });</script>

<div id="def" >
hi
</div>-->
<head>

</head>

