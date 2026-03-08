<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>

<style>
body{
font-family: Arial;
background: linear-gradient(135deg,#6a11cb,#2575fc);
height:100vh;
display:flex;
justify-content:center;
align-items:center;
}

.container{
background:white;
padding:30px;
border-radius:10px;
box-shadow:0px 5px 20px rgba(0,0,0,0.2);
width:350px;
}

h2{
text-align:center;
margin-bottom:20px;
}

input{
width:100%;
padding:10px;
margin:6px 0;
border-radius:5px;
border:1px solid #ccc;
}

.btn{
display:block;
width:100%;
padding:10px;
margin-top:8px;
background:#2575fc;
color:white;
border:none;
border-radius:5px;
font-weight:bold;
cursor:pointer;
text-align:center;
text-decoration:none;
}

.btn:hover{
background:#1a5ad9;
}
</style>

</head>

<body>

<%
String Reg = "RBT23IT-";
int Rno = (int)(Math.random()*1000);
String Rid = Reg + Rno;
%>

<div class="container">

<h2>Student Registration</h2>

<form action="register" method="post">

<input type="text" name="regno" value="<%= Rid %>">

<input type="text" name="rollno" value="<%= Rno %>">

<input type="text" name="stname" placeholder="Enter Student Name">

<input type="text" name="fname" placeholder="Enter Father's Name">

<input type="date" name="dob">

<input type="text" name="address" placeholder="Enter Address">

<input type="text" name="dist" placeholder="Enter District">

<input type="text" name="state" placeholder="Enter State">

<input class = "btn" type="submit" value="Register">
<a href="viewrecord.jsp" class="btn">View Data</a>

</form>

</div>

</body>
</html>