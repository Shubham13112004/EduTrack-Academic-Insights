package com.registerfile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/updatemarks")
public class updatemarks extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

response.setContentType("text/html");
PrintWriter pw = response.getWriter();

String regno = request.getParameter("regno");

int sub1 = Integer.parseInt(request.getParameter("sub1"));
int sub2 = Integer.parseInt(request.getParameter("sub2"));
int sub3 = Integer.parseInt(request.getParameter("sub3"));
int sub4 = Integer.parseInt(request.getParameter("sub4"));
int sub5 = Integer.parseInt(request.getParameter("sub5"));

try{

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
			"jdbc:postgresql://ep-raspy-breeze-a1gkomre-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
			"neondb_owner",
			"npg_WP6VD1eljSKt");


PreparedStatement ps = con.prepareStatement(
"UPDATE marks SET DBMS=?,OS=?,CN=?,Maths=?,ML=? WHERE regno=?");

ps.setInt(1, sub1);
ps.setInt(2, sub2);
ps.setInt(3, sub3);
ps.setInt(4, sub4);
ps.setInt(5, sub5);
ps.setString(6, regno);

int i = ps.executeUpdate();

if(i>0){
pw.println("<h2>Marks Updated Successfully</h2>");
}else{
pw.println("<h2>Update Failed</h2>");
}

con.close();

}catch(Exception e){
pw.println(e);
}

}
}