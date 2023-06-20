<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>
<%@ page import="java.sql.*"%>  
<!DOCTYPE html>
<head>
    <!--toast css file!-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

</head>
<c:if test="${user_name == null}">
    <c:redirect url="sign_in.jsp"/>
</c:if>
<c:if test="${param.proname_addtocart != null}">
    <c:catch var="exception">
        <sql:query dataSource="${db}" var="select_cart_pro">
            SELECT * FROM `cart` WHERE `user_products`='${param.proname_addtocart}' && `user_name`='${user_name}'
        </sql:query>
    </c:catch>
    <c:if test="${exception != null}">
        <c:set var="toast_message" scope="session" value="Opps! Some Error Occured"/>
    </c:if>
    <c:choose>
        <c:when test="${select_cart_pro.rowCount == 1}">
            <c:set var="toast_message" scope="session" value="Product ${param.proname_addtocart} Already Present in Cart"/>
        </c:when>
        <c:otherwise>
            <c:catch var="exception">
              
                <sql:update dataSource="${db}" var="i">
                    INSERT INTO `cart`( `user_products`, `user_name`) VALUES ('${param.proname_addtocart}','${user_name}')
                </sql:update>
            </c:catch>
            <c:if test="${exception != null}">
                <c:set var="toast_message" scope="session" value="Opps! Some Error Occured"/>
            </c:if>
            <c:if test="${i == 1}">
                <c:set var="toast_message" scope="session" value="Product ${param.proname_addtocart} Added to Cart"/>
            </c:if>
        </c:otherwise>
    </c:choose>

    <c:redirect url="${param.pageurl}"/>
</c:if>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
  <script>  
var request;  
function myfunctionwishlist(pro_name)  
{  
var url="wishlist_add.jsp?pro_name="+pro_name;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=function () {
                        if (request.readyState == 4) {
                        
        
          
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
  
</script>