<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
<style>

body{
margin:0;
font-family:Arial;
display:flex;
}

.sidebar{
width:220px;
background:#123a6b;
color:white;
height:100vh;
padding:20px;
}

.sidebar a{
display:block;
color:white;
padding:10px;
text-decoration:none;
}

.sidebar a:hover{
background:#0e2d52;
}

.main{
flex:1;
background:#e4ecf3;
padding:30px;
}

.cards{
display:flex;
gap:20px;
}

.card{
background:#123a6b;
color:white;
padding:20px;
width:200px;
border-radius:8px;
text-align:center;
box-shadow:0px 3px 10px rgba(0,0,0,0.2);
}

.card h3{
color:yellow;
}

</style>
</head>

<body>

<%@ page import="java.sql.*" %>

<%

int totalStudents = 0;
int totalMarksheet = 0;
int totalCertificate = 0;
int totalAmount = 0;

try{

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
			"jdbc:postgresql://ep-raspy-breeze-a1gkomre-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
			"neondb_owner",
			"npg_WP6VD1eljSKt");


Statement st = con.createStatement();

ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM student");
if(rs1.next()){
totalStudents = rs1.getInt(1);
}

ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM marks");
if(rs2.next()){
totalMarksheet = rs2.getInt(1);
}

ResultSet rs4 = st.executeQuery("SELECT SUM(amount) FROM fees WHERE status='PAID'");
if(rs4.next()){
totalAmount = rs4.getInt(1);
}

con.close();

}catch(Exception e){
out.println(e);
}

%>

<%
String role=(String)session.getAttribute("role");

if(role==null || !role.equals("teacher")){
response.sendRedirect("login.jsp");
}
%>

<div class="sidebar">
<h2>LOGO</h2>

<a href="index.jsp">Registration</a>
<a href="viewrecord.jsp">Registration View</a>
<a href="marks_entry.jsp">Marks Entry</a>
<a href="viewmarks.jsp">View Marks</a>
<a href="marksheet.jsp">Marksheet View</a>
<a href="fees.jsp">Registration Fee</a>
<a href="viewfees.jsp">View Fees</a>
<a href="logout">Logout</a>

</div>

<div class="main">

<div class="cards">

<div class="card">
<h3>Total Students</h3>
<h2><%= totalStudents %></h2>
</div>

<div class="card">
<h3>Total Marksheet</h3>
<h2><%= totalMarksheet %></h2>
</div>


<div class="card">
<h3>Total Amount</h3>
<h2><%= totalAmount %></h2>
</div>

</div>

</div>

</body>
</html>