<%-- 
    Document   : signup
    Created on : 8 Oct, 2023, 12:37:49 PM
    Author     : Himanshi12
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@page import= "xyz.Conn" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% 
        
        
       Connection con=new Conn().con;
       con = DriverManager.getConnection("jdbc:derby://localhost:1527/Pharmacy","user1","user");
       String u=request.getParameter("uname");
        String p=request.getParameter("pass");
       PreparedStatement ps = con.prepareStatement("Insert into user1.LOGIN values(?,?)");
           ps.setString(1,u);
           ps.setString(2,p);
           int row= ps.executeUpdate();
            con.close();
            response.sendRedirect("Login.html");
    %>
    <body></body>
</html>
