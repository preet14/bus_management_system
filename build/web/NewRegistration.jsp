<%-- 
    Document   : NewRegistration
    Created on : Mar 21, 2019, 6:09:48 PM
    Author     : user
--%>

<%@page import="Modal.Faculty"%>
<%@page import="Modal.StoppageInfo"%>
<%@page import="Modal.Student"%>
<%@page import="Modal.StoppageInfoDAO" %>
<%@page import="Modal.RouteInfo"%>
<%@page import="java.util.ArrayList"%>
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
  <title>New Registration</title>
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
/*  width: 30px;
*/  text-decoration: none;
  font-size: 30px;
  background-color:dodgerblue;
  border-radius: 3px; 
}
#rem{
  display: block;
  color: #f1f1f1;
  text-align: center;
/*  width: 30px;
*/  text-decoration: none;
  font-size: 30px;
  background-color:red;
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
/*    float: left;
*/   margin-left: 300px;
display: block;
font-size: 2em;
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
/*--------------------------------*/

.wrapper{
  margin:0 auto;
  padding-top:1%;
  position:relative;
}
.wrapper-2{
  width:14%;
  margin:0 auto;
  text-align:right;
}
.bus{
  width:120px;
  z-index:10;
  animation: bounce 100ms infinite alternate;
}
.road{
  position:absolute;
  bottom:2px;
  right:inherit;
  animation: road 1s ease-out infinite;
}

@keyframes road{
  0%{
    transform: translateX(0);
  }
  75%{
    opacity:1;
  }
  100%{
    transform: translateX(-250%);
    opacity:0;
  }
  
}

@keyframes size{
  from{
    transform: scale3d(0.75, 0.75, 0.75);
    transform: translateX(-350%);

  }
  
  20%{
            transform: scale3d(1, 1, 1); 
  }
  
  to {
       transform: scale3d(0.75, 0.75, 0.75);
       transform: translateX(-350%);
    }
}

@keyframes bounce{
  0%{
  transform:translateY(0)
  }
  100%{
    transform:translateY(-1%)
  }
}
</style>
</head>
<body>

<header>
  <div class="wrapper">
<div>
<img src="bus2.png" alt="" class="bus"/>  
</div>
<div class="wrapper-2">
<img src="road.png" alt="" class="road"/>
</div>
</div>  
<h1>Bus Management System</h1>
</header>

<nav>
    <a href="AdminDashboard.jsp">Home</a>
    <a href="CreateRoutes.jsp">Create Route</a>
    <a href="DeleteRoute.jsp">Delete Route</a>
    <a href="UpdateRoute.jsp">Update Route</a>
    <a href="vwRoute">View Routes</a>
    <a href="getAllStu">Student Information</a>
    <a href="getAllFaculty">Faculty Information</a>
    <a class="active" href="getAllPermission">New Registration</a>
    <a href="Logout.jsp">Logout</a>
</nav>
<table>
  <caption>New Registration of Student</caption>
  <%
       int i=0;
       ArrayList<Student> ri = (ArrayList<Student>)session.getAttribute("allstu");
       if(ri!=null && ri.size()!=0){
           System.out.println("out");
   %>
  <thead>
    <tr>
      <th scope="col">S.No</th>
      <th scope="col">Pick-Up Point</th>
      <th scope="col">Student ID</th>
      <th scope="col">Student Name</th>
      <th scope="col">Route Name</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
      <%
          for(i=0;i<ri.size();i++){
      %>
    <tr>
      <td data-label="S.No"><%= i+1%></td>
      <td data-label="Pick-Up Point"><%=(ri.get(i)).getPickup() %></td>
      <td data-label="Student ID"><%= (ri.get(i)).getRoll() %></td>
      <td data-label="Student Name"><%= (ri.get(i)).getFname()+" "+(ri.get(i)).getLname() %></td>
      <%
          if((ri.get(i)).getPermission().equals("NULL")){
              System.out.println("inn");
              StoppageInfoDAO sd = new StoppageInfoDAO();
              ArrayList<StoppageInfo> si = sd.getRouteFromStoppage1((String)(ri.get(i)).getPickup());
              String str = (String)si.get(0).getRname();
      %>
      <td data-label="Route Name"><%= str %></td>
      <td data-label="Status"><a href="grantPermission?roll=<%= (ri.get(i)).getRoll() %>&sto=<%= (ri.get(i)).getPickup() %>">Accept</a><<a href="revokePermission?roll=<%= (ri.get(i)).getRoll() %>" id="rem">Remove</a></td>
      <%
          }
          else{
      %>
      <td data-label="Route Name"><%= (ri.get(i)).getRoute() %></td>
      <td data-label="Status"></td>
    <%
        }
    %>
    </tr>
    <%
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
<table>
  <caption>New Registration of Faculty</caption>
  <%
       int j=0;
       ArrayList<Faculty> r = (ArrayList<Faculty>)session.getAttribute("allfact");
       if(r!=null && r.size()!=0){
           System.out.println("out");
   %>
  <thead>
    <tr>
      <th scope="col">S.No</th>
      <th scope="col">Pick-Up Point</th>
      <th scope="col">Student ID</th>
      <th scope="col">Student Name</th>
      <th scope="col">Route Name</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
      <%
          for(j=0;j<r.size();j++){
      %>
    <tr>
      <td data-label="S.No"><%= j+1%></td>
      <td data-label="Pick-Up Point"><%=(r.get(j)).getPickup() %></td>
      <td data-label="Student ID"><%= (r.get(j)).getRoll() %></td>
      <td data-label="Student Name"><%= (r.get(j)).getFname()+" "+(r.get(j)).getLname() %></td>
      <%
          if((r.get(j)).getPermission().equals("NULL")){
              System.out.println("inn");
              StoppageInfoDAO sd = new StoppageInfoDAO();
              ArrayList<StoppageInfo> si1 = sd.getRouteFromStoppage1((String)(r.get(j)).getPickup());
              String str1 = (String)si1.get(0).getRname();
              
      %>
      <td data-label="Route Name"><%= str1 %></td>
      <td data-label="Status"><a href="grantPermissionF?ro=<%= (r.get(j)).getRoll() %>&st=<%= (r.get(j)).getPickup() %>">Accept</a><<a href="revokePermissionF?roll=<%= (r.get(j)).getRoll() %>" id="rem">Remove</a></td>
      <%
          }
          else{
      %>
      <td data-label="Route Name"><%= (r.get(i)).getRoute() %></td>
      <td data-label="Status"></td>
    <%
        }
    %>
    </tr>
    <%
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

