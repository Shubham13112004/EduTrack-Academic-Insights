<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Marks Entry</title>

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
width:420px;
border-radius:10px;
box-shadow:0 5px 20px rgba(0,0,0,0.2);
}

input{
width:100%;
padding:10px;
margin:6px 0;
}

.btn{
background:#2575fc;
color:white;
border:none;
cursor:pointer;
}

</style>

</head>

<body>

<div class="container">

<h2>Marks Entry</h2>

<form method="get">

<input type="text" name="regno" placeholder="Enter Registration No">

<input class="btn" type="submit" value="Search">

</form>

<%

String regno = request.getParameter("regno");

if(regno != null){

try{

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
			"jdbc:postgresql://ep-raspy-breeze-a1gkomre-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
			"neondb_owner",
			"npg_WP6VD1eljSKt");


PreparedStatement ps = con.prepareStatement(
"SELECT * FROM student WHERE regno=?");

ps.setString(1, regno);

ResultSet rs = ps.executeQuery();

if(rs.next()){

%>

<form action="marksentry" method="post">

<input type="hidden" name="regno" value="<%= rs.getString("regno") %>">

<input type="text" value="<%= rs.getString("stname") %>" readonly>

<input type="number" name="sub1" placeholder="Enter DBMS Marks">

<input type="number" name="sub2" placeholder="Enter OS Marks">

<input type="number" name="sub3" placeholder="Enter CN Marks">

<input type="number" name="sub4" placeholder="Enter Maths Marks">

<input type="number" name="sub5" placeholder="Enter ML Marks">

<input class="btn" type="submit" value="Save Marks">

</form>

<%

}else{
out.println("Student Not Found");
}

con.close();

}catch(Exception e){
out.println(e);
}

}

%>

</div>

</body>
</html>