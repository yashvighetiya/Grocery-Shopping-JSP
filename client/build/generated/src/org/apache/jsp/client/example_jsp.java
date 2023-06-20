package org.apache.jsp.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Date;
import java.text.SimpleDateFormat;

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");


		// Dates to be parsed
		String time1 = "18:00:00";
		String time2 = "7:30:50";

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

		// Printing the answer
		out.println(
			"Difference is " + differenceInHours + " hours "
			+ differenceInMinutes + " minutes "
			+ differenceInSeconds + " Seconds. ");
	

      out.write('\n');
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
