///* 
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// *
// */
//import java.sql.*;
//
//import java.util.ArrayList;
//let billItems = [];
//
//
//private static MedicineDetails fetchMedicineDetails(int medicineId) {
//  MedicineDetails medicineDetails = null;
//
//  try {
//    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/Pharmacy","user1","user");
//    Statement statement = connection.createStatement();
//    ResultSet resultSet = statement.executeQuery("SELECT ID, MEDNAME, PRICE FROM BILL WHERE id = " + medicineId);
//
//    // Get the first medicine details object from the result set
//    if (resultSet.next()) {
//      medicineDetails = new MedicineDetails();
//      medicineDetails.setId(resultSet.getInt("id"));
//      medicineDetails.setMedicinename(resultSet.getString("medname"));
//      medicineDetails.setPrice(resultSet.getString("price"));
//    }
//    resultSet.close();
//    statement.close();
//    connection.close();
//  } catch (SQLException e) {
//    e.printStackTrace();
//  }
//
//  return medicineDetails;
//}
//function addToBill(medicineId){
//  const medicineDetails = fetchMedicineDetails(medicineId);
//  if (medicineDetails == null) {
//    return;
//}
//  billItems.push(medicineDetails);
//  updateBillSummary();
//}
//
//function updateBillSummary() {
//    // Update the bill summary table with the items in the bill
//    const summaryTable = document.querySelector(".bill-summary table");
//    // Clear existing rows
//    summaryTable.innerHTML = "<tr><th>Medicine Name</th><th>Price</th></tr>";
//
//    // Add items to the table
//    for (const item of billItems) {
//        const row = `<tr><td>${"medname"}</td><td>${"price"}</td></tr>`;
//        summaryTable.innerHTML += row;
//    }
//}
//
//function printBill() {
//    
//    window.location.href = "print.jsp";
//}


let billItems = [];

function addToBill(medicineId) {
    
    const medicineDetails = {
        id: ,
        medname:,
        price:,
    };

    billItems.push(medicineDetails);
    updateBillSummary();
}

function updateBillSummary() {
    // Update the bill summary table with the items in the bill
    const summaryTable = document.querySelector(".bill-summary table");
    // Clear existing rows
    summaryTable.innerHTML = "<tr><th>Medicine Name</th><th>Price</th></tr>";

    // Add items to the table
    for (const item of billItems) {
        const row = `<tr><td>${item.name}</td><td>$${item.price.toFixed(2)}</td></tr>`;
        summaryTable.innerHTML += row;
    }
}

function printBill() {
    // Redirect to a print page or use a printing library
    // You can create a new JSP page for printing
    window.location.href = "print.jsp";
}