<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%
    String s=request.getParameter("val1");
    
    Pattern pattern2 = Pattern.compile("[a-zA-Z0-9@_#.]{3,25}");
                                                        Matcher matcher2 = pattern2.matcher(request.getParameter("val1"));
                                                        boolean name_valid = matcher2.matches();
                                                      
                                                        if(name_valid == true)
                                                        {
                                                           
                                                        }
                                                        else
                                                        {
                                                            out.println("Name of length(3,25)can have numbers,letters and @_#. symbol");
                                                           // out.println(false+request.getParameter("val1"));
                                                        }
                                                        
%>