<%-- 
    Document   : meddelete
    Created on : 11 Oct, 2023, 11:35:41 PM
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
                 String Query = "Delete from user1.MEDICINE where Medid="+id;
                 Statement add = con.createStatement();
                 add.executeUpdate(Query);
                 response.sendRedirect("medicine.jsp");
            }
            catch(SQLException e)
            {
                e.printStackTrace();
            }
        
    
    %>
    
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
