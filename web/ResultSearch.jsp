<%-- 
    Document   : ResultSearch
    Created on : Mar 23, 2019, 8:30:38 PM
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
nav input[type=text],select {
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
<script type="text/javascript">
                      function myValidation(){
                         var search = document.forms["myForm"]["search"];
                         var stat = document.forms["myForm"]["choice"];
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
<script src="all.js"></script>
</head>
<body>

<header>
<h1>Bus Management System</h1>
</header>
<%
   ArrayList<Student> s = (ArrayList<Student>)session.getAttribute("stuInfo");
   int r = (s.get(0)).getRoll();
  //System.out.println(r);
%>
<nav>
    <a href="StudentDashBoard.jsp">Home</a>
    <a href="StuProfile?rno=<%= r %>">Profile</a>
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
<%
    String ch = (String)session.getAttribute("ch");
    if(ch.equals("RouteName")){
%>
<table>
    <%
       int i=0;
       String st = (String)session.getAttribute("rt");
       ArrayList<RouteInfo> ri = (ArrayList<RouteInfo>)session.getAttribute("searchResults");
       if(ri!=null && ri.size()!=0){
    %>
  <caption>Search Results for <%=  st%></caption>
  <thead>
    <tr>
      <th scope="col">S.No</th>
      <th scope="col">Route Id</th>
      <th scope="col">Starting Point</th>
      <th scope="col">Driver Name</th>
      <th scope="col">Driver Contact No.</th>
    </tr>
  </thead>
  <tbody>
      <%
          for(i=0;i<ri.size();i++){
      %>
    <tr>
      <td data-label="S.No"><%= i+1 %></td>
      <td data-label="Route Id"><%= (ri.get(i)).getRoutename()%></td>
      <td data-label="Starting Point"><%= (ri.get(i)).getSpoint() %> <a href="vwStoppageStudent?rtName=<%=(ri.get(i)).getRoutename()%>">( List More )</a></td>
      <td data-label="Driver Name"><%= (ri.get(i)).getDname() %></td>
      <td data-label="Driver Contact No."><%= (ri.get(i)).getDcontact() %></td>
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
<%
    }
    if(ch.equals("BusNumber")){
%>
<table>
    <%
       int i=0;
       String st = (String)session.getAttribute("rt1");
       ArrayList<RouteInfo> ri = (ArrayList<RouteInfo>)session.getAttribute("res");
       if(ri!=null && ri.size()!=0){
    %>
  <caption>Search Results for Bus Number <%=  st%></caption>
  <thead>
    <tr>
      <th scope="col">S.No</th>
      <th scope="col">Route Id</th>
      <th scope="col">Starting Point</th>
      <th scope="col">Driver Name</th>
      <th scope="col">Driver Contact No.</th>
    </tr>
  </thead>
  <tbody>
      <%
          for(i=0;i<ri.size();i++){
      %>
    <tr>
      <td data-label="S.No"><%= i+1 %></td>
      <td data-label="Route Id"><%= (ri.get(i)).getRoutename()%></td>
      <td data-label="Starting Point"><%= (ri.get(i)).getSpoint() %> <a href="vwStoppageStudent?rtName=<%=(ri.get(i)).getRoutename()%>">( List More )</a></td>
      <td data-label="Driver Name"><%= (ri.get(i)).getDname() %></td>
      <td data-label="Driver Contact No."><%= (ri.get(i)).getDcontact() %></td>
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

<%
   }        
%>
</body>
</html>

<%
    }
%>

