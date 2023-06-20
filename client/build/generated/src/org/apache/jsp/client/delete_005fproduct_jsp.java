package org.apache.jsp.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class delete_005fproduct_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE HTML>\n");
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("\t\t<title>\n");
      out.write("\t\t\tDisplay a confirmation dialog when\n");
      out.write("\t\t\tclicking an a tag link\n");
      out.write("\t\t</title>\n");
      out.write("\t</head>\n");
      out.write("\t\n");
      out.write("\t<body style = \"text-align:center;\">\n");
      out.write("\t\t\n");
      out.write("\t\t<h1 style = \"color:green;\" >\n");
      out.write("\t\t\tGeeksForGeeks\n");
      out.write("\t\t</h1>\n");
      out.write("\t\t\n");
      out.write("\t\t<p id = \"GFG_UP\" style =\n");
      out.write("\t\t\t\"font-size: 15px; font-weight: bold;\">\n");
      out.write("\t\t</p>\n");
      out.write("\t\t\n");
      out.write("\t\t<a href=\"#\" onclick=\"return confirm('Are you sure?')\">\n");
      out.write("\t\t\tLink\n");
      out.write("\t\t</a>\n");
      out.write("\t\t\n");
      out.write("\t\t<br><br>\n");
      out.write("\t\t\n");
      out.write("\t\t<p id = \"GFG_DOWN\" style =\n");
      out.write("\t\t\t\"color:green; font-size: 20px; font-weight: bold;\">\n");
      out.write("\t\t</p>\n");
      out.write("\t\t\n");
      out.write("\t\t<script>\n");
      out.write("\t\t\tvar el_up = document.getElementById(\"GFG_UP\");\n");
      out.write("\t\t\t\n");
      out.write("\t\t\tel_up.innerHTML =\n");
      out.write("\t\t\t\t\"Click on the LINK for further confirmation.\";\n");
      out.write("\t\t</script>\n");
      out.write("\t</body>\n");
      out.write("</html>\t\t\t\t\t\n");
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
