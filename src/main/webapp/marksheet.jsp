<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Create Marksheet</title>

<style>

body{
font-family:Arial;
background:#f4f4f4;
padding:30px;
}

.container{
width:800px;
margin:auto;
background:white;
padding:20px;
border:2px solid black;
}

input{
padding:10px;
width:200px;
}

button{
padding:10px;
background:#123a6b;
color:white;
border:none;
cursor:pointer;
}

table{
width:100%;
border-collapse:collapse;
margin-top:20px;
}

th,td{
border:1px solid black;
padding:8px;
text-align:center;
}

</style>

</head>

<body>

<%
String role=(String)session.getAttribute("role");

if(role==null){
response.sendRedirect("login.jsp");
}
%>

<center>

<h2>Create Student Marksheet</h2>

<form method="get">
<input type="text" name="regno" placeholder="Enter Registration No">
<button type="submit">Generate</button>
</form>

</center>

<br>

<%

String regno = request.getParameter("regno");

if(regno!=null){

String name="",fname="",rollno="";
int dbms=0,os=0,cn=0,maths=0,ml=0;

try{

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
			"jdbc:postgresql://ep-raspy-breeze-a1gkomre-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
			"neondb_owner",
			"npg_WP6VD1eljSKt");


PreparedStatement ps = con.prepareStatement(

"SELECT s.regno,s.rollno,s.stname,s.fname,m.DBMS,m.OS,m.CN,m.Maths,m.ML FROM student s INNER JOIN marks m ON s.regno=m.regno WHERE s.regno=?"

);

ps.setString(1,regno);

ResultSet rs = ps.executeQuery();

if(rs.next()){

name=rs.getString("stname");
fname=rs.getString("fname");
rollno=rs.getString("rollno");

dbms=rs.getInt("DBMS");
os=rs.getInt("OS");
cn=rs.getInt("CN");
maths=rs.getInt("Maths");
ml=rs.getInt("ML");

}

con.close();

}catch(Exception e){
out.println(e);
}

int total=dbms+os+cn+maths+ml;
double per=total/5.0;

String result="PASS";

if(dbms<35 || os<35 || cn<35 || maths<35 || ml<35){
result="FAIL";
}

String grade;

if(per>=75){
grade="A";
}
else if(per>=60){
grade="B";
}
else if(per>=50){
grade="C";
}
else{
grade="D";
}

%>

<div class="container">

<h2 style="text-align:center;">STUDENT MARKSHEET</h2>

<p><b>Registration No:</b> <%=regno%></p>
<p><b>Roll No:</b> <%=rollno%></p>
<p><b>Student Name:</b> <%=name%></p>
<p><b>Father Name:</b> <%=fname%></p>

<table>

<tr>
<th>Subject</th>
<th>Marks</th>
</tr>

<tr>
<td>DBMS</td>
<td><%=dbms%></td>
</tr>

<tr>
<td>OS</td>
<td><%=os%></td>
</tr>

<tr>
<td>CN</td>
<td><%=cn%></td>
</tr>

<tr>
<td>Maths</td>
<td><%=maths%></td>
</tr>

<tr>
<td>ML</td>
<td><%=ml%></td>
</tr>

<tr>
<th>Total</th>
<th><%=total%></th>
</tr>

<tr>
<th>Percentage</th>
<th><%=per%>%</th>
</tr>

<tr>
<th>Grade</th>
<th><%=grade%></th>
</tr>

<tr>
<th>Result</th>
<th style="color:red;"><%=result%></th>
</tr>

</table>

<br>

<center>
<button onclick="window.print()">Print Marksheet</button>
</center>

</div>

<%
}
%>

</body>
</html>