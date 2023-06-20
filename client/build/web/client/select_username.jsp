<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>  
  
<%  
String s=request.getParameter("val");  
if(s==null || s.trim().equals("")){  
out.print("Please enter username");  
}else{  
  
try{  
    
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gambosupermarket","root","");  
PreparedStatement ps=con.prepareStatement("select * from users where user_name=?");  
ps.setString(1,s);  
ResultSet rs=ps.executeQuery();  
while(rs.next()){  
out.print("Username "+rs.getString(2)+" already used Enter other Username");  

}  
con.close();  
}catch(Exception e){e.printStackTrace();}  
}  
%>    