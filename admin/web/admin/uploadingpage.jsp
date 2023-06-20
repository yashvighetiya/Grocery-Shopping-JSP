<%
    String abc = "C:/xampp/htdocs/gambo_admin/web/admin/images/category/";
    out.println(" old  : "+abc+"<br><br>");
    //String str = "abcdDCBA123";
String strNew = abc.replace("C:/xampp/htdocs/gambo_admin/web/admin/", "");
    out.println("new : "+strNew);
%>