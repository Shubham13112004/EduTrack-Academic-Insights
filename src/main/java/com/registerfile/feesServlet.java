package com.registerfile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/fees")
public class feesServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException{

response.setContentType("text/html");
PrintWriter pw=response.getWriter();

String regno=request.getParameter("regno");
int amount=Integer.parseInt(request.getParameter("amount"));
String status=request.getParameter("status");

try{

	Class.forName("org.postgresql.Driver");

	Connection con = DriverManager.getConnection(
			"jdbc:postgresql://ep-raspy-breeze-a1gkomre-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
			"neondb_owner",
			"npg_WP6VD1eljSKt");


PreparedStatement ps=con.prepareStatement(
"INSERT INTO fees(regno,amount,status) VALUES(?,?,?)");

ps.setString(1,regno);
ps.setInt(2,amount);
ps.setString(3,status);

int i=ps.executeUpdate();

if(i>0){
pw.println("<h2>Fee Saved Successfully</h2>");
}else{
pw.println("<h2>Fee Not Saved</h2>");
}

con.close();

}catch(Exception e){
pw.println(e);
}

}
}