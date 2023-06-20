<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql:///gambosupermarket" password="" user="root" var="db" scope="session"/>

<sql:query dataSource="${db}" var="select_query">
   SELECT * FROM `order_master` WHERE `user_name`='${user_name}' && `invoice_no`='${param.invoice}'
</sql:query>
   <c:set var="invoice_no" value="${param.invoice}" scope="page" />
<c:if test="${select_query.rowCount > 0}">
    <c:set value="${select_query.rows[0].time}" var="database_time"/>
<%
    
    
 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String time = dtf.format(now);
      
       
                String time1 = (String)pageContext.getAttribute("database_time");
		String time2 = time;

		// Creating a SimpleDateFormat object
		// to parse time in the format HH:MM:SS
		SimpleDateFormat simpleDateFormat
			= new SimpleDateFormat("HH:mm:ss");

		// Parsing the Time Period
		Date date1 = simpleDateFormat.parse(time1);
		Date date2 = simpleDateFormat.parse(time2);

		// Calculating the difference in milliseconds
		long differenceInMilliSeconds
			= Math.abs(date2.getTime() - date1.getTime());

		// Calculating the difference in Hours
		long differenceInHours
			= (differenceInMilliSeconds / (60 * 60 * 1000))
			% 24;

		// Calculating the difference in Minutes
		long differenceInMinutes
			= (differenceInMilliSeconds / (60 * 1000)) % 60;

		// Calculating the difference in Seconds
		long differenceInSeconds
			= (differenceInMilliSeconds / 1000) % 60;
                long left_minutes = 29 - differenceInMinutes;
                long left_second = 60 - differenceInSeconds;
		// Printing the answer
                if(left_minutes > -1){
                    
                    out.println("Time Left To Cancel Order is " + left_minutes + " minutes " + left_second + " Seconds. ");
                   
                }
                else{
                    String jdbcUrl = "jdbc:mysql://localhost:3306/gambosupermarket";
    String username = "root";
   // String password = "";
    String sql = "delete from cancel_order_timelimit where invoice_no=?";
     try (Connection conn = DriverManager.getConnection(jdbcUrl, username, ""); 
        PreparedStatement stmt = conn.prepareStatement(sql)) {
      
      stmt.setInt(1,Integer.parseInt((String)pageContext.getAttribute("invoice_no")));
      stmt.executeUpdate();
    
    } catch (SQLException e) {
      e.printStackTrace();
    }

                 
                }
                
%>
<c:set value="${cancel_order}" var="cancel_order" scope="application"/>
</c:if>