<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%> 
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<%@ page import="java.sql.*"%>  
  
<%  
String s=request.getParameter("quantity");
String pro_price=request.getParameter("price_product");

if(s==null || s.trim().equals("") || request.getParameter("product_name") == null)
{  
out.print("Please enter id");  
}
else
{  
int id=Integer.parseInt(s); 
//int price_of_pro=Integer.parseInt(pro_price);

  
try{  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gambosupermarket","root","");  
        PreparedStatement ps2=con.prepareStatement("Select * from gambo_products where product_name=? ");  
        ps2.setString(1,request.getParameter("product_name"));
        ResultSet rs1=ps2.executeQuery();
        while(rs1.next())
        {
            if(rs1.getInt(8) >= id)
            {
                        PreparedStatement ps=con.prepareStatement("UPDATE `cart` SET `quantity`=? where user_products=? && user_name=? ");  

        ps.setInt(1,id);  
        ps.setString(2,request.getParameter("product_name"));
        ps.setString(3,request.getParameter("user_name1"));
        int i=ps.executeUpdate();
        if(i==1)
        { 
        PreparedStatement ps1=con.prepareStatement("Select * from gambo_products where product_name=? ");  
        ps1.setString(1,request.getParameter("product_name"));
        ResultSet rs=ps1.executeQuery();
        while(rs.next())
        {

            Double price = (rs.getDouble(5) - (rs.getDouble(7) * rs.getDouble(5) / 100 )) *id;

            out.println("Rs "+price);
        }

        }
       
            }
            else
            {
               out.println("Rs helloo");
            }
            con.close(); 
            
        }

  
}catch(Exception e){e.printStackTrace();}  
}  
%>  
<%--<c:set value="${(product_cart.product_price - ( (product_cart.product_discount * product_cart.product_price)/100 )) * items_cart.quantity}" var="pro_price"/>
--%>
