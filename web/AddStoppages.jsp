<%-- 
    Document   : AddStoppages
    Created on : Mar 21, 2019, 6:06:40 PM
    Author     : user
--%>

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
        <title>Add Stoppages</title>
    </head>
    <style>
        /*--------------------------Nav bar--------------------------------*/
        *{
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
          border-radius: 5px;
          background: rgba(0,0,0,.5);
          box-sizing: content-box;
        }
        nav {
          overflow: hidden;
          background-color: #e9e9e9;
          /*height: 50px;*/
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

        /*----------------------------------------------------------*/


        .envelope form label{
              color: black;
              padding: 2px;
              margin-top: 0;
              font-size: 20px;        
          }
        /*----------------------------------------------------------*/

        @media (max-width: 600px) {
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

    <!-----Including CSS for different screen sizes----->
    <link rel="stylesheet" type="text/css" href="responsiveform.css">
    <link rel="stylesheet" media="screen and (max-width: 1200px) and (min-width: 601px)" href="responsiveform1.css" />
    <link rel="stylesheet" media="screen and (max-width: 600px) and (min-width: 351px)" href="responsiveform2.css" />
    <link rel="stylesheet" media="screen and (max-width: 350px)" href="responsiveform3.css" />

      <!-- JavaScript Code for create new input boxes -->
      <script>
                             var flag = true;
                             var c=0;
                             function addTextBox(btn) {
                                c++;
                              
                                var element1 = document.createElement("input");
                                var element2 = document.createElement("input");

                                element1.setAttribute("type", "text");
                                element1.setAttribute("value", "");
                                element1.setAttribute("name", "sPoint"+c);
                                element1.setAttribute("placeholder","Stoppage");
                                element2.setAttribute("type", "text");
                                element2.setAttribute("value", "");
                                element2.setAttribute("name", "Tim"+c);
                                element2.setAttribute("placeholder","hh:mm");

                                btn.parentNode.insertBefore(element1, btn);
                                
                                btn.parentNode.insertBefore(element2, btn);
                                
                                
                            }

                            function getCount()
                            {
                              return c;
                            }

                            function Multiple(btn){
                               // var f = return myValidation();
                               if(myValidation())
                               {
                                  addTextBox(btn);
                               }
                            }

                            function myValidation()
                            {
                               var sPoint = document.forms["myForm"]["sPoint"+c];
                               var obj = document.forms["myForm"]["Tim"+c];
                               
                               var flag=true;

                               if(sPoint.value==""){
                                  alert("Starting Point cannot be empty");
                                  sPoint.style.border= 2+"px"+" solid red";
                                  flag=false;
                               }

                                var timeValue = obj.value;
                                if(timeValue == "" || timeValue.indexOf(":")<0)
                                {
                                    alert("Invalid Time format");
                                    obj.style.border=2+"px"+" solid red";
                                }
                                else
                                {
                                    var sHours = timeValue.split(':')[0];
                                    var sMinutes = timeValue.split(':')[1];

                                    if(sHours == "" || isNaN(sHours) || parseInt(sHours)>23)
                                    {
                                        alert("Invalid Time format");
                                        obj.style.border=2+"px"+" solid red";
                                    }
                                    else if(parseInt(sHours) == 0)
                                        sHours = "00";
                                    else if (sHours <10)
                                        sHours = "0"+sHours;

                                    if(sMinutes == "" || isNaN(sMinutes) || parseInt(sMinutes)>59)
                                    {
                                        alert("Invalid Time format");
                                        return false;
                                    }
                                    else if(parseInt(sMinutes) == 0)
                                        sMinutes = "00";
                                    else if (sMinutes <10)
                                        sMinutes = "0"+sMinutes;    

                                    //obj.value = sHours + ":" + sMinutes;        
                                }

                          
                               return flag;

                            }

                            function validateTime(obj)
                            {
                                var timeValue = obj.value;
                                if(timeValue == "" || timeValue.indexOf(":")<0)
                                {
                                    alert("Invalid Time format");
                                    return false;
                                }
                                else
                                {
                                    var sHours = timeValue.split(':')[0];
                                    var sMinutes = timeValue.split(':')[1];

                                    if(sHours == "" || isNaN(sHours) || parseInt(sHours)>23)
                                    {
                                        alert("Invalid Time format");
                                        return false;
                                    }
                                    else if(parseInt(sHours) == 0)
                                        sHours = "00";
                                    else if (sHours <10)
                                        sHours = "0"+sHours;

                                    if(sMinutes == "" || isNaN(sMinutes) || parseInt(sMinutes)>59)
                                    {
                                        alert("Invalid Time format");
                                        return false;
                                    }
                                    else if(parseInt(sMinutes) == 0)
                                        sMinutes = "00";
                                    else if (sMinutes <10)
                                        sMinutes = "0"+sMinutes;    

                                    obj.value = sHours + ":" + sMinutes;        
                                }

                                return true;    
                            }

</script>

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
            <a class="active" href="CreateRoutes.jsp">Create Route</a>
            <a href="DeleteRoute.jsp">Delete Route</a>
            <a href="UpdateRoute.jsp">Update Route</a>
            <a href="vwRoute">View Routes</a>
            <a class="active" href="getAllStu">Student Information</a>
            <a href="getAllFaculty">Faculty Information</a>
            <a href="getAllPermission">New Registration</a>
            <a href="Logout.jsp">Logout</a>
        </nav>
        <%
            RouteInfo ri = (RouteInfo)session.getAttribute("route");
            String st = (String)session.getAttribute("rname");  
            //System.out.println("String : "+st+" "+session.getId());
        %>
        <%
           int c;
        %>
        <div class="envelope">
            <form action="saveStoppage?id=" name="myForm" method="post" onsubmit="return myValidation()">
                <input type="text" name="rName" placeholder="<%=st%>" value="<%=st%>" readonly="readonly" id="nroute">
                <input type="text" name="sPoint0" placeholder="Enter Stoppage">
                <input type="text" name="Tim0" placeholder="Enter Time (hh:mm)">
                <input type="submit" value="Next" style="width:50%;">
            </form>
            <form action="vwRoute" name="myForm" method="post">
                <input type="submit" value="Finish" style="width:50%;">
            </form>
            
            
        </div>
    
    </body>

</html>
<%
    }
%>
