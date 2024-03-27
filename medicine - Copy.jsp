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
                document.form2.action="medinsert.jsp";
                document.form2.submit();
            }
            
            function mdelete()
            {
                document.form2.action="meddelete.jsp";
                document.form2.submit();
            }
            
            function mupdate()
            {
                document.form2.action="medupdate.jsp";
                document.form2.submit();
            }
          function msearch() 
         {
         var id = document.form2.id.value;
        if (id.trim() === "") 
        {
            alert("Please enter a valid Medicine ID.");
        } 
        else 
        {
            document.form2.action = "medsearch.jsp";
            document.form2.submit();
        }
    }

            </script>
    </head>
     <body id="bc">
        
         <header>
            <h1>MEDICINE INFORMATION</h1>
         <nav>
            <ul>
                <li><a href="Login.html">LOGIN</a></li>
                <li><a href="agent.jsp">AGENT</a></li>
                <li><a href="home.html">HOME</a></li>
                <li><a href="company.jsp">COMPANY</a></li>
            </ul>
        </nav>
      </header>
        <div class="container">
            <div class="regbox med">
                
               <form name="form2" action="medicine.jsp" method="post">
                <p >ID</p>
                <input type="text" name="id" value="" required/>
                <p>MEDICINE NAME</p>
                <input type="text" name="medicinename" value="" required/>
                <p>PRICE</p>
                 <input type="text" name="price" value="" required/>
                <p>QUANTITY</p>
                 <input type="text" name="quantity" value="" required/>
                <p>COMPANY</p>
                 <input type="text" name="company" value="" required/>
                <div class="bt">
                <p><input  type="button" value="INSERT" onclick="insert()"/></p>
                <p><input  type="button" value="DELETE" onclick="mdelete()"/></p>
                <p><input  type="button" value="UPDATE" onclick="mupdate()"/></p>
                <p><input  type="button" value="SEARCH" onclick="msearch()"/></p>
               
               
               </form>
           </div>
        </div>
              </div> 
        <section class="tab">
        <table name="datatable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Medicine Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Company Name</th>
            </tr>
        </thead>
        <tbody> 
            <%
                       
                String id=""; 
                String medname="";
                String price="";
                String quantity="";
                String company="";
                Connection con=new Conn().con;
                Statement st;
              try{
                con = DriverManager.getConnection("jdbc:derby://localhost:1527/Pharmacy","user1","user");
                st = con.createStatement();
               ResultSet rs = st.executeQuery("Select * from user1.MEDICINE");
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
       You are at medicine page........
    </div>
        
       <a class="medlink" href="Login.html">LOGOUT</a>
       
     </body>
</html>


