package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("\t\t<meta charset=\"utf-8\">\n");
      out.write("\t\t<title>Login Form</title>\n");
      out.write("\t\t<style type=\"text/css\">\n");
      out.write("\n");
      out.write("                    header {\n");
      out.write("                      text-align: center;\n");
      out.write("                      color:#ffffff80;\n");
      out.write("                      border: 5px solid rgba(0,0,0,.5); \n");
      out.write("                      background: rgba(0,0,0,.5);\n");
      out.write("                      box-sizing: content-box;\n");
      out.write("                    }\n");
      out.write("                    \n");
      out.write("                </style>\n");
      out.write("                <link rel=\"stylesheet\" type=\"text/css\" href=\"res.css\">\n");
      out.write("                <link rel=\"stylesheet\" media=\"screen and (max-width: 1200px) and (min-width: 601px)\" href=\"res1.css\" />\n");
      out.write("                <link rel=\"stylesheet\" media=\"screen and (max-width: 600px) and (min-width: 351px)\" href=\"res2.css\" />\n");
      out.write("                <link rel=\"stylesheet\" media=\"screen and (max-width: 350px)\" href=\"res3.css\" />\n");
      out.write("                <script type=\"text/javascript\">\n");
      out.write("                        function myValidation(){\n");
      out.write(" \t\t\t        var uname = document.forms[\"myForm\"][\"uname\"];\n");
      out.write("                                var pwd = document.forms[\"myForm\"][\"pass\"];\n");
      out.write("                                var stat = document.forms[\"myForm\"][\"status\"];\n");
      out.write(" \t\t\t        var flag=true;\n");
      out.write(" \t\t\t\t\t\t\t   \n");
      out.write("                               if(uname.value==\"\"){\n");
      out.write("                               \t  alert(\"UserName cannot be empty\");\n");
      out.write("                               \t  uname.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                               \t  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(pwd.value==\"\"){\n");
      out.write("                               \t  alert(\"Password cannot be empty\");\n");
      out.write("                               \t  pwd.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                               \t  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(stat.value==\"\" || !(stat.value==\"student\" || stat.value==\"faculty\" || stat.value==\"admin\")){\n");
      out.write("                               \t  alert(\"Status is Invalid\");\n");
      out.write("                               \t  stat.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                               \t  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write(" \t\t\t       return flag;\n");
      out.write(" \t\t        }\n");
      out.write("\t\t</script>\n");
      out.write("\t</head>\n");
      out.write("\t<body>\n");
      out.write("\t\t<header>\n");
      out.write("                    <h1>Bus Management System</h1>\n");
      out.write("                </header>\n");
      out.write("\t\t<div class=\"loginBox\">\n");
      out.write("\t\t\t    <img src=\"user.png\" class=\"user\">\n");
      out.write("\t\t\t    <h2>Log In Here</h2>\n");
      out.write("                            <form name=\"myForm\" method=\"post\" action=\"UserLog\" onsubmit=\"return myValidation()\">\n");
      out.write("\t\t\t\t<p>User Name</p>\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"uname\" placeholder=\"User Name\">\n");
      out.write("\t\t\t\t<p>Password</p>\n");
      out.write("                                <input type=\"password\" name=\"pass\" placeholder=\"••••••\">\n");
      out.write("                                <p>Select Status</p><p>  </p>\n");
      out.write("                                <select name=\"status\">\n");
      out.write("                                <option value=\"default\" disabled selected>Status</option>\n");
      out.write("                                <option value=\"student\">Student</option>\n");
      out.write("                                <option value=\"faculty\">Faculty</option>\n");
      out.write("                                <option value=\"admin\">Admin</option>\n");
      out.write("                                </select><br><br>\t\t\t\t\t\t\t\n");
      out.write("                                <input type=\"submit\" name=\"submit\" value=\"Sign In\">\n");
      out.write("                                <a href=\"signup\">Not a Member ? SignUp Here</a>\n");
      out.write("                            </form>\n");
      out.write("\t\t</div>\n");
      out.write("\t</body>\n");
      out.write("</html>\n");
      out.write("\n");
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
