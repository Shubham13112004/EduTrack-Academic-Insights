<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Records</title>
<form method="get">

<input type="text" name="search" placeholder="Search by RegNo or Name">

<input type="submit" value="Search">

<a href="viewrecord.jsp">Reset</a>

</form>

<br>

<style>

body{
font-family:Arial;
background:#f4f4f4;
padding:30px;
}

h2{
text-align:center;
}

table{
width:100%;
border-collapse:collapse;
background:white;
}

th,td{
padding:10px;
border:1px solid #ccc;
text-align:center;
}

th{
background:#2575fc;
color:white;
}

tr:hover{
background:#f2f2f2;
}

a{
display:inline-block;
margin-top:20px;
padding:10px 15px;
background:#2575fc;
color:white;
text-decoration:none;
border-radius:5px;
}

</style>

</head>

<body>

<h2>Student Records</h2>

<table>

<tr>
<th>ID</th>
<th>Reg No</th>
<th>Roll No</th>
<th>Student Name</th>
<th>Father Name</th>
<th>DOB</th>
<th>Address</th>
<th>District</th>
<th>State</th>
<th>Edit</th>
<th>Delete</th>
</tr>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/student_marks","root","");

String search = request.getParameter("search");

PreparedStatement ps;

if(search != null && !search.equals("")){

ps = con.prepareStatement(
"SELECT * FROM student WHERE regno LIKE ? OR stname LIKE ?");

ps.setString(1,"%"+search+"%");
ps.setString(2,"%"+search+"%");

}else{

ps = con.prepareStatement("SELECT * FROM student");

}

ResultSet rs = ps.executeQuery();



while(rs.next()){

%>

<tr>

<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("regno") %></td>
<td><%= rs.getString("rollno") %></td>
<td><%= rs.getString("stname") %></td>
<td><%= rs.getString("fname") %></td>
<td><%= rs.getString("dob") %></td>
<td><%= rs.getString("address") %></td>
<td><%= rs.getString("dist") %></td>
<td><%= rs.getString("state") %></td>

<td style="color:green">
<a href="edit.jsp?id=<%= rs.getInt("id") %>">
<i class="fa-regular fa-pen-to-square"></i>
</a>
</td>

<td style="color:red">
<a href="Delete?id=<%= rs.getInt("id") %>">
<i class="fa-solid fa-trash"></i>
</a>
</td>

</tr>

<%
}

con.close();

}catch(Exception e){
out.println(e);
}

%>

</table>

<br>

<a href="index.jsp">Back to Registration</a>

</body>
</html>