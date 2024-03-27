<%-- 
    Document   : medicine
    Created on : 13 Oct, 2023, 11:38:13 AM
    Author     : Himanshi12
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="xyz.Conn"contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
         <title>page of pharmacy</title>
        <link href="style.css" rel="stylesheet" type="text/css"/> 
        
        <script type="text/javascript">
            
            function cinsert()
            {
                document.form4.action="cominsert.jsp";
                document.form4.submit();
            }
            
            function cdelete()
            {
                document.form4.action="comdelete.jsp";
                document.form4.submit();
            }
            
            function cupdate()
            {
                document.form4.action="comupdate.jsp";
                document.form4.submit();
            }
            function csearch()
            {
                document.form4.action="comsearch.jsp";
                document.form4.submit();
            }
            
            const welcomeMessageDiv = document.getElementById("welcome-message");
            welcomeMessageDiv.textContent = "Welcome to the company webpage!";
            </script>
    </head>
     <body id="compbc">
         <%
     
         %>
         <header>
            <h1>COMPANY INFORMATION</h1>
         <nav>
            <ul>
                <li><a href="Login.html">LOGIN</a></li>
                <li><a href="agent.jsp">AGENT</a></li>
                <li><a href="home.html">HOME</a></li>
                <li><a href="medicine.jsp">MEDICINE</a></li>
            </ul>
        </nav>
      </header>
        <div class="container">
            <div class="regbox med">
                
               <form name="form4" action="company.jsp" method="post">
                <p >ID</p>
                <input type="text" name="id" value="" />
                <p>COMPANY NAME</p>
                <input type="text" name="compname" value="" />
                <p>PHONE NO</p>
                 <input type="text" name="comphoneno" value="" />
                <p>EXPERIENCE</p>
                 <input type="text" name="experience" value="" />
                <p>ADDRESS</p>
                <input type="text" name="address" value="" />
                <div class="bt">
                <p ><input type="button" value="INSERT" onclick="cinsert()"/></p>
                <p><input  type="button" value="DELETE" onclick="cdelete()"/></p>
                <p><input  type="button" value="UPDATE"  onclick="cupdate()"/></p>
             </form>
           </div>
        </div>
              </div> 
            <section class="tab">
        <table name="datatable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Company Name</th>
                <th>Phone.No</th>
                <th>Experience</th>
                <th>Address</th>
            </tr>
        </thead>
        <tbody>
            <%
                       
                String id=""; 
                String compname="";
                String comphoneno="";
                String experience="";
                String address="";
                Connection con=new Conn().con;
                Statement st;
              try{
                con = DriverManager.getConnection("jdbc:derby://localhost:1527/Pharmacy","user1","user");
                st = con.createStatement();
               ResultSet rs = st.executeQuery("Select * from user1.Company");
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
             rs.close();
             st.close();
       }
     catch(SQLException e)
     {
           e.printStackTrace();
     }
         %>   
        </tbody>
    </table>
    </section>
         
      <div id="compwelcome-message">
       You are at company page........
    </div>
        
              <a class="medlink" href="Login.html">LOGOUT</a>
       
     </body>
     
     

</html>


