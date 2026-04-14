<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Edit Marks</title>

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
width:400px;
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

<h2>Edit Marks</h2>

<%

String regno = request.getParameter("regno");

try{

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
			"jdbc:postgresql://ep-raspy-breeze-a1gkomre-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
			"neondb_owner",
			"npg_WP6VD1eljSKt");


PreparedStatement ps = con.prepareStatement(
"SELECT * FROM marks WHERE regno=?");

ps.setString(1, regno);

ResultSet rs = ps.executeQuery();

if(rs.next()){

%>

<form action="updatemarks" method="post">

<input type="hidden" name="regno" value="<%= rs.getString("regno") %>">

<label>DBMS</label>
<input type="number" name="sub1" value="<%= rs.getInt("DBMS") %>">

<label>OS</label>
<input type="number" name="sub2" value="<%= rs.getInt("OS") %>">

<label>CN</label>
<input type="number" name="sub3" value="<%= rs.getInt("CN") %>">

<label>Maths</label>
<input type="number" name="sub4" value="<%= rs.getInt("Maths") %>">

<label>ML</label>
<input type="number" name="sub5" value="<%= rs.getInt("ML") %>">

<input class="btn" type="submit" value="Update Marks">

</form>

<%

}

con.close();

}catch(Exception e){
out.println(e);
}

%>

</div>

</body>
</html>