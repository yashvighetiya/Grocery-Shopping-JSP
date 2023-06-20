package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class offers_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_redirect_url_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_redirect_url_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_redirect_url_nobody.release();
    _jspx_tagPool_c_if_test.release();
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

      out.write('\n');
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "admin_header.jsp", out, false);
      out.write("\n");
      out.write("<div id=\"layoutSidenav_content\">\n");
      out.write("<main>\n");
      out.write("<div class=\"container-fluid\">\n");
      out.write("<h2 class=\"mt-30 page-title\">Offers</h2>\n");
      out.write("<ol class=\"breadcrumb mb-30\">\n");
      out.write("<li class=\"breadcrumb-item\"><a href=\"index.jsp\">Dashboard</a></li>\n");
      out.write("<li class=\"breadcrumb-item active\">Offers</li>\n");
      out.write("</ol>\n");
      out.write("<div class=\"row justify-content-between\">\n");
      out.write("<div class=\"col-lg-12\">\n");
      out.write("<a href=\"add_offer.jsp\" class=\"add-btn hover-btn\">Add New</a>\n");
      out.write("</div>\n");
      out.write("<div class=\"col-lg-3 col-md-4\">\n");
      out.write("<div class=\"bulk-section mt-30\">\n");
      out.write("<div class=\"input-group\">\n");
      out.write("<select id=\"action\" name=\"action\" class=\"form-control\">\n");
      out.write("<option selected>Bulk Actions</option>\n");
      out.write("<option value=\"1\">Active</option>\n");
      out.write("<option value=\"2\">Inactive</option>\n");
      out.write("<option value=\"3\">Delete</option>\n");
      out.write("</select>\n");
      out.write("<div class=\"input-group-append\">\n");
      out.write("<button class=\"status-btn hover-btn\" type=\"submit\">Apply</button>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"col-lg-5 col-md-6\">\n");
      out.write("<div class=\"bulk-section mt-30\">\n");
      out.write("<div class=\"search-by-name-input\">\n");
      out.write("<input type=\"text\" class=\"form-control\" placeholder=\"Search\">\n");
      out.write("</div>\n");
      out.write("<div class=\"input-group\">\n");
      out.write("<select id=\"categeory\" name=\"categeory\" class=\"form-control\">\n");
      out.write("<option selected>Active</option>\n");
      out.write("<option value=\"1\">Inactive</option>\n");
      out.write("</select>\n");
      out.write("<div class=\"input-group-append\">\n");
      out.write("<button class=\"status-btn hover-btn\" type=\"submit\">Search Offer</button>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"col-lg-12 col-md-12\">\n");
      out.write("<div class=\"card card-static-2 mt-30 mb-30\">\n");
      out.write("<div class=\"card-title-2\">\n");
      out.write("<h4>All Offers</h4>\n");
      out.write("</div>\n");
      out.write("<div class=\"card-body-table\">\n");
      out.write("<div class=\"table-responsive\">\n");
      out.write("<table class=\"table ucp-table table-hover\">\n");
      out.write("<thead>\n");
      out.write("<tr>\n");
      out.write("<th><input type=\"checkbox\" class=\"check-all\"></th>\n");
      out.write("<th style=\"width:130px\">Image</th>\n");
      out.write("<th>Title</th>\n");
      out.write("<th>Description</th>\n");
      out.write("<th>Status</th>\n");
      out.write("<th>Action</th>\n");
      out.write("</tr>\n");
      out.write("</thead>\n");
      out.write("<tbody>\n");
      out.write("<tr>\n");
      out.write("<td><input type=\"checkbox\" class=\"check-item\" name=\"ids[]\" value=\"3\"></td>\n");
      out.write("<td>\n");
      out.write("<div class=\"offer-img\">\n");
      out.write("<img src=\"images/offers/img-1.jpg\" alt=\"\">\n");
      out.write("</div>\n");
      out.write("</td>\n");
      out.write("<td>ð¢ Offer Title Here!</td>\n");
      out.write("<td>Up to 25% off on Vegetables & Fruits & much more</td>\n");
      out.write("<td><span class=\"badge-item badge-status\">Active</span></td>\n");
      out.write("<td class=\"action-btns\">\n");
      out.write("<a href=\"#\" class=\"edit-btn\"><i class=\"fas fa-edit\"></i> Edit</a>\n");
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td><input type=\"checkbox\" class=\"check-item\" name=\"ids[]\" value=\"2\"></td>\n");
      out.write("<td>\n");
      out.write("<div class=\"offer-img\">\n");
      out.write("<img src=\"images/offers/img-2.jpg\" alt=\"\">\n");
      out.write("</div>\n");
      out.write("</td>\n");
      out.write("<td>ð¢ Offer Title Here!</td>\n");
      out.write("<td>Up to 25% off on Grocery & Staples & much more</td>\n");
      out.write("<td><span class=\"badge-item badge-status\">Active</span></td>\n");
      out.write("<td class=\"action-btns\">\n");
      out.write("<a href=\"#\" class=\"edit-btn\"><i class=\"fas fa-edit\"></i> Edit</a>\n");
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td><input type=\"checkbox\" class=\"check-item\" name=\"ids[]\" value=\"1\"></td>\n");
      out.write("<td>\n");
      out.write("<div class=\"offer-img\">\n");
      out.write("<img src=\"images/offers/img-3.jpg\" alt=\"\">\n");
      out.write("</div>\n");
      out.write("</td>\n");
      out.write("<td>ð¢ Offer Title Here!</td>\n");
      out.write("<td>Up to 75% off on Personal Care & much more</td>\n");
      out.write("<td><span class=\"badge-item badge-status\">Active</span></td>\n");
      out.write("<td class=\"action-btns\">\n");
      out.write("<a href=\"#\" class=\"edit-btn\"><i class=\"fas fa-edit\"></i> Edit</a>\n");
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("</tbody>\n");
      out.write("</table>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</main>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "admin_footer.jsp", out, false);
      out.write("\n");
      out.write("</div>\n");
      out.write("<script src=\"js/jquery-3.4.1.min.js\"></script>\n");
      out.write("<script src=\"vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("<script src=\"js/scripts.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user_email == null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("    ");
        if (_jspx_meth_c_redirect_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_0, _jspx_page_context))
          return true;
        out.write('\n');
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }

  private boolean _jspx_meth_c_redirect_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:redirect
    org.apache.taglibs.standard.tag.rt.core.RedirectTag _jspx_th_c_redirect_0 = (org.apache.taglibs.standard.tag.rt.core.RedirectTag) _jspx_tagPool_c_redirect_url_nobody.get(org.apache.taglibs.standard.tag.rt.core.RedirectTag.class);
    _jspx_th_c_redirect_0.setPageContext(_jspx_page_context);
    _jspx_th_c_redirect_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_0);
    _jspx_th_c_redirect_0.setUrl("admin_login.jsp");
    int _jspx_eval_c_redirect_0 = _jspx_th_c_redirect_0.doStartTag();
    if (_jspx_th_c_redirect_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_redirect_url_nobody.reuse(_jspx_th_c_redirect_0);
      return true;
    }
    _jspx_tagPool_c_redirect_url_nobody.reuse(_jspx_th_c_redirect_0);
    return false;
  }
}
