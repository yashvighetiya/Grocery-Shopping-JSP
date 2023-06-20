package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class add_005fmenu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<h2 class=\"mt-30 page-title\">Menu</h2>\n");
      out.write("<ol class=\"breadcrumb mb-30\">\n");
      out.write("<li class=\"breadcrumb-item\"><a href=\"index.jsp\">Dashboard</a></li>\n");
      out.write("<li class=\"breadcrumb-item\"><a href=\"menu.jsp\">Menu</a></li>\n");
      out.write("<li class=\"breadcrumb-item active\">Add Menu</li>\n");
      out.write("</ol>\n");
      out.write("<div class=\"row\">\n");
      out.write("<div class=\"col-lg-4 col-md-6\">\n");
      out.write("<div class=\"card card-static-2 mb-30\">\n");
      out.write("<div class=\"panel-group\" id=\"accordion\" role=\"tablist\" aria-multiselectable=\"true\">\n");
      out.write("<div class=\"panel panel-default\">\n");
      out.write("<div class=\"panel-heading\" role=\"tab\" id=\"headingOne\">\n");
      out.write("<div class=\"panel-title\">\n");
      out.write("<a data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#collapseOne\" aria-expanded=\"true\" aria-controls=\"collapseOne\">\n");
      out.write("Page\n");
      out.write("</a>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div id=\"collapseOne\" class=\"panel-collapse collapse show\" role=\"tabpanel\" aria-labelledby=\"headingOne\">\n");
      out.write("<div class=\"panel-body\">\n");
      out.write("<div class=\"menu-search\">\n");
      out.write("<input type=\"text\" class=\"form-control\" placeholder=\"Search...\">\n");
      out.write("</div>\n");
      out.write("<ul class=\"add-menu-list\">\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"1\">\n");
      out.write("Home Page\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"2\">\n");
      out.write("About Page\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"3\">\n");
      out.write("Offers Page\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("</ul>\n");
      out.write("<button class=\"save-btn hover-btn\" type=\"submit\">Add to Menu</button>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"panel panel-default\">\n");
      out.write("<div class=\"panel-heading\" role=\"tab\" id=\"headingTwo\">\n");
      out.write("<div class=\"panel-title\">\n");
      out.write("<a class=\"collapsed\" data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#collapseTwo\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">\n");
      out.write("New Products\n");
      out.write("</a>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\">\n");
      out.write("<div class=\"panel-body\">\n");
      out.write("<div class=\"menu-search\">\n");
      out.write("<input type=\"text\" class=\"form-control\" placeholder=\"Search...\">\n");
      out.write("</div>\n");
      out.write("<ul class=\"add-menu-list\">\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"1\">\n");
      out.write("Menu 1\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"2\">\n");
      out.write("Menu 2\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"3\">\n");
      out.write("Menu 3\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("</ul>\n");
      out.write("<button class=\"save-btn hover-btn\" type=\"submit\">Add to Menu</button>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"panel panel-default\">\n");
      out.write("<div class=\"panel-heading\" role=\"tab\" id=\"headingThree\">\n");
      out.write("<div class=\"panel-title\">\n");
      out.write("<a class=\"collapsed\" data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#collapseThree\" aria-expanded=\"false\" aria-controls=\"collapseThree\">\n");
      out.write("Featured Products\n");
      out.write("</a>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div id=\"collapseThree\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingThree\" style=\"\">\n");
      out.write("<div class=\"panel-body\">\n");
      out.write("<div class=\"menu-search\">\n");
      out.write("<input type=\"text\" class=\"form-control\" placeholder=\"Search...\">\n");
      out.write("</div>\n");
      out.write("<ul class=\"add-menu-list\">\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"1\">\n");
      out.write("Menu 1\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"2\">\n");
      out.write("Menu 2\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"3\">\n");
      out.write("Menu 3\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("</ul>\n");
      out.write("<button class=\"save-btn hover-btn\" type=\"submit\">Add to Menu</button>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"panel panel-default\">\n");
      out.write("<div class=\"panel-heading\" role=\"tab\" id=\"headingfour\">\n");
      out.write("<div class=\"panel-title\">\n");
      out.write("<a class=\"collapsed\" data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#collapsefour\" aria-expanded=\"false\" aria-controls=\"collapsefour\">\n");
      out.write("<i class=\"uil uil-check chck_icon\"></i>Pages\n");
      out.write("</a>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div id=\"collapsefour\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingfour\" style=\"\">\n");
      out.write("<div class=\"panel-body\">\n");
      out.write("<div class=\"menu-search\">\n");
      out.write("<input type=\"text\" class=\"form-control\" placeholder=\"Search...\">\n");
      out.write("</div>\n");
      out.write("<ul class=\"add-menu-list\">\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"1\">\n");
      out.write("Menu 1\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"2\">\n");
      out.write("Menu 2\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"3\">\n");
      out.write("Menu 3\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("</ul>\n");
      out.write("<button class=\"save-btn hover-btn\" type=\"submit\">Add to Menu</button>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"panel panel-default\">\n");
      out.write("<div class=\"panel-heading\" role=\"tab\" id=\"headingfive\">\n");
      out.write("<div class=\"panel-title\">\n");
      out.write("<a class=\"collapsed\" data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#collapsefive\" aria-expanded=\"false\" aria-controls=\"collapsefive\">\n");
      out.write("<i class=\"uil uil-check chck_icon\"></i>Blog\n");
      out.write("</a>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div id=\"collapsefive\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingfive\">\n");
      out.write("<div class=\"panel-body\">\n");
      out.write("<div class=\"menu-search\">\n");
      out.write("<input type=\"text\" class=\"form-control\" placeholder=\"Search...\">\n");
      out.write("</div>\n");
      out.write("<ul class=\"add-menu-list\">\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"1\">\n");
      out.write("Menu 1\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"2\">\n");
      out.write("Menu 2\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("<li>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"3\">\n");
      out.write("Menu 3\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</li>\n");
      out.write("</ul>\n");
      out.write("<button class=\"save-btn hover-btn\" type=\"submit\">Add to Menu</button>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"col-lg-8 col-md-6\">\n");
      out.write("<div class=\"card card-static-2 mb-30\">\n");
      out.write("<div class=\"card-title-2\">\n");
      out.write("<h4>Menu items</h4>\n");
      out.write("</div>\n");
      out.write("<div class=\"card-body-table\">\n");
      out.write("<div class=\"news-content-right pd-20\">\n");
      out.write("<div class=\"row\">\n");
      out.write("<div class=\"col-lg-6\">\n");
      out.write("<div class=\"panel-group-1\" id=\"accordion\" role=\"tablist\" aria-multiselectable=\"true\">\n");
      out.write("<div class=\"panel panel-default-1\">\n");
      out.write("<div class=\"panel-heading-1\" role=\"tab\" id=\"menu-1\">\n");
      out.write("<div class=\"panel-title-1\">\n");
      out.write("<a data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#collapseMenuOne\" aria-expanded=\"true\" aria-controls=\"collapseMenuOne\">\n");
      out.write("<span class=\"attr-menu-left\">Home Page</span>\n");
      out.write("<span class=\"attr-menu-right\">Page</span>\n");
      out.write("</a>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div id=\"collapseMenuOne\" class=\"panel-collapse collapse show\" role=\"tabpanel\" aria-labelledby=\"menu-1\">\n");
      out.write("<div class=\"panel-body-1\">\n");
      out.write("<div class=\"row\">\n");
      out.write("<div class=\"col-lg-12\">\n");
      out.write("<div class=\"menu-search\">\n");
      out.write("<label class=\"form-label\">Label*</label>\n");
      out.write("<input type=\"text\" class=\"form-control\" placeholder=\"Home Page\">\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"col-lg-6\">\n");
      out.write("<div class=\"menu-search\">\n");
      out.write("<label class=\"form-label\">Class*</label>\n");
      out.write("<input type=\"text\" class=\"form-control\" placeholder=\"\">\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"col-lg-6\">\n");
      out.write("<div class=\"menu-search\">\n");
      out.write("<label class=\"form-label\">target*</label>\n");
      out.write("<select id=\"status\" name=\"status\" class=\"form-control\">\n");
      out.write("<option selected>Normal</option>\n");
      out.write("<option value=\"1\">Open new tab</option>\n");
      out.write("</select>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"col-lg-12\">\n");
      out.write("<div class=\"bb-bottom\">\n");
      out.write("<a href=\"#\" class=\"menu-delete\">Delete</a>\n");
      out.write("<span class=\"attr-orgin-right\">Origin: <a target=\"_blank\">Page</a></span>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"col-lg-12\">\n");
      out.write("<div class=\"menu-configs\">\n");
      out.write("<h4>Menu Configs</h4>\n");
      out.write("<label class=\"control-label\">\n");
      out.write("<input type=\"checkbox\" value=\"primary\">\n");
      out.write("Primary\n");
      out.write("</label>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"menu-save-btn\">\n");
      out.write("<button class=\"save-btn hover-btn mt-0\" type=\"submit\">Save Menu</button>\n");
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
      out.write("\n");
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
