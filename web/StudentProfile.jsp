<%-- 
    Document   : StudentProfile
    Created on : Mar 22, 2019, 8:25:55 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modal.Student"%>
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
  <title>My Profile</title>
        <script src="all.js"></script>

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
  background-color: #e9e9e980;
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
nav input[type=text], select {
  padding: 6px;
  margin-top: 5px;
  margin-bottom: 5px;
  font-size: 18px;
  background: #0000001a;
  color: #0c0505e6;
  font-weight: bold;
}
nav .search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 6px;
  margin-right: 16px;
  background: #c6c6c6;
  font-size: 19px;
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
  nav .search-container input[type=text],select {
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
<script type="text/javascript">
                      function myValidation(){
                         var search = document.forms["myForm"]["search"];
                         var stat = document.forms["myForm"]["choices"];
                         var flag=true;
                 
                               if(search.value==""){
                                  alert("Search Box cannot be empty");
                                  flag=false;
                               }

                               if(stat.value=="" || !(stat.value=="BusNumber" || stat.value=="RouteName")){
                                  alert("Choice is Invalid");
                                  flag=false;
                               }

                         return flag;
                         }
</script>
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
<%
   ArrayList<Student> s = (ArrayList<Student>)session.getAttribute("stuInfo");
   int r = (s.get(0)).getRoll();
   System.out.println("oo");
%>
<nav>
  <a href="StudentDashBoard.jsp">Home</a>
  <a class="active" href="StuProfile?rno=<%= r %>">Profile</a>
  <a href="vwStuRoute?rno=<%= r%>">View Your Route</a>
  <a href="Logout.jsp">Logout</a>
   <div class="search-container">
    <form action="searchRoute" name="myForm" onsubmit="return myValidation()">
              <select name="choice">
                <option disabled selected>Category</option>
                <option value="RouteName">Route Name</option>
                <option value="BusNumber">Bus Number</option>
              </select>
      <input type="text" placeholder="Search.." name="search">
      <button type="submit"><i class="fas fa-search"></i></button>
    </form>
  </div>
</nav>
<table>
 <%
       int i=0;
       ArrayList<Student> ri = (ArrayList<Student>)session.getAttribute("sprof");
       if(ri!=null && ri.size()!=0){
           System.out.println("n");
 %>
  <caption>Student Information</caption>
  <thead>
    <tr>
      <th scope="col">Student Id</th>
      <th scope="col">Name</th>
      <th scope="col">Branch</th>
      <th scope="col">Phone Number</th>
      <th scope="col">Complete Address</th>
      <th scope="col">Pick-up Point</th>
      <th scope="col">Route Name</th>
      <th scope="col">Verification</th>
    </tr>
  </thead>
  <%
          for(i=0;i<ri.size();i++){
  %>
  <tbody>
    <tr>
      <td data-label="Student Id"><%= (ri.get(i)).getRoll() %></td>
      <td data-label="Name"><%=(ri.get(i)).getFname()+" "+(ri.get(i)).getLname() %></td>
      <td data-label="Branch"><%=(ri.get(i)).getBranch() %></td>
      <td data-label="Phone Number"><%=(ri.get(i)).getMobno() %></td>
      <td data-label="Complete Address"><%=(ri.get(i)).getAddress() %></td>
      <td data-label="Pick-up Point"><%=(ri.get(i)).getPickup() %></td>
      <%
          if(!((ri.get(i)).getRoute().equals("NULL") && (ri.get(i)).getPermission().equals("NULL"))){
      %>
      <td data-label="Route Name"><%=(ri.get(i)).getRoute() %></td>
      <td data-label="Verfication"><%=(ri.get(i)).getPermission() %></td>
      <%
          }
          else{
      %>
      <td data-label="Route Name">Not Assigned</td>
      <td data-label="Verfication">Not Verified Account</td>
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
