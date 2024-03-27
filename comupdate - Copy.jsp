<%-- 
    Document   : agentupdate
    Created on : 13 Oct, 2023, 11:07:34 AM
    Author     : Himanshi12
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="xyz.Conn" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
         Connection con=new Conn().con;
         try{
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/Pharmacy","user1","user");
            String id=request.getParameter("id"); 
            String agentname=request.getParameter("compname");
            String phoneno=request.getParameter("comphoneno");
            String experience=request.getParameter("experience");
            String address=request.getParameter("address");
            String updateQuery = "UPDATE user1.COMPANY SET COMPNAME = ?, PHONE = ?, EXPERIENCE = ?, ADDRESS = ? WHERE ID = ?";
            PreparedStatement add = con.prepareStatement(updateQuery);
            add.setString(1,agentname);
            add.setString(2,phoneno);
            add.setString(3,experience);
            add.setString(4,address);
            add.setString(5,id);
            
         
         
       
         int rowsUpdated = add.executeUpdate();
         Statement st;
         st = con.createStatement();
         ResultSet rs = st.executeQuery("Select * from user1.COMPANY");
         while(rs.next())
         {
    %>
             <tr>
                <td><%= rs.getString(1)%></td>
                <td><%= rs.getString(2)%></td>
                <td><%= rs.getString(3)%></td>
                <td><%= rs.getString(4)%></td>
                <td><%= rs.getString(5)%></td>
            </tr>
         <%}
            response.sendRedirect("company.jsp");
             rs.close();
             st.close();
            con.close();
          }
          catch(SQLException e)
          {
           e.printStackTrace();
          }
         %>
    <body>
        
    </body>
</html>


