<%-- 
    Document   : print
    Created on : 16 Oct, 2023, 12:39:16 AM
    Author     : Himanshi12
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="xyz.Conn" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Print Bill</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <header>
        
        <nav>
            <ul>
                <li><a href="Login.html">LOGIN</a></li>
                <li><a href="home.html">HOME</a></li>
                <li><a href="bill.jsp">BILL</a></li>
                <li><a href="medicine.jsp">MEDICINE</a></li>
                <li><a href="company.jsp">COMPANY</a></li>
                <li><a href="agent.jsp">AGENT</a></li>
            </ul>
        </nav>
        <br>
        <br>
    </header>
    <br>
    <br>
    <h1>Print Bill</h1>
    <table>
        <!-- Display bill items here -->
        <tr>
            <th>Medicine Name</th>
            <th>QUANTITY</th>
            <th>Price</th>
        </tr>
        <tbody>
                <%
                String id = "";
                String medname = "";
                String company = "";
                int totalPrice = 0;
                Connection con = new Conn().con;
                Statement st;
                try {
                    con = DriverManager.getConnection("jdbc:derby://localhost:1527/Pharmacy", "user1", "user");
                    st = con.createStatement();
                    ResultSet rs = st.executeQuery("Select * from user1.BILL");
                    while (rs.next()) {
                    medname = rs.getString("Medname");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");
                    int itemPrice = quantity * price;
                    totalPrice += itemPrice;

                        %>
                           
                        <tr>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <td><%= rs.getString(4) %></td>
                            
                        </tr>
                        <%
                    }
                    rs.close();
                    st.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                %>
        <br>
        <br>
       <table>
           <thead>
               <tr>
                <th>Total:</th>
               
            </tr>
            <tr>
                 <td ><%= totalPrice %></td>
            </tr>
           </thead>
            
        </table>
                </tbody>
        
    </table>
            <br>
    <button onclick="window.print()">Print</button>
    
   <a class="medlink" href="Login.html">LOGOUT</a>
</body>
</html>
