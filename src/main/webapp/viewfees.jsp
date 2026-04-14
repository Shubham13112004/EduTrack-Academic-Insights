<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Fees Records</title>

<style>

body{
font-family:Arial;
background:#f4f4f4;
padding:30px;
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

</style>

</head>

<body>

<h2>Fees Records</h2>

<table>

<tr>
<th>ID</th>
<th>Reg No</th>
<th>Amount</th>
<th>Status</th>
</tr>

<%

try{

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
			"jdbc:postgresql://ep-raspy-breeze-a1gkomre-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
			"neondb_owner",
			"npg_WP6VD1eljSKt");


PreparedStatement ps=con.prepareStatement("SELECT * FROM fees");

ResultSet rs=ps.executeQuery();

while(rs.next()){

%>

<tr>

<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("regno")%></td>
<td><%=rs.getInt("amount")%></td>
<td><%=rs.getString("status")%></td>

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