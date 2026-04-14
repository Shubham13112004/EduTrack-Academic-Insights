package com.registerfile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/update")
public class Update extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		int id = Integer.parseInt(request.getParameter("id"));

		String regno = request.getParameter("regno");
		String rollno = request.getParameter("rollno");
		String stname = request.getParameter("stname");
		String fname = request.getParameter("fname");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String dist = request.getParameter("dist");
		String state = request.getParameter("state");

		try {

			Class.forName("org.postgresql.Driver");

			Connection con = DriverManager.getConnection(
					"jdbc:postgresql://ep-raspy-breeze-a1gkomre-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
					"neondb_owner",
					"npg_WP6VD1eljSKt");


			PreparedStatement ps = con.prepareStatement(
			"UPDATE student SET regno=?,rollno=?,stname=?,fname=?,dob=?,address=?,dist=?,state=? WHERE id=?");

			ps.setString(1, regno);
			ps.setString(2, rollno);
			ps.setString(3, stname);
			ps.setString(4, fname);
			ps.setString(5, dob);
			ps.setString(6, address);
			ps.setString(7, dist);
			ps.setString(8, state);
			ps.setInt(9, id);

			int i = ps.executeUpdate();

			if(i>0){
				response.sendRedirect("viewrecord.jsp");
			}else{
				pw.println("Update Failed");
			}

			con.close();

		}catch(Exception e){
			pw.println(e);
		}
	}
}