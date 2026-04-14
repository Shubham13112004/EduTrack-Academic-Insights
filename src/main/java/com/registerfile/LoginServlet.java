package com.registerfile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

protected void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException{

String username=request.getParameter("username");
String password=request.getParameter("password");
String role=request.getParameter("role");

try{

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
			"jdbc:postgresql://ep-raspy-breeze-a1gkomre-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
			"neondb_owner",
			"npg_WP6VD1eljSKt");

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM users WHERE username=? AND password=? AND role=?");

ps.setString(1,username);
ps.setString(2,password);
ps.setString(3,role);

ResultSet rs=ps.executeQuery();

if(rs.next()){

HttpSession session=request.getSession();

session.setAttribute("username",username);
session.setAttribute("role",role);

session.setMaxInactiveInterval(15 * 60);


if(role.equals("teacher")){

response.sendRedirect("dashboard.jsp");

}else{

response.sendRedirect("marksheet.jsp?regno="+username);

}

}else{

response.getWriter().println("<h2>Invalid Login</h2>");

}

}catch(Exception e){

response.getWriter().println(e);

}

}
}