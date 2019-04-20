<%-- 
    Document   : DeleteRoute
    Created on : Mar 21, 2019, 6:07:14 PM
    Author     : user
--%>

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
  <title>Delete Routes</title>
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
  color:#ffffff80;
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
  margin-top: 8px;
  font-size: 18px;
  background: #0000001a;
  color: #0c0505e6;
  font-weight: bold;
}
nav .search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 10px;
  margin-right: 16px;
  background: #c6c6c6;
  font-size: 18px;
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
  table td button{
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: center;
  }
  
  table td::before {
  
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

@media (max-width: 1000px) {
  nav .search-container {
    float: none;
  }
  nav a, nav input[type=text], nav .search-container button,select {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 12px;
  }
  nav .search-container button{
    float: none;
    display: block;
    text-align: center;
    width: 100%;
    margin: 0;
    padding: 12px;
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

/*.------------------.*/
  .demoBox{
    margin-top: 100px;
    display:flex;
    flex-direction: row;
    flex-wrap: nowrap;
    justify-content: center;
    align-items: stretch;
    align-content: flex-start;
    text-align: center;
  }
  .item1{
    background-color: #1e90ff1a;
    flex:2;
  }
  .item2{
    background-color:#f003;
    flex:3; 
  }
  /*...................*/
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

table td button{
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

@media screen and (max-width: 1000px) {

  .demoBox{
    flex-direction: column;
  }

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



</style>
<script type="text/javascript">
  function myfunction(){
    var myWindow = window.open("ad1.html", "MsgWindow", "width=600,height=600");
  }
  function myValidation(){
    var stat = document.forms["myForm"]["choice"];
    var rno = document.forms["myForm"]["rno"];
    if(stat.value==""|| !(stat.value=="rname"))
    {
      alert("Category is empty or invalid");
      stat.style.border= 2+"px"+" solid red";
      flag=false;
    }
    if(rno.value=="")
    {
      alert("Route Name cannot be empty");
      rno.style.border= 2+"px"+" solid red";
      flag=false;
    }

    return flag
  }
</script>
    <link rel="stylesheet" type="text/css" href="responsiveforms.css">
    <link rel="stylesheet" media="screen and (max-width: 1200px) and (min-width: 450px)" href="responsiveforms1.css" />
    <link rel="stylesheet" media="screen and (max-width: 800px) and (min-width: 210px)" href="responsiveforms2.css" />
    <link rel="stylesheet" media="screen and (max-width: 300px)" href="responsiveforms3.css" />
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
            <a class="active" href="DeleteRoute.jsp">Delete Route</a>
            <a href="UpdateRoute.jsp">Update Route</a>
            <a href="vwRoute">View Routes</a>
            <a href="getAllStu">Student Information</a>
            <a href="getAllFaculty">Faculty Information</a>
            <a href="getAllPermission">New Registration</a>
            <a href="Logout.jsp">Logout</a>
        </nav>

  <div class="demoBox">

    <div class="item1">
     <div class="envelope">
            <form action="DelRoute" name="myForm" method="post" onsubmit="return myValidation()">
            <input type="text" name="rName" placeholder="Delete Route" readonly="readonly" id="nroute">
            <select name="choice">
                <option disabled selected>Category </option>
                <option value="rname">Route Name</option>
            </select>
            <input type="text" name="rno" placeholder="Enter Route Name">
            <input type="submit" value="Delete" style="width:50%;">
            </form>
        </div>  
    
    </div>
    <div class="item2">
  <table>
      <%
       int i=0;
       ArrayList<RouteInfo> ri = (ArrayList<RouteInfo>)session.getAttribute("DRoute");
       if(ri==null){
           ri = (ArrayList<RouteInfo>)session.getAttribute("routess");
       }
       if(ri!=null && ri.size()!=0){
      %>
  <caption>View Routes</caption>
  <thead>
    <tr>
      <th scope="col">S.No</th>
      <th scope="col">Route Id</th>
      <th scope="col">Vehicle Reg No.</th>
      <th scope="col">Starting Point</th>
      <th scope="col">Capacity</th>
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
      <td data-label="Vehicle Reg No."><%= (ri.get(i)).getVrnumber() %></td>
      <td data-label="Starting Point"><%= (ri.get(i)).getSpoint() %> <a href="vwStoppage?rtName=<%=(ri.get(i)).getRoutename()%>">( List More )</a></td>
      <td data-label="Capacity"><%= (ri.get(i)).getCapacity() %></td>
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

    </div>
  </div>
 </body>
 </html>
<%
    }
%>
