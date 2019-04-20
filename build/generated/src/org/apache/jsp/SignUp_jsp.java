package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Modal.StoppageInfo;
import java.util.ArrayList;
import Modal.StoppageInfoDAO;

public final class SignUp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>  \n");
      out.write("   <head>\n");
      out.write("        <title>Sign Up</title>    \n");
      out.write("    <style>\n");
      out.write("    \n");
      out.write("        *{\n");
      out.write("            margin: 0; \n");
      out.write("            padding: 0;\n");
      out.write("        }\n");
      out.write("        body{\n");
      out.write("              background-image: url(t.jpg);\n");
      out.write("              -webkit-background-size:cover;\n");
      out.write("              background-size: cover;\n");
      out.write("              background-position: center center;\n");
      out.write("              background-repeat: repeat;\n");
      out.write("              background-attachment: fixed;\n");
      out.write("              background-color: #999;\n");
      out.write("              height: 100%;\n");
      out.write("              margin: 0;\n");
      out.write("              font-family: Arial, Helvetica, sans-serif;\n");
      out.write("          }\n");
      out.write("\n");
      out.write("        header {\n");
      out.write("          text-align: center;\n");
      out.write("          color:#ffffff80;\n");
      out.write("          border: 5px solid rgba(0,0,0,.5); \n");
      out.write("          background: rgba(0,0,0,.5);\n");
      out.write("          box-sizing: content-box;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        .form-wrap{ \n");
      out.write("            width: 420px; \n");
      out.write("            height:783px;\n");
      out.write("            background: rgba(0,0,0,.5);\n");
      out.write("            padding: 40px 20px; \n");
      out.write("            border: 5px solid rgba(0,0,0,.5);\n");
      out.write("            box-sizing: border-box; \n");
      out.write("            position: absolute; \n");
      out.write("            left: 50%; \n");
      out.write("            top: 75%; \n");
      out.write("            transform: translate(-50%, -50%);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h1{\n");
      out.write("            text-align: center; \n");
      out.write("            color: #fff; \n");
      out.write("            font-weight: normal; \n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        input{\n");
      out.write("            width: 100%; \n");
      out.write("            background: transparent; \n");
      out.write("            border: 1px solid #f1f1f1; \n");
      out.write("            border-radius: 3px; \n");
      out.write("            padding: 6px 15px; \n");
      out.write("            box-sizing: border-box; \n");
      out.write("            margin-bottom: 20px; \n");
      out.write("            font-size: 16px; \n");
      out.write("            color: #fff;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-wrap select\n");
      out.write("        {\n");
      out.write("            border: 1px solid #f1f1f1; \n");
      out.write("            border-radius: 3px; \n");
      out.write("            padding: 6px 15px; \n");
      out.write("            box-sizing: border-box; \n");
      out.write("            margin-bottom: 20px; \n");
      out.write("            background: none;\n");
      out.write("            outline: none;\n");
      out.write("            width:100%;\n");
      out.write("            color:#fff;\n");
      out.write("            height: 40px;\n");
      out.write("            font-size: 16px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-wrap option{\n");
      out.write("            color:black;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-wrap option[value=\"\"][disabled] {\n");
      out.write("          display: none;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input[type=\"submit\"]{ \n");
      out.write("            background: #bac675;\n");
      out.write("            border: 0; \n");
      out.write("            cursor: pointer; \n");
      out.write("            color: #3e3d3d;\n");
      out.write("        }\n");
      out.write("        input[type=\"button\"]:hover{ \n");
      out.write("            background: #a4b15c; \n");
      out.write("            transition: .6s;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        ::placeholder{\n");
      out.write("            color: #fff;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-wrap a\n");
      out.write("        {\n");
      out.write("          color: #fff;\n");
      out.write("          font-size: 14px;\n");
      out.write("          font-weight: bold;\n");
      out.write("          text-decoration: none;\n");
      out.write("        }\n");
      out.write("      \n");
      out.write("    </style>\n");
      out.write("\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("                             function myValidation(){\n");
      out.write("                               var fname = document.forms[\"myForm\"][\"fname\"];\n");
      out.write("                               var lname = document.forms[\"myForm\"][\"lname\"];\n");
      out.write("                               var branch = document.forms[\"myForm\"][\"branch\"];\n");
      out.write("                               var rno = document.forms[\"myForm\"][\"rno\"];\n");
      out.write("                               var email = document.forms[\"myForm\"][\"email\"];\n");
      out.write("                               var pwd = document.forms[\"myForm\"][\"pwd\"];\n");
      out.write("                               var cpwd = document.forms[\"myForm\"][\"cpwd\"];\n");
      out.write("                               var stat = document.forms[\"myForm\"][\"status\"];\n");
      out.write("                               var pick = document.forms[\"myForm\"][\"PickUppoint\"];\n");
      out.write("                               var mob = document.forms[\"myForm\"][\"mobile\"];\n");
      out.write("                               var mailformat = /^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$/;\n");
      out.write("                               var flag=true;\n");
      out.write("                               \n");
      out.write("                               if(fname.value==\"\"){\n");
      out.write("                                  alert(\"First Name cannot be empty\");\n");
      out.write("                                  fname.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                                  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(lname.value==\"\"){\n");
      out.write("                                  alert(\"Last Name cannot be empty\");\n");
      out.write("                                  lname.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                                  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(branch.value==\"\" || !(branch.value==\"CSE\" || branch.value==\"ECE\" || branch.value==\"CE\" || branch.value==\"ME\" )){\n");
      out.write("                                  alert(\"Branch is Invalid or Empty\");\n");
      out.write("                                  branch.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                                  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(rno.value==\"\"){\n");
      out.write("                                alert(\"Roll No. cannot be empty\");\n");
      out.write("                                flag=false;\n");
      out.write("                                rno.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(email.value==\"\"|| !(email.value.match(mailformat)))\n");
      out.write("                               {\n");
      out.write("                                 alert(\"Email cannot be Empty or Invalid\");\n");
      out.write("                                 email.style.border = 2+\"px\"+\" solid red\";\n");
      out.write("                                 flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(pick.value==\"\" || !(pick.value==\"Panchkula\" || pick.value==\"Zirakpur\" || pick.value==\"Dhakoli\" || pick.value==\"Amravati\" || pick.value==\"Pinjore\" || pick.value==\"HMT\")){\n");
      out.write("                                  alert(\"Pick-Up Point is Invalid\");\n");
      out.write("                                  pick.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                                  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(pwd.value==\"\"){\n");
      out.write("                                  alert(\"Password cannot be Empty\");\n");
      out.write("                                  pwd.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                                  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(cpwd.value==\"\"){\n");
      out.write("                                  alert(\"Conform Password cannot be Empty\");\n");
      out.write("                                  cpwd.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                                  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(pwd.value!=cpwd.value){\n");
      out.write("                                  alert(\"Password and Conform Password must be same\");\n");
      out.write("                                  pwd.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                                  cpwd.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                                  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(mob.value==\"\" || isNaN(mob.value) || mob.value.length !=10)\n");
      out.write("                               {\n");
      out.write("                                  alert(\"Mobile Number is Invalid\");\n");
      out.write("                                  mob.style.border=2+\"px\"+\" solid red\";\n");
      out.write("                                  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("                               if(stat.value==\"\" || !(stat.value==\"student\" || stat.value==\"faculty\" || stat.value==\"admin\")){\n");
      out.write("                                  alert(\"Status is Invalid\");\n");
      out.write("                                  stat.style.border= 2+\"px\"+\" solid red\";\n");
      out.write("                                  flag=false;\n");
      out.write("                               }\n");
      out.write("\n");
      out.write("\n");
      out.write("                               return flag;\n");
      out.write("                             }\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("    <link rel=\"stylesheet\" media=\"screen and (max-width: 1200px) and (min-width: 601px)\" href=\"res1.css\" />\n");
      out.write("    <link rel=\"stylesheet\" media=\"screen and (max-width: 600px) and (min-width: 351px)\" href=\"res2.css\" />\n");
      out.write("    <link rel=\"stylesheet\" media=\"screen and (max-width: 350px)\" href=\"res3.css\" />\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <header>\n");
      out.write("            <h1>Bus Management System</h1>\n");
      out.write("        </header>\n");
      out.write("        <div class=\"form-wrap\">\n");
      out.write("        \n");
      out.write("            <form action=\"UserSignUp\" name=\"myForm\" method=\"post\" onsubmit=\"return myValidation()\">\n");
      out.write("                <h1>Sign Up</h1>\n");
      out.write("                <input type=\"text\" name=\"fname\" placeholder=\"First Name\">\n");
      out.write("                <input type=\"text\" name=\"lname\" placeholder=\"Last Name\">\n");
      out.write("                <input type=\"text\" name=\"rno\" placeholder=\"Roll Number OR EmpId\">\n");
      out.write("                <select name=\"branch\">\n");
      out.write("                <option value=\"default\" disabled selected>Branch</option>\n");
      out.write("                <option value=\"CSE\">CSE</option>\n");
      out.write("                <option value=\"ECE\">ECE</option>\n");
      out.write("                <option value=\"CE\">CE</option>\n");
      out.write("                </select>\n");
      out.write("                <input type=\"text\" name=\"email\" placeholder=\"Email\">\n");
      out.write("                <select name=\"status\">\n");
      out.write("                    <option value=\"default\" disabled selected>Status</option>\n");
      out.write("                    <option value=\"student\">Student</option>\n");
      out.write("                    <option value=\"faculty\">Faculty</option>\n");
      out.write("                </select>\n");
      out.write("                <input type=\"text\" name=\"address\" placeholder=\"Complete Address\">\n");
      out.write("                <select name=\"PickUppoint\">\n");
      out.write("                <option value=\"default\" disabled selected>PickUp Point</option>\n");
      out.write("                ");

                    StoppageInfoDAO std = new StoppageInfoDAO();
                    ArrayList<StoppageInfo> sl = std.getAllStoppage();
                    if(sl!=null){
                        for(int i=0;i<sl.size();i++){
                
      out.write("\n");
      out.write("                            <option value=\"");
      out.print( sl.get(i).getStoppage() );
      out.write('"');
      out.write('>');
      out.print( sl.get(i).getStoppage() );
      out.write("</option>\n");
      out.write("                ");

                        }
                    }
                    else{
                
      out.write("\n");
      out.write("                    <option value=\"default\" disabled selected>Nothing to be selected</option>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("                </select> \n");
      out.write("                <input type=\"text\" name=\"mobile\" placeholder=\"Mobile Number\">\n");
      out.write("                <input type=\"password\" name=\"pwd\" placeholder=\"Password\">\n");
      out.write("                <input type=\"password\" name=\"cpwd\" placeholder=\"Confirm Password\">\n");
      out.write("                <input type=\"submit\" value=\"Sign Up\">\n");
      out.write("                <a href=\"Login.jsp\">A Member ? Login Here</a>\n");
      out.write("            </form>\n");
      out.write("        \n");
      out.write("        </div>\n");
      out.write("    \n");
      out.write("    </body>\n");
      out.write("\n");
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
}
