package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class add_005fpage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<h2 class=\"mt-30 page-title\">Pages</h2>\n");
      out.write("<ol class=\"breadcrumb mb-30\">\n");
      out.write("<li class=\"breadcrumb-item\"><a href=\"index.jsp\">Dashboard</a></li>\n");
      out.write("<li class=\"breadcrumb-item\"><a href=\"pages.jsp\">Pages</a></li>\n");
      out.write("<li class=\"breadcrumb-item active\">Add Page</li>\n");
      out.write("</ol>\n");
      out.write("<div class=\"row\">\n");
      out.write("<div class=\"col-lg-9 col-md-8\">\n");
      out.write("<div class=\"card card-static-2 mb-30\">\n");
      out.write("<div class=\"card-title-2\">\n");
      out.write("<h4>Page Content</h4>\n");
      out.write("</div>\n");
      out.write("<div class=\"card-body-table\">\n");
      out.write("<div class=\"post-form\">\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"form-label\">Title*</label>\n");
      out.write("<input type=\"text\" class=\"form-control\" placeholder=\"Page title here\">\n");
      out.write("</div>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"form-label\">Content*</label>\n");
      out.write("<div class=\"card card-editor\">\n");
      out.write("<div class=\"content-editor\">\n");
      out.write("<div id='edit'></div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write(" </div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"card card-static-2 mb-30\">\n");
      out.write("<div class=\"card-title-2\">\n");
      out.write("<h4>Seo Manage</h4>\n");
      out.write("</div>\n");
      out.write("<div class=\"card-body-table\">\n");
      out.write("<div class=\"post-form\">\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"form-label\">Allow search engines to show this service in search results*</label>\n");
      out.write("<select id=\"seo\" name=\"seo\" class=\"form-control\">\n");
      out.write("<option selected>Yes</option>\n");
      out.write("<option value=\"1\">No</option>\n");
      out.write("</select>\n");
      out.write("</div>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"form-label\">Seo Title*</label>\n");
      out.write("<input type=\"text\" class=\"form-control\" placeholder=\"Seo title here\">\n");
      out.write("</div>\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<label class=\"form-label\">Seo Content*</label>\n");
      out.write("<div class=\"card card-editor\">\n");
      out.write("<div class=\"content-editor\">\n");
      out.write("<textarea class=\"text-control\" placeholder=\"Enter Description\"></textarea>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"col-lg-3 col-md-4\">\n");
      out.write("<div class=\"card card-static-2 mb-30\">\n");
      out.write("<div class=\"card-title-2\">\n");
      out.write("<h4>Publish</h4>\n");
      out.write("</div>\n");
      out.write("<div class=\"card-body-table\">\n");
      out.write("<div class=\"news-content-right pd-20\">\n");
      out.write("<div class=\"custom-control custom-radio\">\n");
      out.write("<input type=\"radio\" id=\"customRadio1\" name=\"customRadio\" class=\"custom-control-input\">\n");
      out.write("<label class=\"custom-control-label\" for=\"customRadio1\">Publish</label>\n");
      out.write("</div>\n");
      out.write("<div class=\"custom-control custom-radio\">\n");
      out.write("<input type=\"radio\" id=\"customRadio2\" name=\"customRadio\" class=\"custom-control-input\">\n");
      out.write("<label class=\"custom-control-label\" for=\"customRadio2\">Draft</label>\n");
      out.write("</div>\n");
      out.write("<button class=\"save-btn hover-btn\" type=\"submit\">Save Changes</button>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"card card-static-2 mb-30\">\n");
      out.write("<div class=\"card-title-2\">\n");
      out.write("<h4>Template Setting</h4>\n");
      out.write("</div>\n");
      out.write("<div class=\"card-body-table\">\n");
      out.write("<div class=\"news-content-right pd-20\">\n");
      out.write("<div class=\"form-group\">\n");
      out.write("<select id=\"categeory\" name=\"categeory\" class=\"form-control\">\n");
      out.write("<option selected>--Select--</option>\n");
      out.write("<option value=\"1\">Homepage</option>\n");
      out.write("<option value=\"2\">Offers</option>\n");
      out.write("<option value=\"3\">Career</option>\n");
      out.write("<option value=\"4\">Blog</option>\n");
      out.write("<option value=\"5\">Products</option>\n");
      out.write("</select>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"card card-static-2 mb-30\">\n");
      out.write("<div class=\"card-title-2\">\n");
      out.write("<h4>Featured Image</h4>\n");
      out.write("</div>\n");
      out.write("<div class=\"card-body-table\">\n");
      out.write("<div class=\"news-content-right pd-20 text-center\">\n");
      out.write("<div class=\"fea-img\">\n");
      out.write("<img src=\"images/featured-img.jpg\" alt=\"\">\n");
      out.write("<div class=\"img-add\">\n");
      out.write("<input type=\"file\" id=\"file\">\n");
      out.write("<label for=\"file\">Upload Image</label>\n");
      out.write("</div>\n");
      out.write("</div>\n");
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
      out.write("\n");
      out.write("<script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/froala_editor.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/align.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/code_beautifier.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/code_view.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/colors.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/emoticons.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/draggable.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/font_size.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/font_family.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/image.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/file.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/image_manager.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/line_breaker.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/link.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/lists.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/paragraph_format.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/paragraph_style.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/video.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/table.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/url.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/entities.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/char_counter.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/inline_style.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/save.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/fullscreen.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"vendor/froala_editor_3.1.1/js/plugins/quote.min.js\"></script>\n");
      out.write("<script>\n");
      out.write("\t\t\t(function () {\n");
      out.write("\t\t\t  new FroalaEditor(\"#edit\", {\n");
      out.write("\t\t\t\tzIndex: 10\n");
      out.write("\t\t\t  })\n");
      out.write("\t\t\t})()\n");
      out.write("\t\t</script>\n");
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
