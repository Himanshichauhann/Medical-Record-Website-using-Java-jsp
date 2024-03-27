<%-- 
    Document   : bill
    Created on : 16 Oct, 2023, 12:22:37 AM
    Author     : Himanshi12
--%>

<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="xyz.Conn" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Medicine Billing</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script type="text/javascript">
        function insert() {
            document.form5.action = "billinsert.jsp";
            document.form5.submit();
        }
        function clearTable() 
        {
        // Clear the table contents by setting its innerHTML to an empty string
        var table = document.querySelector('.bill-summary table tbody');
        table.innerHTML = '';
    }
        

        function printBill() 
        {
            clearTable();
            window.location.href = "print.jsp";
        }
    </script>
</head>
<body>
    <header>
        
        <nav>
            <ul>
                <li><a href="Login.html">LOGIN</a></li>
                <li><a href="home.html">HOME</a></li>
                <li><a href="medicine.jsp">MEDICINE</a></li>
                <li><a href="company.jsp">COMPANY</a></li>
                <li><a href="agent.jsp">AGENT</a></li>
            </ul>
        </nav>
        <br>
        <br>
    </header>
    <div class="billing-box">
        <div class="ins">
            <form name="form5" action="bill.jsp" method="post">
               
                <p>ID</p>
                <br>
                <input type="text" name="id" value="" required/>
                <br>
                <br>
                <p>MEDICINE NAME</p>
                <br>
                <input type="text" name="medicinename" value="" required/>
                <br>
                <br>
                <p>PRICE</p>
                <br>
                <input type="text" name="price" value="" required/>
                <br>
                <br>
                <p>QUANTITY</p>
                <br>
                <input type="text" name="quantity" value="" required/>
                <br>
                <br>
                <p>COMPANY</p>
                <br>
                <input type="text" name="company" value="" required/>
                <br>
                <br>
               
                
                <div class="bt">
                    <p><input type="button" value="INSERT" onclick="insert()"/></p>
                </div>
            </form>
        </div>
        <h1>Medicine Billing</h1>
        <br>
        <h2>Bill Summary</h2>
        <div class="bill-summary">
            <table>
                <thead>
                <tr>
                    <th>Medicine Name</th>
                    <th>Price</th>
                </tr>
                </thead>
                <tbody>
                <%
                String id = "";
                String medname = "";
                String quantity = "";
                String price = "";
                String company = "";
           
                Connection con = new Conn().con;
                Statement st;
                try {
                    con = DriverManager.getConnection("jdbc:derby://localhost:1527/Pharmacy", "user1", "user");
                    st = con.createStatement();
                    ResultSet rs = st.executeQuery("Select * from user1.BILL");
                    while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString(2)%></td>
                            <td><%= rs.getString(4)%></td>
                            
                        </tr>
                        <%
                    }
                    rs.close();
                    st.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                %>
                </tbody>
            </table>
                <br>
                <button onclick="printBill()">Print</button>
        </div>
                <a class="medlink" href="Login.html">LOGOUT</a>
        <script src="script.jsp"></script>
    </div>
</body>
</html>






