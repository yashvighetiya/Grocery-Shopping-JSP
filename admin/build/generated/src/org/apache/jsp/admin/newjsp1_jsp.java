package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class newjsp1_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!--<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("\t<script src=\n");
      out.write("\"https://code.jquery.com/jquery-3.4.1.min.js\">\n");
      out.write("\t</script>\n");
      out.write("\n");
      out.write("\t<script>\n");
      out.write("\t\t$(document).ready(function () {\n");
      out.write("\n");
      out.write("\t\t\t// On button click, get value\n");
      out.write("\t\t\t// of input control Show alert\n");
      out.write("\t\t\t// message box\n");
      out.write("\t\t\t$(\"#getValBtnID\").click(function () {\n");
      out.write("\t\t\t\tvar inputString = $(\"#userInputID\").val();\n");
      out.write("\t\t\t\t$('#myDIVTag').html('<b>' + inputString + '</b>');\n");
      out.write("\t\t\t});\n");
      out.write("\t\t});\n");
      out.write("\t</script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\t<h3 style=\"color:green\">\n");
      out.write("\t\tGeeksForGeeks\n");
      out.write("\t</h3>\n");
      out.write("\n");
      out.write("\t<b>JQuery val() Method</b>\n");
      out.write("\t\n");
      out.write("\t<br><br>\n");
      out.write("\t\n");
      out.write("\t<input type=\"text\" id=\"userInputID\">\n");
      out.write("\t<br><br>\n");
      out.write("\n");
      out.write(" <div id=\"myDIVTag\"></div>\n");
      out.write("\t<button type=\"button\" id=\"getValBtnID\">\n");
      out.write("\t\tGet Value\n");
      out.write("\t</button>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>-->\n");
      out.write("\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        function take_quantity()\n");
      out.write("        {\n");
      out.write("            var  quantity = document.forms[\"form1\"][\"quantity\"].value;\n");
      out.write("            alert(quantity);\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <form name=\"form1\">\n");
      out.write("        <input type=\"text\" name=\"quantity\"/>\n");
      out.write("        <br><br>\n");
      out.write("        <input type=\"button\" value=\"submit\" onclick=\"return take_quantity()\"/>\n");
      out.write("    </form>\n");
      out.write("</body>\n");
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
