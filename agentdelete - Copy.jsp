<%-- 
    Document   : agentdelete
    Created on : 13 Oct, 2023, 11:07:23 AM
    Author     : Himanshi12
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="xyz.Conn"contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        
       Connection con=new Conn().con;
            try
            {
                 con = DriverManager.getConnection("jdbc:derby://localhost:1527/Pharmacy","user1","user");
                 int id=Integer.parseInt(request.getParameter("id"));
                 String Query = "Delete from user1.AGENT where AID="+id;
                 Statement add = con.createStatement();
                 add.executeUpdate(Query);
                 response.sendRedirect("agent.jsp");
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        
    
    %>
    
    <body>
        <p>hello</p>
    </body>
</html>

