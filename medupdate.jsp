<%-- 
    Document   : medupdate
    Created on : 11 Oct, 2023, 11:47:48 PM
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
         String id = request.getParameter("id"); 
         String medname = request.getParameter("medicinename");
         String price = request.getParameter("price"); 
         String quantity = request.getParameter("quantity"); 
         String company = request.getParameter("company");
         String updateQuery = "UPDATE user1.MEDICINE SET MEDNAME = ?, MEDPRICE = ?, MEDQTY = ?, MEDCOMPANY = ? WHERE MEDID = ?";
         PreparedStatement update = con.prepareStatement(updateQuery);
         update.setString(1, medname);
         update.setString(2, price);
         update.setString(3, quantity);
         update.setString(4,company);
         update.setString(5, id); 
         int rowsUpdated = update.executeUpdate();
         Statement st;
         st = con.createStatement();
         ResultSet rs = st.executeQuery("Select * from user1.MEDICINE");
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
            response.sendRedirect("medicine.jsp");
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
