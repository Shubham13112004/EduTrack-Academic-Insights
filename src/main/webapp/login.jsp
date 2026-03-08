<!DOCTYPE html>

<html>
<head>
<title>Student Result System - Login</title>

<style>

body{
font-family:Arial;
margin:0;
background:linear-gradient(135deg,#1e3c72,#2a5298);
height:100vh;
display:flex;
justify-content:center;
align-items:center;
}

.container{
background:white;
width:380px;
padding:30px;
border-radius:10px;
box-shadow:0px 6px 20px rgba(0,0,0,0.3);
}

.logo{
text-align:center;
margin-bottom:10px;
}

.logo h1{
margin:0;
color:#1e3c72;
font-size:22px;
}

.logo p{
margin:0;
font-size:13px;
color:#555;
}

h2{
text-align:center;
margin:15px 0;
}

input,select{
width:100%;
padding:10px;
margin:8px 0;
border-radius:5px;
border:1px solid #ccc;
}

button{
width:100%;
padding:10px;
background:#1e3c72;
color:white;
border:none;
border-radius:5px;
cursor:pointer;
font-weight:bold;
}

button:hover{
background:#162c52;
}

.footer{
text-align:center;
margin-top:15px;
font-size:12px;
color:#777;
}

</style>

</head>

<body>

<div class="container">

<div class="logo">
<h1>JSPM's RSCOE College</h1>
<p>Student Result Management System</p>
</div>

<h2>Login</h2>

<form action="login" method="post">

<input type="text" name="username" placeholder="Enter Username / Reg No" required>

<input type="password" name="password" placeholder="Enter Password" required>

<select name="role">
<option value="teacher">Teacher</option>
<option value="student">Student</option>
</select>

<button type="submit">Login</button>

</form>

<div class="footer">
<p>© 2026 JSPM RSCOE College</p>
</div>

</div>

</body>
</html>
