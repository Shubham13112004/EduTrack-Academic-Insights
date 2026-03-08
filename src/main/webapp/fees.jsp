<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Registration Fee</title>

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

input,select{
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

<h2>Registration Fee</h2>

<form action="fees" method="post">

<input type="text" name="regno" placeholder="Enter Registration No">

<input type="number" name="amount" placeholder="Enter Amount">

<select name="status">
<option value="PAID">PAID</option>
<option value="NOT PAID">NOT PAID</option>
</select>

<input class="btn" type="submit" value="Save Fee">

</form>

</div>

</body>
</html>