package com.registerfile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet("/Delete")
public class Delete extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/student_marks","root","");

			PreparedStatement ps = con.prepareStatement(
					"DELETE FROM student WHERE id=?");

			ps.setInt(1, id);

			ps.executeUpdate();

			con.close();

			response.sendRedirect("viewrecord.jsp");

		}catch(Exception e){
			e.printStackTrace();
		}
	}
}