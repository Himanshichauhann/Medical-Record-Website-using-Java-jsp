<%-- 
    Document   : validate
    Created on : 8 Oct, 2023, 11:09:54 AM
    Author     : Himanshi12
--%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection"%>
<%@page import = "xyz.Conn" contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <%
        Connection con =new Conn().con;
        String u=request.getParameter("uname");
        String p=request.getParameter("pass");
        PreparedStatement ps=con.prepareStatement("select * from "
           + "login where name=? and password=?");
        ps.setString(1,u);
        ps.setString(2,p);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            session.setAttribute("username",rs.getString(1));
            response.sendRedirect("home.html");
            
        }
        else
        {
            response.sendRedirect("error.html");
        }
    %>
    
    
    
    
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
