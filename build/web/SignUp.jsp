<%-- 
    Document   : SignUp
    Created on : Mar 21, 2019, 5:31:34 PM
    Author     : user
--%>

<%@page import="Modal.StoppageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modal.StoppageInfoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
   <head>
        <title>Sign Up</title>    
    <style>
    
        *{
            margin: 0; 
            padding: 0;
        }
        body{
              background-image: url(t.jpg);
              -webkit-background-size:cover;
              background-size: cover;
              background-position: center center;
              background-repeat: repeat;
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
        
        .form-wrap{ 
            width: 420px; 
            height:783px;
            background: rgba(0,0,0,.5);
            padding: 40px 20px; 
            border: 5px solid rgba(0,0,0,.5);
            box-sizing: border-box; 
            position: absolute; 
            left: 50%; 
            top: 75%; 
            transform: translate(-50%, -50%);
        }

        h1{
            text-align: center; 
            color: #fff; 
            font-weight: normal; 
            margin-bottom: 20px;
        }
        
        input{
            width: 100%; 
            background: transparent; 
            border: 1px solid #f1f1f1; 
            border-radius: 3px; 
            padding: 6px 15px; 
            box-sizing: border-box; 
            margin-bottom: 20px; 
            font-size: 16px; 
            color: #fff;
        }

        .form-wrap select
        {
            border: 1px solid #f1f1f1; 
            border-radius: 3px; 
            padding: 6px 15px; 
            box-sizing: border-box; 
            margin-bottom: 20px; 
            background: none;
            outline: none;
            width:100%;
            color:#fff;
            height: 40px;
            font-size: 16px;
        }

        .form-wrap option{
            color:black;
        }

        .form-wrap option[value=""][disabled] {
          display: none;
        }

        input[type="submit"]{ 
            background: #bac675;
            border: 0; 
            cursor: pointer; 
            color: #3e3d3d;
        }
        input[type="button"]:hover{ 
            background: #a4b15c; 
            transition: .6s;
        }
        
        ::placeholder{
            color: #fff;
        }

        .form-wrap a
        {
          color: #fff;
          font-size: 14px;
          font-weight: bold;
          text-decoration: none;
        }
      
    </style>

    <script type="text/javascript">
                             function myValidation(){
                               var fname = document.forms["myForm"]["fname"];
                               var lname = document.forms["myForm"]["lname"];
                               var branch = document.forms["myForm"]["branch"];
                               var rno = document.forms["myForm"]["rno"];
                               var email = document.forms["myForm"]["email"];
                               var pwd = document.forms["myForm"]["pwd"];
                               var cpwd = document.forms["myForm"]["cpwd"];
                               var stat = document.forms["myForm"]["status"];
                               var pick = document.forms["myForm"]["PickUppoint"];
                               var mob = document.forms["myForm"]["mobile"];
                               var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                               var flag=true;
                               
                               if(fname.value==""){
                                  alert("First Name cannot be empty");
                                  fname.style.border= 2+"px"+" solid red";
                                  flag=false;
                               }

                               if(lname.value==""){
                                  alert("Last Name cannot be empty");
                                  lname.style.border= 2+"px"+" solid red";
                                  flag=false;
                               }

                               if(branch.value=="" || !(branch.value=="CSE" || branch.value=="ECE" || branch.value=="CE" || branch.value=="ME" )){
                                  alert("Branch is Invalid or Empty");
                                  branch.style.border= 2+"px"+" solid red";
                                  flag=false;
                               }

                               if(rno.value==""){
                                alert("Roll No. cannot be empty");
                                flag=false;
                                rno.style.border= 2+"px"+" solid red";
                               }

                               if(email.value==""|| !(email.value.match(mailformat)))
                               {
                                 alert("Email cannot be Empty or Invalid");
                                 email.style.border = 2+"px"+" solid red";
                                 flag=false;
                               }

                               if(pick.value==""){
                                  alert("Pick-Up Point caanot be empty");
                                  pick.style.border= 2+"px"+" solid red";
                                  flag=false;
                               }

                               if(pwd.value==""){
                                  alert("Password cannot be Empty");
                                  pwd.style.border= 2+"px"+" solid red";
                                  flag=false;
                               }

                               if(cpwd.value==""){
                                  alert("Conform Password cannot be Empty");
                                  cpwd.style.border= 2+"px"+" solid red";
                                  flag=false;
                               }

                               if(pwd.value!=cpwd.value){
                                  alert("Password and Conform Password must be same");
                                  pwd.style.border= 2+"px"+" solid red";
                                  cpwd.style.border= 2+"px"+" solid red";
                                  flag=false;
                               }

                               if(mob.value=="" || isNaN(mob.value) || mob.value.length !=10)
                               {
                                  alert("Mobile Number is Invalid");
                                  mob.style.border=2+"px"+" solid red";
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

    <link rel="stylesheet" media="screen and (max-width: 1200px) and (min-width: 601px)" href="res1.css" />
    <link rel="stylesheet" media="screen and (max-width: 600px) and (min-width: 351px)" href="res2.css" />
    <link rel="stylesheet" media="screen and (max-width: 350px)" href="res3.css" />

</head>

    <body>

        <header>
            <h1>Bus Management System</h1>
        </header>
        <div class="form-wrap">
        
            <form action="UserSignUp" name="myForm" method="post" onsubmit="return myValidation()">
                <h1>Sign Up</h1>
                <input type="text" name="fname" placeholder="First Name">
                <input type="text" name="lname" placeholder="Last Name">
                <input type="text" name="rno" placeholder="Roll Number OR EmpId">
                <select name="branch">
                <option value="default" disabled selected>Branch</option>
                <option value="CSE">CSE</option>
                <option value="ECE">ECE</option>
                <option value="CE">CE</option>
                </select>
                <input type="text" name="email" placeholder="Email">
                <select name="status">
                    <option value="default" disabled selected>Status</option>
                    <option value="student">Student</option>
                    <option value="faculty">Faculty</option>
                </select>
                <input type="text" name="address" placeholder="Complete Address">
                <select name="PickUppoint">
                <option value="default" disabled selected>PickUp Point</option>
                <%
                    ArrayList<StoppageInfo> sl = (ArrayList<StoppageInfo>)session.getAttribute("stoList");
                    if(sl!=null && sl.size()!=0){
                        for(int i=0;i<sl.size();i++){
                %>
                            <option value="<%= sl.get(i).getStoppage() %>"><%= sl.get(i).getStoppage() %></option>
                <%
                        }
                    }
                    else{
                %>
                    <option value="default" disabled selected>Nothing to be selected</option>
                <%
                    }
                %>
                </select> 
                <input type="text" name="mobile" placeholder="Mobile Number">
                <input type="password" name="pwd" placeholder="Password">
                <input type="password" name="cpwd" placeholder="Confirm Password">
                <input type="submit" value="Sign Up">
                <a href="Login.jsp">A Member ? Login Here</a>
            </form>
        
        </div>
    
    </body>

</html>
