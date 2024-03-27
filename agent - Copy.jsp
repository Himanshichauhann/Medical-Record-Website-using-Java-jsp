<%-- 
    Document   : agent
    Created on : 13 Oct, 2023, 1:42:24 PM
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
            
            function insert()
            {
                document.form3.action="agentinsert.jsp";
                document.form3.submit();
            }
            
            function adelete()
            {
                document.form3.action="agentdelete.jsp";
                document.form3.submit();
            }
            
            function aupdate()
            {
                document.form3.action="agentupdate.jsp";
                document.form3.submit();
            }
            function asearch()
            {
                document.form3.action="agentsearch.jsp";
                document.form3.submit();
            }
            </script>
    </head>
     <body id="abc">
      <header>
            <h1>AGENT INFORMATION</h1>
         <nav>
            <ul>
                <li><a href="Login.html">LOGIN</a></li>
                <li><a href="medicine.jsp">MEDICINE</a></li>
                <li><a href="home.html">HOME</a></li>
                <li><a href="company.jsp">COMPANY</a></li>
            </ul>
        </nav>
      </header>
         
        <div class="container">
            <div class="regbox med"> 
                
               <form name="form3" action="agent.jsp" method="post">
                <p >ID</p>
                <input type="text" name="id" value="" />
                <p>AGENT NAME</p>
                <input type="text" name="agentname" value="" />
                <p>AGE</p>
                 <input type="text" name="age" value="" />
                <p>PHONE NO</p>
                 <input type="text" name="phoneno" value="" />
                 <p>GENDER</p>
                 <input type="text" name="gender" value="" />
                
                <div class="bt">
                <p><input  type="button" value="INSERT" onclick="insert()"/></p>
                <p><input  type="button" value="DELETE" onclick="adelete()"/></p>
                <p><input  type="button" value="UPDATE" onclick="aupdate()"/></p>
               
               
               </form>
           </div>
        </div>
              </div> 
            <section class="tab">
        <table name="datatable">
        <thead>
            <tr>
                <th>ID</th>
                <th>AGENT NAME</th>
                <th>AGE</th>
                <th>PHONE NO</th>
                <th>GENDER</th>
            </tr>
        </thead>
        <tbody>
            <%
                       
                String id=""; 
                String agentname="";
                String age="";
                String phoneno="";
                String gender="";
                Connection con=new Conn().con;
                Statement st;
              try{
                con = DriverManager.getConnection("jdbc:derby://localhost:1527/Pharmacy","user1","user");
                st = con.createStatement();
               ResultSet rs = st.executeQuery("Select * from user1.AGENT");
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
         <div id="welcome-message">
       You are at AGENT page........
    </div>
      
        
              <a class="medlink" href="Login.html">LOGOUT</a>
       
     </body>
</html>



