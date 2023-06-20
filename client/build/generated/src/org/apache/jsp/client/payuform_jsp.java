package org.apache.jsp.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.security.*;

public final class payuform_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    public boolean empty(String s) {
        if (s == null || s.trim().equals("")) {
            return true;
        } else {
            return false;
        }
    }


    public String hashCal(String type, String str) {
        byte[] hashseq = str.getBytes();
        StringBuffer hexString = new StringBuffer();
        try {
            MessageDigest algorithm = MessageDigest.getInstance(type);
            algorithm.reset();
            algorithm.update(hashseq);
            byte messageDigest[] = algorithm.digest();

            for (int i = 0; i < messageDigest.length; i++) {
                String hex = Integer.toHexString(0xFF & messageDigest[i]);
                if (hex.length() == 1) {
                    hexString.append("0");
                }
                hexString.append(hex);
            }

        } catch (NoSuchAlgorithmException nsae) {
        }

        return hexString.toString();

    }

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_sql_setDataSource_var_user_url_scope_password_driver_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_sql_query_var_dataSource;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_sql_setDataSource_var_user_url_scope_password_driver_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_sql_query_var_dataSource = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_sql_setDataSource_var_user_url_scope_password_driver_nobody.release();
    _jspx_tagPool_sql_query_var_dataSource.release();
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
      out.write('\n');
      out.write('\n');

    String merchant_key = "1qnGeZBD";
    String salt = "TCXU2ZJSKP";
    String action1 = "";
    String base_url = "https://sandboxsecure.payu.in";
    int error = 0;
    String hashString = "";

    Enumeration paramNames = request.getParameterNames();
    Map<String, String> params = new HashMap<String, String>();
    while (paramNames.hasMoreElements()) {
        String paramName = (String) paramNames.nextElement();

        String paramValue = request.getParameter(paramName);

        params.put(paramName, paramValue);
    }
    String txnid = "";
    if (empty(params.get("txnid"))) {
        Random rand = new Random();
        String rndm = Integer.toString(rand.nextInt()) + (System.currentTimeMillis() / 1000L);
        txnid = hashCal("SHA-256", rndm).substring(0, 20);
    } else {
        txnid = params.get("txnid");
    }
    //udf2 = txnid;
    String txn = "abcd";
    String hash = "";
    String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
    if (empty(params.get("hash")) && params.size() > 0) {
        if (empty(params.get("key"))
                || empty(params.get("txnid"))
                || empty(params.get("amount"))
                || empty(params.get("firstname"))
                || empty(params.get("email"))
                || empty(params.get("phone"))
                || empty(params.get("productinfo"))
                || empty(params.get("surl"))
                || empty(params.get("furl"))
                || empty(params.get("service_provider"))) {
            error = 1;
        } else {
            String[] hashVarSeq = hashSequence.split("\\|");

            for (String part : hashVarSeq) {
                hashString = (empty(params.get(part))) ? hashString.concat("") : hashString.concat(params.get(part));
                hashString = hashString.concat("|");
            }
            hashString = hashString.concat(salt);

            hash = hashCal("SHA-512", hashString);
            action1 = base_url.concat("/_payment");
        }
    } else if (!empty(params.get("hash"))) {
        hash = params.get("hash");
        action1 = base_url.concat("/_payment");
    }



      out.write("\n");
      out.write("<html>\n");
      out.write("    <style>\n");
      out.write("        td,tr\n");
      out.write("        {\n");
      out.write("            font-size: 22px;\n");
      out.write("        }\n");
      out.write("        input[type=submit]\n");
      out.write("        {\n");
      out.write("            font-size: 30px;\n");
      out.write("        }\n");
      out.write("        input\n");
      out.write("        {\n");
      out.write("            font-size: 20px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <script>\n");
      out.write("        var hash = '");
      out.print( hash);
      out.write("';\n");
      out.write("        function submitPayuForm() {\n");
      out.write("\n");
      out.write("            if (hash == '')\n");
      out.write("                return;\n");
      out.write("\n");
      out.write("            var payuForm = document.forms.payuForm;\n");
      out.write("            payuForm.submit();\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("    <body onload=\"submitPayuForm();\">\n");
      out.write("\n");
      out.write("       ");
      if (_jspx_meth_sql_setDataSource_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("        ");
      if (_jspx_meth_sql_query_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("        <form action=\"");
      out.print( action1);
      out.write("\" method=\"post\" name=\"payuForm\">\n");
      out.write("            <input type=\"hidden\" name=\"key\" value=\"");
      out.print( merchant_key);
      out.write("\" />\n");
      out.write("            <input type=\"hidden\" name=\"hash\" value=\"");
      out.print( hash);
      out.write("\"/>\n");
      out.write("            <input type=\"hidden\" name=\"txnid\" value=\"");
      out.print( txnid);
      out.write("\" />\n");
      out.write("            <input type=\"hidden\" name=\"udf2\" value=\"");
      out.print( txnid);
      out.write("\" />\n");
      out.write("            <input type=\"hidden\" name=\"service_provider\" value=\"payu_paisa\" />\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <td><b>Mandatory Parameters</b></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Amount: </td>\n");
      out.write("                    <td><input name=\"amount\" readonly=\"\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${order_master.rows[0].grand_total}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required=\"\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>First Name: </td>\n");
      out.write("                    <td><input name=\"firstname\" readonly=\"\" id=\"firstname\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${order_master.rows[0].user_name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required=\"\"/></td>\n");
      out.write("                </tr>            \n");
      out.write("                <tr>\n");
      out.write("                    <td>Email: </td>\n");
      out.write("                    <td><input name=\"email\" readonly=\"\" id=\"email\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${order_master.rows[0].user_email}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required=\"\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Phone: </td>\n");
      out.write("                    <td><input name=\"phone\"  readonly=\"\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${order_master.rows[0].phone_no}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" required=\"\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Product Info: </td>\n");
      out.write("                    <td colspan=\"3\"><input name=\"productinfo\"  readonly=\"\" value=\"");
      out.print( (empty(params.get("productinfo"))) ? "" : params.get("productinfo"));
      out.write("\" size=\"64\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Success URI: </td>\n");
      out.write("                    <td colspan=\"3\"><input name=\"surl\" readonly=\"\" value=\"");
      out.print( (empty(params.get("surl"))) ? "http://localhost:8080/gambo/client/success.jsp" : params.get("surl"));
      out.write("\" size=\"64\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Failure URI: </td>\n");
      out.write("                    <td colspan=\"3\"><input name=\"furl\" readonly=\"\" value=\"");
      out.print( (empty(params.get("furl"))) ? "http://localhost:8080/gambo/client/failure.jsp" : params.get("furl"));
      out.write("\" size=\"64\" /></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><b>Optional Parameters</b></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>             \n");
      out.write("                    <td>Cancel URI: </td>\n");
      out.write("                    <td><input name=\"curl\" value=\"http://localhost:8080/Project_Menu/project_client/order_details.jsp\" size=\"64\" /></td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    ");
 if (empty(hash)) { 
      out.write("\n");
      out.write("                    <td colspan=\"4\"><input type=\"submit\" value=\"Submit\" /></td>\n");
      out.write("                        ");
 }
      out.write("\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
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

  private boolean _jspx_meth_sql_setDataSource_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  sql:setDataSource
    org.apache.taglibs.standard.tag.rt.sql.SetDataSourceTag _jspx_th_sql_setDataSource_0 = (org.apache.taglibs.standard.tag.rt.sql.SetDataSourceTag) _jspx_tagPool_sql_setDataSource_var_user_url_scope_password_driver_nobody.get(org.apache.taglibs.standard.tag.rt.sql.SetDataSourceTag.class);
    _jspx_th_sql_setDataSource_0.setPageContext(_jspx_page_context);
    _jspx_th_sql_setDataSource_0.setParent(null);
    _jspx_th_sql_setDataSource_0.setDriver("com.mysql.jdbc.Driver");
    _jspx_th_sql_setDataSource_0.setUrl("jdbc:mysql:///gambosupermarket");
    _jspx_th_sql_setDataSource_0.setPassword("");
    _jspx_th_sql_setDataSource_0.setUser("root");
    _jspx_th_sql_setDataSource_0.setVar("db");
    _jspx_th_sql_setDataSource_0.setScope("session");
    int _jspx_eval_sql_setDataSource_0 = _jspx_th_sql_setDataSource_0.doStartTag();
    if (_jspx_th_sql_setDataSource_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_sql_setDataSource_var_user_url_scope_password_driver_nobody.reuse(_jspx_th_sql_setDataSource_0);
      return true;
    }
    _jspx_tagPool_sql_setDataSource_var_user_url_scope_password_driver_nobody.reuse(_jspx_th_sql_setDataSource_0);
    return false;
  }

  private boolean _jspx_meth_sql_query_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  sql:query
    org.apache.taglibs.standard.tag.rt.sql.QueryTag _jspx_th_sql_query_0 = (org.apache.taglibs.standard.tag.rt.sql.QueryTag) _jspx_tagPool_sql_query_var_dataSource.get(org.apache.taglibs.standard.tag.rt.sql.QueryTag.class);
    _jspx_th_sql_query_0.setPageContext(_jspx_page_context);
    _jspx_th_sql_query_0.setParent(null);
    _jspx_th_sql_query_0.setDataSource((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${db}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_sql_query_0.setVar("order_master");
    int[] _jspx_push_body_count_sql_query_0 = new int[] { 0 };
    try {
      int _jspx_eval_sql_query_0 = _jspx_th_sql_query_0.doStartTag();
      if (_jspx_eval_sql_query_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        if (_jspx_eval_sql_query_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
          out = _jspx_page_context.pushBody();
          _jspx_push_body_count_sql_query_0[0]++;
          _jspx_th_sql_query_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
          _jspx_th_sql_query_0.doInitBody();
        }
        do {
          out.write("\n");
          out.write("                SELECT * FROM `order_master` ORDER BY `invoice_no` DESC LIMIT 1;  \n");
          out.write("        ");
          int evalDoAfterBody = _jspx_th_sql_query_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
        if (_jspx_eval_sql_query_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
          out = _jspx_page_context.popBody();
          _jspx_push_body_count_sql_query_0[0]--;
      }
      if (_jspx_th_sql_query_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_sql_query_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_sql_query_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_sql_query_0.doFinally();
      _jspx_tagPool_sql_query_var_dataSource.reuse(_jspx_th_sql_query_0);
    }
    return false;
  }
}
