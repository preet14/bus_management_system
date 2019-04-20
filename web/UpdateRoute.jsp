<%-- 
    Document   : UpdateRoute
    Created on : Mar 21, 2019, 6:07:45 PM
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
  <title>Update Routes</title>
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
  display: none;
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
    display: none;
    margin-bottom: .625em;
  }
  
  table td{
    border-bottom: 1px solid #141111cc;
    display: none;
    font-size: .8em;
    text-align: right;
  }
  table td button{
    border-bottom: 1px solid #ddd;
    display: none;
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

@media (max-width: 1000px) {
  nav .search-container {
    float: none;
  }
  nav a, nav input[type=text], nav .search-container button,select {
    float: none;
    display: none;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 12px;
  }
  nav .search-container button{
    float: none;
    display: none;
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
    display: none;
    margin-bottom: .625em;
  }
  
  table td{
    border-bottom: 1px solid #141111cc;
    display: none;
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
  function mychoice(){
    var stat = document.forms["myForm"]["choice"];
    var v1 = document.forms["myForm"]["v1"];
    var v2 = document.forms["myForm"]["v2"];
    var v4 = document.forms["myForm"]["v4"];
    var v6 = document.forms["myForm"]["v6"];
    var v8 = document.forms["myForm"]["v8"];
    var v10 = document.forms["myForm"]["v10"];
    var v11 = document.forms["myForm"]["v11"];
    var v111 = document.forms["myForm"]["v111"];
    if(stat.value=="rno"){
        v1.style.display="block";
        v2.style.display="block";
        v4.style.display="none";
        v6.style.display="none";
        v8.style.display="none";
        v10.style.display="none";
        v111.style.display="none";
    }
    if(stat.value=="bno"){
        v1.style.display="block";
        v2.style.display="none";
        v4.style.display="block";
        v6.style.display="block";
        v8.style.display="none";
        v10.style.display="none";
        v111.style.display="none";
    }
    if(stat.value=="drname"){
        v1.style.display="none";
        v2.style.display="none";
        v4.style.display="none";
        v6.style.display="none";
        v8.style.display="block";
        v10.style.display="block";
        v111.style.display="block";
    }
    if(stat.value=="drcontact"){
        v1.style.display="none";
        v2.style.display="none";
        v4.style.display="none";
        v6.style.display="none";
        v8.style.display="none";
        v10.style.display="block";
        v111.style.display="block";
    }
    if(stat.value=="rno" || stat.value=="bno" || stat.value=="drcontact" || stat.value=="drname"){
        v11.style.display="block";
    }
  }
//  function myValidation(){
//    var stat = document.forms["myForm"]["choice"];
//    var v1 = document.forms["myForm"]["v1"];
//    var v2 = document.forms["myForm"]["v2"];
//    if(stat.value==""|| !(stat.value=="rno" || stat.value=="bno"))
//    {
//      alert("Category is empty or invalid");
//      stat.style.border= 2+"px"+" solid red";
//      flag=false;
//    }
//    if(v1.value=="")
//    {
//      alert("Value to be updated cannot be empty");
//      v1.style.border= 2+"px"+" solid red";
//      flag=false;
//    }
//    if(v2.value=="")
//    {
//      alert("Updated Value cannot be empty");
//      v2.style.border= 2+"px"+" solid red";
//      flag=false;
//    }
//    
//    return flag
//  }
</script>
<link rel="stylesheet" type="text/css" href="responsiveformss.css">
    <link rel="stylesheet" media="screen and (max-width: 1000px) and (min-width: 450px)" href="responsiveformss1.css" />
    <link rel="stylesheet" media="screen and (max-width: 500px) and (min-width: 110px)" href="responsiveformss2.css" />
    <link rel="stylesheet" media="screen and (max-width: 100px) and (min-width: 50px)" href="responsiveformss3.css" />

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
            <a class="active" href="UpdateRoute.jsp">Update Route</a>
            <a href="vwRoute">View Routes</a>
            <a href="getAllStu">Student Information</a>
            <a href="getAllFaculty">Faculty Information</a>
            <a href="getAllPermission">New Registration</a>
            <a href="Logout.jsp">Logout</a>
        </nav>

  <div class="demoBox">

    <div class="item1">
     <div class="envelope">
            <form action="UpdRoute" name="myForm" method="post">
            <input type="text" name="rName" placeholder="Update Route" readonly="readonly" id="nroute">
            <select id="ch" name="choice" onchange="mychoice()">
                <option disabled selected>Category</option> 
                <option value="rno">Route Name</option>
                <option value="bno">Bus Number</option>
                <option value="drname">Driver Name</option>
                <option value="drcontact">Driver Contact</option>
            </select>
            <input type="text" name="v1" placeholder="Enter Old Route Name">
            <input type="text" name="v2" placeholder="Enter New Route Name">
            
            <input type="text" name="v4" placeholder="Enter New Bus Number">
            <input type="text" name="v6" placeholder="Enter New Vehicle Reg. No.">
            
            <input type="text" name="v111" placeholder="Enter Route Name">
            <input type="text" name="v8" placeholder="Enter New Driver Name">
            <input type="text" name="v10" placeholder="Enter New Driver Contact Number">
            <input type="submit" name="v11" value="Update" style="width:50%;">
            </form>
        </div>  
    
    </div>
    <div class="item2">
  <table>
      <%
       int i=0;
       ArrayList<RouteInfo> ri = (ArrayList<RouteInfo>)session.getAttribute("URoute");
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
      <th scopr="col">Bus Number</th>
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
      <td data-label="Bus Number"><%= (ri.get(i)).getBusno() %></td>      
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
