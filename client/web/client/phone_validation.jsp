<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%
    
                                                        Pattern pattern = Pattern.compile("[0-9]{10}");
                                                        Matcher matcher = pattern.matcher(request.getParameter("val1"));
                                                        boolean phone_valid = matcher.matches();
                                                       
                                                        if(phone_valid == true)
                                                        {
                                                           
                                                        }
                                                        else
                                                        {
                                                            out.println("Number must have only 10 numeric digits");
                                                           // out.println(false+request.getParameter("val1"));
                                                        }
%>