<%-- 
    Document   : agentinsert
    Created on : 13 Oct, 2023, 10:59:57 AM
    Author     : Himanshi12
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="xyz.Conn" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <% 
            Connection con=new Conn().con;
            try
            {
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/Pharmacy","user1","user");
            String id=request.getParameter("id"); 
            String agentname=request.getParameter("agentname");
            String age=request.getParameter("age");
            String phoneno=request.getParameter("phoneno");
            String gender=request.getParameter("gender");
            PreparedStatement add = con.prepareStatement("Insert into user1.AGENT values(?,?,?,?,?)");
            add.setString(1,id);
            add.setString(2,agentname);
            add.setString(3,age);
            add.setString(4,phoneno);
            add.setString(5,gender);
           
           int row = add.executeUpdate();
           
            Statement st;
            st = con.createStatement();
            ResultSet rs = st.executeQuery("Select * from user1.AGENT");
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
            response.sendRedirect("agent.jsp");
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
