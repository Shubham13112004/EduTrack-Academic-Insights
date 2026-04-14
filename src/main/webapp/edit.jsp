<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>

<style>

body{
font-family:Arial;
background:#f4f4f4;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.container{
background:white;
padding:30px;
border-radius:10px;
box-shadow:0px 5px 20px rgba(0,0,0,0.2);
width:400px;
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
background:#2575fc;
color:white;
border:none;
cursor:pointer;
font-weight:bold;
}

</style>

</head>

<body>

<%

int id = Integer.parseInt(request.getParameter("id"));

String regno="";
String rollno="";
String stname="";
String fname="";
String dob="";
String address="";
String dist="";
String state="";

try{

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
			"jdbc:postgresql://ep-raspy-breeze-a1gkomre-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
			"neondb_owner",
			"npg_WP6VD1eljSKt");


PreparedStatement ps = con.prepareStatement(
"SELECT * FROM student WHERE id=?");

ps.setInt(1,id);

ResultSet rs = ps.executeQuery();

if(rs.next()){

regno = rs.getString("regno");
rollno = rs.getString("rollno");
stname = rs.getString("stname");
fname = rs.getString("fname");
dob = rs.getString("dob");
address = rs.getString("address");
dist = rs.getString("dist");
state = rs.getString("state");

}

con.close();

}catch(Exception e){
out.println(e);
}

%>

<div class="container">

<h2>Edit Student</h2>

<form action="update" method="post">

<input type="hidden" name="id" value="<%= id %>">

<input type="text" name="regno" value="<%= regno %>" readonly>

<input type="text" name="rollno" value="<%= rollno %>" readonly>

<input type="text" name="stname" value="<%= stname %>">

<input type="text" name="fname" value="<%= fname %>">

<input type="date" name="dob" value="<%= dob %>">

<input type="text" name="address" value="<%= address %>">

<input type="text" name="dist" value="<%= dist %>">

<input type="text" name="state" value="<%= state %>">

<input class="btn" type="submit" value="Update">

</form>

</div>

</body>
</html>