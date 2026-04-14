<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>View Marks</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
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
background:#123a6b;
color:white;
}

tr:hover{
background:#f2f2f2;
}

</style>

</head>

<body>

<h2>Student Marks Record</h2>

<table>

<tr>
<th>Reg No</th>
<th>Roll No</th>
<th>Student Name</th>
<th>Father Name</th>
<th>DBMS</th>
<th>OS</th>
<th>CN</th>
<th>Maths</th>
<th>ML</th>
<th>Total</th>
<th>Percentage</th>
<th>Edit</th>
</tr>

<%

try{

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
			"jdbc:postgresql://ep-raspy-breeze-a1gkomre-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
			"neondb_owner",
			"npg_WP6VD1eljSKt");

PreparedStatement ps = con.prepareStatement(

"SELECT s.regno,s.rollno,s.stname,s.fname,m.DBMS,m.OS,m.CN,m.Maths,m.ML FROM student s INNER JOIN marks m ON s.regno = m.regno"

);

ResultSet rs = ps.executeQuery();

while(rs.next()){

int dbms = rs.getInt("DBMS");
int os = rs.getInt("OS");
int cn = rs.getInt("CN");
int maths = rs.getInt("Maths");
int ml = rs.getInt("ML");

int total = dbms + os + cn + maths + ml;
double per = total / 5.0;

%>

<tr>

<td><%= rs.getString("regno") %></td>
<td><%= rs.getString("rollno") %></td>
<td><%= rs.getString("stname") %></td>
<td><%= rs.getString("fname") %></td>

<td><%= dbms %></td>
<td><%= os %></td>
<td><%= cn %></td>
<td><%= maths %></td>
<td><%= ml %></td>

<td><%= total %></td>
<td><%= per %>%</td>
<td style="color:green">
<a href="editmarks.jsp?regno=<%= rs.getString("regno") %>">
<i class="fa-regular fa-pen-to-square"></i>
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

</body>
</html>