<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%
    Pattern pattern1 = Pattern.compile("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20}$");
                                                        Matcher matcher1 = pattern1.matcher(request.getParameter("val1"));
                                                        boolean password_valid = matcher1.matches();
                                                       
                                                        if(password_valid == true)
                                                        {
                                                           
                                                        }
                                                        else
                                                        {
                                                            out.println("At least one number,lower,upper,special symbol of length(8,20)");
                                                           // out.println(false+request.getParameter("val1"));
                                                        }
                                                        
%>
