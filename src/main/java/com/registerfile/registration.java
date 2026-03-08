package com.registerfile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/register")
public class registration extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        String regno = request.getParameter("regno");
        String rollno = request.getParameter("rollno");
        String stname = request.getParameter("stname");
        String fname = request.getParameter("fname");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String dist = request.getParameter("dist");
        String state = request.getParameter("state");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/student_marks", "root", "");

            PreparedStatement ps = con.prepareStatement(
            "INSERT INTO student(regno,rollno,stname,fname,dob,address,dist,state) VALUES(?,?,?,?,?,?,?,?)");

            ps.setString(1, regno);
            ps.setString(2, rollno);
            ps.setString(3, stname);
            ps.setString(4, fname);
            ps.setString(5, dob);
            ps.setString(6, address);
            ps.setString(7, dist);
            ps.setString(8, state);

            int i = ps.executeUpdate();

            if(i>0){
            	
                pw.println("<h2>Student Registered Successfully</h2>");
            }else{
                pw.println("<h2>Registration Failed</h2>");
            }

            con.close();

        } catch(Exception e) {
            pw.println(e);
        }
    }
}