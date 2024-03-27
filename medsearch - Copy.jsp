<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="xyz.Conn"contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    
    
    <link href="style.css" rel="stylesheet" type="text/css"/> 
<%
  
    
    Connection con = new Conn().con;
 
    con = DriverManager.getConnection("jdbc:derby://localhost:1527/Pharmacy", "user1", "user");
    String id = request.getParameter("id");

    
      PreparedStatement pstmt = con.prepareStatement("SELECT * FROM user1.MEDICINE WHERE MEDID = ?");
      pstmt.setString(1, id);
      ResultSet rs = pstmt.executeQuery();
%>
      
<body>
    <header>
            <h1>SEARCHED INFORMATION</h1>
         <nav>
            <ul>
                <li><a href="Login.html">LOGIN</a></li>
                <li><a href="agent.jsp">AGENT</a></li>
                <li><a href="home.html">HOME</a></li>
                <li><a href="company.jsp">COMPANY</a></li>
                <li><a href="medicine.jsp">COMPANY</a></li>
            </ul>
        </nav>
      </header>
    
    <br>
<center><h1><u>RECORDS FOUND ARE: </u></h1>
    <br>
    <br>
    <table border="1">
        <tr>
                <th>ID</th>
                <th>Medicine Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Company Name</th>
        </tr>
    <%
      while(rs.next())
         {
     %>
            <tr>
                <td><%= rs.getInt(1)%></td>
                <td><%= rs.getString(2)%></td>
                <td><%= rs.getInt(3)%></td>
                <td><%= rs.getInt(4)%></td>
                <td><%= rs.getString(5)%></td>
            </tr>
         <%}    
    
    %>
    </table>
</center>

</body>
</html>


