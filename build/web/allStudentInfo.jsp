<%-- 
    Document   : allStudentInfo
    Created on : Apr 2, 2019, 7:00:00 PM
    Author     : user
--%>

<%@page import="Modal.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modal.RouteInfo"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
    response.setHeader("Pragma","no-cache"); //HTTP 1.0
    response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
    
    if(request.getSession().getAttribute("uname")==null)
    {
%>
<script>
        location = "Login.jsp";
    </script>
    <%
    }
    else
    {
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

* {
box-sizing: border-box;
}
   body{
      background-image: url(t.jpg);
      -webkit-background-size:cover;
      background-size: cover;
      background-position: center center;
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-color: #999;
      height: 100%;
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
     }
header {
  text-align: center;
  color:white;
  border: 5px solid rgba(0,0,0,.5); 
  background: rgba(0,0,0,.5);
  box-sizing: content-box;
}
nav {
  overflow: hidden;
  background-color: #e9e9e9;
}
nav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 18px;
}
nav a:hover {
  background-color: #c6c6c6;
  color: black;
}
nav a.active {
  background-color: #2980B9;
  color: white;
}
nav .search-container {
  float: right;
}
nav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}
nav .search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background: #c6c6c6;
  font-size: 17px;
  border: none;
  cursor: pointer;
}
nav .search-container button:hover {
  background: #9a9a9a;
}

/*----table----*/

table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  table-layout: fixed;
}

table caption {
  border: 5px solid rgba(0,0,0,.5); 
  background: rgba(0,0,0,.5);
  box-sizing: content-box;
  font-size: 2.5em;
  margin: .5em 0 .85em;
  color:white;
  font-weight: bold;
}

table tr {
  background-color: #f8f8f880;
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table td{
  font-weight: bold;
}

table td a{
  display: block;
  color: #f1f1f1;
  text-align: center;
  text-decoration: none;
  font-size: 12px;
  background-color:dodgerblue;
  border-radius: 3px; 
}

table th {
  font-size: 1em;
  letter-spacing: .1em;
  text-transform: uppercase;
  background-color: #000000b3;
color: #f1f1f1;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }
  
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
  
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  
  table td{
    border-bottom: 1px solid #141111cc;
    display: block;
    font-size: .8em;
    text-align: right;
  }
  table td a{
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: center;
  }
  
  table td::before {
    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table td:last-child {
    border-bottom: 0;
  }
}

/*-----*/

@media (max-width: 768px) {
  nav .search-container {
    float: none;
  }
  nav a, nav input[type=text], nav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  nav input[type=text] {
    border: 1px solid #ccc;  
  }
}
</style>
</head>
<body>

<header>
<h1>Bus Management System</h1>
</header>

<nav>
    <a href="AdminDashboard.jsp">Home</a>
    <a href="CreateRoutes.jsp">Create Route</a>
    <a href="DeleteRoute.jsp">Delete Route</a>
    <a href="UpdateRoute.jsp">Update Route</a>
    <a href="vwRoute">View Routes</a>
    <a class="active" href="getAllStu">Student Information</a>
    <a href="getAllFaculty">Faculty Information</a>
    <a href="getAllPermission">New Registration</a>
    <a href="Logout.jsp">Logout</a>
</nav>
<table>
    <%
       int i=0;
       ArrayList<Student> ri = (ArrayList<Student>)session.getAttribute("resu");
       if(ri!=null && ri.size()!=0){
           System.out.println("innnnner");
    %>
  <caption>View Student Details</caption>
  <thead>
    <tr>
      <th scope="col">S.No</th>
      <th scope="col">University Id</th>
      <th scope="col">Name</th>
      <th scope="col">Contact Number</th>
      <th scope="col">Address</th>
      <th scope="col">Route</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody>
      <%
          for(i=0;i<ri.size();i++){
              if(!ri.get(i).getPermission().equals("NULL")){
      %>
    <tr>
      <td data-label="S.No"><%= i+1 %></td>
      <td data-label="University Id"><%= ri.get(i).getRoll() %></td>
      <td data-label="Name"><%= ri.get(i).getFname()+" "+ri.get(i).getLname() %></td>
      <td data-label="Contact Number"><%= ri.get(i).getMobno() %></td>
      <td data-label="Address"><%= ri.get(i).getAddress() %></td>
      <td data-label="Route"><%= ri.get(i).getRoute() %></td>
      <td data-label="Delete"><a href="delStu?sid=<%= ri.get(i).getRoll() %>">Delete</a></td>
    </tr>
    <%
        }
        }
    %>
  </tbody>
  <%
    }
    else{
        %>
        <tr>
            <td>
                Nothing to display
            </td>
        </tr>
        <%
    }
   %>
</table>
</body>
</html>

<%
    }
%>

