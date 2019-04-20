<%-- 
    Document   : Login
    Created on : Mar 21, 2019, 5:30:20 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Login Form</title>
		<style type="text/css">

                    header {
                      text-align: center;
                      color:#ffffff80;
                      border: 5px solid rgba(0,0,0,.5); 
                      background: rgba(0,0,0,.5);
                      box-sizing: content-box;
                    }
                    
                </style>
                <link rel="stylesheet" type="text/css" href="res.css">
                <link rel="stylesheet" media="screen and (max-width: 1200px) and (min-width: 601px)" href="res1.css" />
                <link rel="stylesheet" media="screen and (max-width: 600px) and (min-width: 351px)" href="res2.css" />
                <link rel="stylesheet" media="screen and (max-width: 350px)" href="res3.css" />
                <script type="text/javascript">
                        function myValidation(){
 			        var uname = document.forms["myForm"]["uname"];
                                var pwd = document.forms["myForm"]["pass"];
                                var stat = document.forms["myForm"]["status"];
 			        var flag=true;
 							   
                               if(uname.value==""){
                               	  alert("UserName cannot be empty");
                               	  uname.style.border= 2+"px"+" solid red";
                               	  flag=false;
                               }

                               if(pwd.value==""){
                               	  alert("Password cannot be empty");
                               	  pwd.style.border= 2+"px"+" solid red";
                               	  flag=false;
                               }

                               if(stat.value=="" || !(stat.value=="student" || stat.value=="faculty" || stat.value=="admin")){
                               	  alert("Status is Invalid");
                               	  stat.style.border= 2+"px"+" solid red";
                               	  flag=false;
                               }

 			       return flag;
 		        }
		</script>
	</head>
	<body>
		<header>
                    <h1>Bus Management System</h1>
                </header>
		<div class="loginBox">
			    <img src="user.png" class="user">
			    <h2>Log In Here</h2>
                            <form name="myForm" method="post" action="UserLog" onsubmit="return myValidation()">
				<p>User Name</p>
				<input type="text" name="uname" placeholder="User Name">
				<p>Password</p>
                                <input type="password" name="pass" placeholder="••••••">
                                <p>Select Status</p><p>  </p>
                                <select name="status">
                                <option value="default" disabled selected>Status</option>
                                <option value="student">Student</option>
                                <option value="faculty">Faculty</option>
                                <option value="admin">Admin</option>
                                </select><br><br>							
                                <input type="submit" name="submit" value="Sign In">
                                <a href="signup">Not a Member ? SignUp Here</a>
                            </form>
		</div>
	</body>
</html>

