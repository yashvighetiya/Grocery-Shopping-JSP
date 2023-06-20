package org.apache.jsp.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.regex.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public final class sign_005fup_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_set_var_value_scope_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_redirect_url_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_remove_var_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_sql_setDataSource_var_user_url_scope_password_driver_nobody;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_sql_update_dataSource;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_set_var_value_scope_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_redirect_url_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_remove_var_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_sql_setDataSource_var_user_url_scope_password_driver_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_sql_update_dataSource = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_set_var_value_scope_nobody.release();
    _jspx_tagPool_c_redirect_url_nobody.release();
    _jspx_tagPool_c_remove_var_nobody.release();
    _jspx_tagPool_c_if_test.release();
    _jspx_tagPool_sql_setDataSource_var_user_url_scope_password_driver_nobody.release();
    _jspx_tagPool_sql_update_dataSource.release();
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      if (_jspx_meth_sql_setDataSource_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("﻿<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, shrink-to-fit=9\">\n");
      out.write("        <meta name=\"description\" content=\"Gambolthemes\">\n");
      out.write("        <meta name=\"author\" content=\"Gambolthemes\">\n");
      out.write("        <title>Gambo - Sign Up</title>\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" href=\"images/fav.png\">\n");
      out.write("\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link href='vendor/unicons-2.0.1/css/unicons.css' rel='stylesheet'>\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/responsive.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/night-mode.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/step-wizard.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <link href=\"vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"vendor/OwlCarousel/assets/owl.carousel.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"vendor/OwlCarousel/assets/owl.theme.default.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"vendor/semantic/semantic.min.css\">\n");
      out.write("        <script>\n");
      out.write("            var request;\n");
      out.write("            function sendInfo()\n");
      out.write("            {\n");
      out.write("                var v = document.vinform.fullname.value;\n");
      out.write("\n");
      out.write("                var url = \"select_username.jsp?val=\" + v;\n");
      out.write("\n");
      out.write("\n");
      out.write("                if (window.XMLHttpRequest) {\n");
      out.write("                    request = new XMLHttpRequest();\n");
      out.write("                } else if (window.ActiveXObject) {\n");
      out.write("                    request = new ActiveXObject(\"Microsoft.XMLHTTP\");\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                try {\n");
      out.write("                    request.onreadystatechange = function () {\n");
      out.write("                        // alert(1);\n");
      out.write("                        if (request.readyState == 4) {\n");
      out.write("                            var val = request.responseText;\n");
      out.write("                            document.getElementById('printoutput').innerHTML = val;\n");
      out.write("                        }\n");
      out.write("                    };\n");
      out.write("                    request.open(\"GET\", url, true);\n");
      out.write("                    request.send();\n");
      out.write("                } catch (e) {\n");
      out.write("                    alert(\"Unable to connect to server\");\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function getInfo() {\n");
      out.write("                if (request.readyState == 4) {\n");
      out.write("                    var val = request.responseText;\n");
      out.write("                    document.getElementById('amit').innerHTML = val;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"sign-inup\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row justify-content-center\">\n");
      out.write("                    <div class=\"col-lg-5\">\n");
      out.write("                        <div class=\"sign-form\">\n");
      out.write("                            <div class=\"sign-inner\">\n");
      out.write("                                <div class=\"sign-logo\" id=\"logo\">\n");
      out.write("                                    <a href=\"index.jsp\"><img src=\"images/logo.svg\" alt=\"\"></a>\n");
      out.write("                                    <a href=\"index.jsp\"><img class=\"logo-inverse\" src=\"images/dark-logo.svg\" alt=\"\"></a>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-dt\">\n");
      out.write("                                    <div class=\"form-inpts checout-address-step\">\n");
      out.write("                                        <form name=\"vinform\">  \n");
      out.write("                                            <div class=\"form-title\"><h6>Sign Up</h6></div>\n");
      out.write("                                            <div class=\"form-group pos_rel\">\n");
      out.write("                                                <input id=\"full[name]\" name=\"fullname\" type=\"text\" id=\"user_name\" placeholder=\"Full name\" onkeyup=\"sendInfo()\" class=\"form-control lgn_input\" required=\"\">\n");
      out.write("                                                <i class=\"uil uil-user-circle lgn_icon\"></i>\n");
      out.write("                                                <font color=\"red\"><div id=\"printoutput\"></div></font>\n");
      out.write("                                            </div>\n");
      out.write("\n");
      out.write("                                            <div class=\"form-group pos_rel\">\n");
      out.write("                                                <input id=\"phone[number]\" name=\"phone\" type=\"text\" placeholder=\"Phone Number\" class=\"form-control lgn_input\" required=\"\">\n");
      out.write("                                                <i class=\"uil uil-mobile-android-alt lgn_icon\"></i>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group pos_rel\">\n");
      out.write("                                                <input id=\"pass1\" name=\"password1\" type=\"password\" placeholder=\"New Password\" autocomplete=\"off\" class=\"form-control lgn_input\" required=\"\">\n");
      out.write("                                                <i class=\"uil uil-padlock lgn_icon\"></i>\n");
      out.write("                                            </div>\n");
      out.write("                                            <div class=\"form-group pos_rel\">\n");
      out.write("                                                <input id=\"password1\" name=\"password2\" type=\"password\" placeholder=\"Confrim Password\" class=\"form-control lgn_input\" required=\"\">\n");
      out.write("                                                <i class=\"uil uil-padlock lgn_icon\"></i>\n");
      out.write("                                            </div>\n");
      out.write("\n");
      out.write("                                            ");
      out.write("\n");
      out.write("                                            <script>\n");
      out.write("                                                var request1;\n");
      out.write("                                                $(document).ready(function () {\n");
      out.write("                                                    $(\"input\").focusout(function () {\n");
      out.write("                                                        if ($(pass1).val() == '') {\n");
      out.write("\n");
      out.write("                                                            $(pass1).css('border', 'solid 2px red');\n");
      out.write("                                                        } else {\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                            sendInfo1();\n");
      out.write("                                                            function sendInfo1()\n");
      out.write("                                                            {\n");
      out.write("                                                               // alert('sjdks');\n");
      out.write("                                                                var v1 = document.vinform.fullname.value;\n");
      out.write("\n");
      out.write("                                                                var url1 = \"password_validation.jsp?val1=\" + v1;\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                                if (window.XMLHttpRequest) {\n");
      out.write("                                                                    request1 = new XMLHttpRequest();\n");
      out.write("                                                                } else if (window.ActiveXObject) {\n");
      out.write("                                                                    request1 = new ActiveXObject(\"Microsoft.XMLHTTP\");\n");
      out.write("                                                                }\n");
      out.write("\n");
      out.write("                                                                try {\n");
      out.write("                                                                    request1.onreadystatechange = function () {\n");
      out.write("                                                                        \n");
      out.write("                                                                        if (request1.readyState == 4) {\n");
      out.write("                                                                            var val2 = request1.responseText;\n");
      out.write("                                                                             alert(val2);\n");
      out.write("                                                                            //document.getElementById('printoutput').innerHTML = val1;\n");
      out.write("                                                                        }\n");
      out.write("                                                                    };\n");
      out.write("                                                                    request1.open(\"GET\", url1, true);\n");
      out.write("                                                                    request1.send();\n");
      out.write("                                                                } catch (e) {\n");
      out.write("                                                                    alert(\"Unable to connect to server\");\n");
      out.write("                                                                }\n");
      out.write("                                                            }\n");
      out.write("\n");
      out.write("                                                            //$(pass1).css('border', 'solid 2px green');\t\n");
      out.write("                                                        }\n");
      out.write("                                                    }).trigger(\"focusout\");\n");
      out.write("                                                });\n");
      out.write("                                            </script>\n");
      out.write("\n");
      out.write("                                            ");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      _jspx_th_c_if_0.setPageContext(_jspx_page_context);
      _jspx_th_c_if_0.setParent(null);
      _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.sign_up_now.equals('signupnow')}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
      if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("\n");
          out.write("                                                ");
          //  c:if
          org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
          _jspx_th_c_if_1.setPageContext(_jspx_page_context);
          _jspx_th_c_if_1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_0);
          _jspx_th_c_if_1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.password1.equals(param.password2)}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
          int _jspx_eval_c_if_1 = _jspx_th_c_if_1.doStartTag();
          if (_jspx_eval_c_if_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
            do {
              out.write("\n");
              out.write("                                                    ");

                                                        Pattern pattern = Pattern.compile("[0-9]{10}");
                                                        Matcher matcher = pattern.matcher(request.getParameter("phone"));
                                                        boolean phone_valid = matcher.matches();
                                                        pageContext.setAttribute("phone_valid", phone_valid);

                                                        Pattern pattern1 = Pattern.compile("[0-9a-zA-Z@!#$%^&*()-=]{8,25}");
                                                        Matcher matcher1 = pattern1.matcher(request.getParameter("password1"));
                                                        boolean password_valid = matcher1.matches();
                                                        pageContext.setAttribute("password_valid", password_valid);

                                                        Pattern pattern2 = Pattern.compile("[a-zA-Z0-9@_#.]{3,25}");
                                                        Matcher matcher2 = pattern2.matcher(request.getParameter("fullname"));
                                                        boolean name_valid = matcher2.matches();
                                                        pageContext.setAttribute("name_valid", name_valid);

                                                        HttpSession session2 = request.getSession(true);
                                                        pageContext.setAttribute("user_email1", session2.getAttribute("e2"));
                                                    
              out.write("\n");
              out.write("\n");
              out.write("                                                    ");
              //  c:if
              org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
              _jspx_th_c_if_2.setPageContext(_jspx_page_context);
              _jspx_th_c_if_2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_1);
              _jspx_th_c_if_2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${phone_valid == true && password_valid == true && name_valid == true}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
              int _jspx_eval_c_if_2 = _jspx_th_c_if_2.doStartTag();
              if (_jspx_eval_c_if_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                do {
                  out.write("\n");
                  out.write("\n");
                  out.write("                                                        ");
                  out.write("\n");
                  out.write("                                                        ");

                                                            SecretKeySpec secretKey;
                                                            byte[] key;
                                                            final String ALGORITHM = "AES";

                                                            //preparesecretkey 
                                                            String myKey = "secrete";
                                                            MessageDigest sha = null;

                                                            key = myKey.getBytes(StandardCharsets.UTF_8);
                                                            sha = MessageDigest.getInstance("SHA-1");
                                                            key = sha.digest(key);
                                                            key = Arrays.copyOf(key, 16);
                                                            secretKey = new SecretKeySpec(key, ALGORITHM);
                                                            String encryptedString = "";
                                                            String stringtoencrypt = "";

                                                            //encrypt
                                                            try {
                                                                stringtoencrypt = request.getParameter("password1");
                                                                Cipher cipher = Cipher.getInstance(ALGORITHM);
                                                                cipher.init(Cipher.ENCRYPT_MODE, secretKey);
                                                                encryptedString = Base64.getEncoder().encodeToString(cipher.doFinal(stringtoencrypt.getBytes("UTF-8")));
                                                                pageContext.setAttribute("encryptedpass", encryptedString);
                                                            } catch (Exception e) {
                                                                out.println("Error while encrypting: " + e.toString());
                                                            }
                                                        
                  out.write("\n");
                  out.write("                                                        ");
                  if (_jspx_meth_sql_update_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_2, _jspx_page_context))
                    return;
                  out.write("\n");
                  out.write("\n");
                  out.write("                                                        ");
                  if (_jspx_meth_c_remove_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_2, _jspx_page_context))
                    return;
                  out.write("\n");
                  out.write("                                                        ");
                  if (_jspx_meth_c_remove_1((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_2, _jspx_page_context))
                    return;
                  out.write("\n");
                  out.write("                                                        ");
                  if (_jspx_meth_c_set_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_2, _jspx_page_context))
                    return;
                  out.write("\n");
                  out.write("                                                        ");
                  if (_jspx_meth_c_set_1((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_2, _jspx_page_context))
                    return;
                  out.write("\n");
                  out.write("                                                        ");
                  if (_jspx_meth_c_redirect_0((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_2, _jspx_page_context))
                    return;
                  out.write("\n");
                  out.write("\n");
                  out.write("                                                    ");
                  int evalDoAfterBody = _jspx_th_c_if_2.doAfterBody();
                  if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                    break;
                } while (true);
              }
              if (_jspx_th_c_if_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
                return;
              }
              _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
              out.write("\n");
              out.write("\n");
              out.write("                                                ");
              int evalDoAfterBody = _jspx_th_c_if_1.doAfterBody();
              if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                break;
            } while (true);
          }
          if (_jspx_th_c_if_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
            _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
            return;
          }
          _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
          out.write("\n");
          out.write("\n");
          out.write("                                            ");
          int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
        return;
      }
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      out.write("\n");
      out.write("                                            ");
      out.write("\n");
      out.write("\n");
      out.write("                                            <button class=\"login-btn hover-btn\" type=\"submit\" name=\"sign_up_now\" value=\"signupnow\">Sign Up Now</button>\n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"signup-link\">\n");
      out.write("                                        <p>I have an account? - <a href=\"sign_in.jsp\">Sign In Now</a></p>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"copyright-text text-center mt-3\">\n");
      out.write("                            <i class=\"uil uil-copyright\"></i>Copyright 2022 <b>Gambolthemes</b> . All rights reserved\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <script src=\"js/jquery-3.3.1.min.js\"></script>\n");
      out.write("        <script src=\"vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("        <script src=\"vendor/OwlCarousel/owl.carousel.js\"></script>\n");
      out.write("        <script src=\"vendor/semantic/semantic.min.js\"></script>\n");
      out.write("        <script src=\"js/jquery.countdown.min.js\"></script>\n");
      out.write("        <script src=\"js/custom.js\"></script>\n");
      out.write("        <script src=\"js/product.thumbnail.slider.js\"></script>\n");
      out.write("        <script src=\"js/offset_overlay.js\"></script>\n");
      out.write("        <script src=\"js/night-mode.js\"></script>\n");
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

  private boolean _jspx_meth_sql_update_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  sql:update
    org.apache.taglibs.standard.tag.rt.sql.UpdateTag _jspx_th_sql_update_0 = (org.apache.taglibs.standard.tag.rt.sql.UpdateTag) _jspx_tagPool_sql_update_dataSource.get(org.apache.taglibs.standard.tag.rt.sql.UpdateTag.class);
    _jspx_th_sql_update_0.setPageContext(_jspx_page_context);
    _jspx_th_sql_update_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_2);
    _jspx_th_sql_update_0.setDataSource((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${db}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    int[] _jspx_push_body_count_sql_update_0 = new int[] { 0 };
    try {
      int _jspx_eval_sql_update_0 = _jspx_th_sql_update_0.doStartTag();
      if (_jspx_eval_sql_update_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        if (_jspx_eval_sql_update_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
          out = _jspx_page_context.pushBody();
          _jspx_push_body_count_sql_update_0[0]++;
          _jspx_th_sql_update_0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
          _jspx_th_sql_update_0.doInitBody();
        }
        do {
          out.write("\n");
          out.write("                                                            insert into users(user_name,user_password,user_contact,user_email) values(\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.fullname}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\",\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${encryptedpass}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\",\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.phone}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\",\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${user_email1}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\");\n");
          out.write("                                                        ");
          int evalDoAfterBody = _jspx_th_sql_update_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
        if (_jspx_eval_sql_update_0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE)
          out = _jspx_page_context.popBody();
          _jspx_push_body_count_sql_update_0[0]--;
      }
      if (_jspx_th_sql_update_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_sql_update_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_sql_update_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_sql_update_0.doFinally();
      _jspx_tagPool_sql_update_dataSource.reuse(_jspx_th_sql_update_0);
    }
    return false;
  }

  private boolean _jspx_meth_c_remove_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:remove
    org.apache.taglibs.standard.tag.common.core.RemoveTag _jspx_th_c_remove_0 = (org.apache.taglibs.standard.tag.common.core.RemoveTag) _jspx_tagPool_c_remove_var_nobody.get(org.apache.taglibs.standard.tag.common.core.RemoveTag.class);
    _jspx_th_c_remove_0.setPageContext(_jspx_page_context);
    _jspx_th_c_remove_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_2);
    _jspx_th_c_remove_0.setVar("user_name");
    int _jspx_eval_c_remove_0 = _jspx_th_c_remove_0.doStartTag();
    if (_jspx_th_c_remove_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_remove_var_nobody.reuse(_jspx_th_c_remove_0);
      return true;
    }
    _jspx_tagPool_c_remove_var_nobody.reuse(_jspx_th_c_remove_0);
    return false;
  }

  private boolean _jspx_meth_c_remove_1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:remove
    org.apache.taglibs.standard.tag.common.core.RemoveTag _jspx_th_c_remove_1 = (org.apache.taglibs.standard.tag.common.core.RemoveTag) _jspx_tagPool_c_remove_var_nobody.get(org.apache.taglibs.standard.tag.common.core.RemoveTag.class);
    _jspx_th_c_remove_1.setPageContext(_jspx_page_context);
    _jspx_th_c_remove_1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_2);
    _jspx_th_c_remove_1.setVar("cart_email");
    int _jspx_eval_c_remove_1 = _jspx_th_c_remove_1.doStartTag();
    if (_jspx_th_c_remove_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_remove_var_nobody.reuse(_jspx_th_c_remove_1);
      return true;
    }
    _jspx_tagPool_c_remove_var_nobody.reuse(_jspx_th_c_remove_1);
    return false;
  }

  private boolean _jspx_meth_c_set_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_scope_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_0.setPageContext(_jspx_page_context);
    _jspx_th_c_set_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_2);
    _jspx_th_c_set_0.setScope("application");
    _jspx_th_c_set_0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.fullname}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_set_0.setVar("user_name");
    int _jspx_eval_c_set_0 = _jspx_th_c_set_0.doStartTag();
    if (_jspx_th_c_set_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_scope_nobody.reuse(_jspx_th_c_set_0);
      return true;
    }
    _jspx_tagPool_c_set_var_value_scope_nobody.reuse(_jspx_th_c_set_0);
    return false;
  }

  private boolean _jspx_meth_c_set_1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_set_1 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _jspx_tagPool_c_set_var_value_scope_nobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_set_1.setPageContext(_jspx_page_context);
    _jspx_th_c_set_1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_2);
    _jspx_th_c_set_1.setVar("cart_email");
    _jspx_th_c_set_1.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.user_email1}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_set_1.setScope("session");
    int _jspx_eval_c_set_1 = _jspx_th_c_set_1.doStartTag();
    if (_jspx_th_c_set_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_set_var_value_scope_nobody.reuse(_jspx_th_c_set_1);
      return true;
    }
    _jspx_tagPool_c_set_var_value_scope_nobody.reuse(_jspx_th_c_set_1);
    return false;
  }

  private boolean _jspx_meth_c_redirect_0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_2, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:redirect
    org.apache.taglibs.standard.tag.rt.core.RedirectTag _jspx_th_c_redirect_0 = (org.apache.taglibs.standard.tag.rt.core.RedirectTag) _jspx_tagPool_c_redirect_url_nobody.get(org.apache.taglibs.standard.tag.rt.core.RedirectTag.class);
    _jspx_th_c_redirect_0.setPageContext(_jspx_page_context);
    _jspx_th_c_redirect_0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_2);
    _jspx_th_c_redirect_0.setUrl("index.jsp");
    int _jspx_eval_c_redirect_0 = _jspx_th_c_redirect_0.doStartTag();
    if (_jspx_th_c_redirect_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_redirect_url_nobody.reuse(_jspx_th_c_redirect_0);
      return true;
    }
    _jspx_tagPool_c_redirect_url_nobody.reuse(_jspx_th_c_redirect_0);
    return false;
  }
}
