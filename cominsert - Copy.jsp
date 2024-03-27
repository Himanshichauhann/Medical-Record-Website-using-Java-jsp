<%-- 
    Document   : cominsert
    Created on : 15 Oct, 2023, 2:49:50 PM
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
            String compname=request.getParameter("compname");
            String comphoneno=request.getParameter("comphoneno");
            String experience=request.getParameter("experience");
            String address=request.getParameter("address");
            PreparedStatement add = con.prepareStatement("Insert into user1.COMPANY values(?,?,?,?,?)");
            add.setString(1,id);
            add.setString(2,compname);
            add.setString(3,comphoneno);
            add.setString(4,experience);
            add.setString(5,address);
           
           int row = add.executeUpdate();
           
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

