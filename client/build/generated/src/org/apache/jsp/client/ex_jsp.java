package org.apache.jsp.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ex_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<html>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("\t<script src=\n");
      out.write("\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\">\n");
      out.write("\t</script>\n");
      out.write("\t\n");
      out.write("\t<style>\n");
      out.write("\t\tform {\n");
      out.write("\t\t\tborder: 2px solid black;\n");
      out.write("\t\t\tborder-radius:12px;\t\t\t\n");
      out.write("\t\t\twidth: 50%;\n");
      out.write("\t\t\tpadding: 20px;\n");
      out.write("\t\t\tbackground-color:#fffa86;\n");
      out.write("\t\t}\n");
      out.write("\t\tlabel {\n");
      out.write("\t\t\tcolor:brown;\n");
      out.write("\t\t\tfont-weight:bold;\n");
      out.write("\t\t}\n");
      out.write("\t\tinput {\n");
      out.write("\t\tborder: 2px solid grey;\n");
      out.write("\t\tborder-radius:12px;\n");
      out.write("\t\t\tpadding: 5px;\n");
      out.write("\t\t\tmargin: 10px;\n");
      out.write("\t\t\toutline:none;\n");
      out.write("\t\t}\t\n");
      out.write("\t</style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\t<h3>Validation if input field empty:</h3>\n");
      out.write("\t\n");
      out.write("\t<form>\n");
      out.write("\t\t<label><em>Enter Name:</em></label>\n");
      out.write("\t\t<input type=\"text\" name=\"name\" required autocomplete=\"off\">\n");
      out.write("\t\t<br>\n");
      out.write("\t\t<label><em>Enter Password:</em></label>\n");
      out.write("\t\t<input type=\"password\" name=\"pwd\" required autocomplete=\"off\">\n");
      out.write("\t\t<br>\n");
      out.write("\t\t<label><em>Enter Email Id:</em></label>\n");
      out.write("\t\t<input type=\"email\" name=\"eid\" required autocomplete=\"off\">\n");
      out.write("\t</form>\n");
      out.write("\t\n");
      out.write("\t<script>\n");
      out.write("\t\t$(document).ready(function() {\n");
      out.write("\t\t\t$(\"input\").focusout(function() {\n");
      out.write("\t\t\t\tif($(this).val()=='') {\n");
      out.write("\t\t\t\t\t$(this).css('border', 'solid 2px red');\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t\telse {\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t// If it is not blank.\n");
      out.write("\t\t\t\t\t$(this).css('border', 'solid 2px green');\t\n");
      out.write("\t\t\t\t}\t\n");
      out.write("\t\t\t}) .trigger(\"focusout\");\n");
      out.write("\t\t});\n");
      out.write("\t</script>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>");
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
