package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class example_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>  \r\n");
      out.write("<head>  \r\n");
      out.write("<script>  \r\n");
      out.write("var request;  \r\n");
      out.write("function sendInfo()  \r\n");
      out.write("{  \r\n");
      out.write("var v=document.vinform.t1.value;  \r\n");
      out.write("var url=\"example1.jsp?val=\"+v;  \r\n");
      out.write("  \r\n");
      out.write("if(window.XMLHttpRequest){  \r\n");
      out.write("request=new XMLHttpRequest();  \r\n");
      out.write("}  \r\n");
      out.write("else if(window.ActiveXObject){  \r\n");
      out.write("request=new ActiveXObject(\"Microsoft.XMLHTTP\");  \r\n");
      out.write("}  \r\n");
      out.write("  \r\n");
      out.write("try{  \r\n");
      out.write("request.onreadystatechange=getInfo;  \r\n");
      out.write("request.open(\"GET\",url,true);  \r\n");
      out.write("request.send();  \r\n");
      out.write("}catch(e){alert(\"Unable to connect to server\");}  \r\n");
      out.write("}  \r\n");
      out.write("  \r\n");
      out.write("function getInfo(){  \r\n");
      out.write("if(request.readyState==4){  \r\n");
      out.write("var val=request.responseText;  \r\n");
      out.write("document.getElementById('amit').innerHTML=val;  \r\n");
      out.write("}  \r\n");
      out.write("}  \r\n");
      out.write("  \r\n");
      out.write("</script>  \r\n");
      out.write("</head>  \r\n");
      out.write("<body>  \r\n");
      out.write("    <h1>This is an example of ajax</h1>\r\n");
      out.write("<form name=\"vinform\">  \r\n");
      out.write("Enter id:<input type=\"text\" name=\"t1\" onkeyup=\"sendInfo()\">  \r\n");
      out.write("</form>  \r\n");
      out.write("  \r\n");
      out.write("<span id=\"amit\"> </span>  \r\n");
      out.write("  \r\n");
      out.write("</body>  \r\n");
      out.write("</html>  ");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
