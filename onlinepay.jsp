<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page import="java.io.*" %>
<%@ page import="java.*" %>
<%
String pid= request.getParameter("pid");
String quantity= request.getParameter("nop");
String cmail= request.getParameter("cmail");   
java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
 Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
    
    

	int re,tot_prize1,res1;
	     
	Statement statement2 = connection.createStatement();
  
    String sql3 = "SELECT price FROM product where pid='"+pid+"'";

    ResultSet resultSet1 = statement2.executeQuery(sql3);
    
    resultSet1.next();
    
    
    re=Integer.parseInt(resultSet1.getString("price"));
    int b1=Integer.parseInt(quantity);
    res1=re*b1;

	String tot=String.valueOf(res1);

%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 5px 20px;
  border: 1px solid lightgrey;
  border-radius: 2px;
}

input[type=text] {
  width: 50%;
  margin-bottom: 20px;
  padding: 12px;
  border: 2px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
</head>
<body>

<h2>ONLINE PAYMENT</h2>

<div class="row">
  <div class="col-75">
    <div class="container">
     
  <br><br>
      <form action="shopping.jsp" method="post">
<form action="receipt.jsp" method="post">
	<form method="post"><h4>
        <div class="row">
<!--
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="fname" placeholder="John M. Doe">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="john@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder="542 W. 15th Street">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder="New York">

            <div class="row">
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="NY">
              </div>
-->
              <div class="col-50">
                <label for="zip">Total Amount</label>
                <input type="text" id="zip" name="amount" value="<%= tot%>" placeholder="10001">
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          
        </div>
        
        <br><br>
<button class="btn" type="submit" name="submit" value="sub" onclick="myfunction()">SUBMIT<href="shopping.jsp"></button><br><br><br>
<script>
function myfunction(){
alert("Ordered Successfully");
}
</script>
    </div>
  </div>
 
</div>
<%
   
   String btn=request.getParameter("signup");
if("sub1".equals(btn)){

	try
{
java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
 connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
    
    

	int r,tot_prize,res;
	String v1 = request.getParameter("pid");
	 
	//String v2 = request.getParameter("pname");
	String v3 = request.getParameter("nop");
	         
	Statement statement1 = connection.createStatement();
  
    String sql = "SELECT price FROM product where pid='"+v1+"'";

    ResultSet resultSet = statement1.executeQuery(sql);
    
    resultSet.next();
    
    
    r=Integer.parseInt(resultSet.getString("price"));
    int b=Integer.parseInt(v3);
    res=r*b;

	String v4=String.valueOf(res);
Statement statement4 = connection.createStatement();
  
    String sql4 = "SELECT cid FROM customer where cmail='"+cmail+"'";

    ResultSet resultSet4 = statement4.executeQuery(sql4);
    
    resultSet4.next();
   String v0 = resultSet4.getString("cid");
   
 

    
                                                                                           
     java.util.Date d = new java.util.Date();
     String v6 = d.toString();
   
      Statement statement6 = connection.createStatement();                                    
	int i=statement6.executeUpdate("INSERT INTO orders(cid,pid,quantity,total,orderdate,assign) VALUES('"+v0+"','"+v1+"','"+v3+"','"+v4+"','"+v6+"','NO');");

                                                                                                                           

	if(i != 0)
   // out.println("data inserted successfully");
    resultSet.close();
	connection.close();
	}
catch(ClassNotFoundException er)
{
System.err.println("Unable to load JDBC driver"+ er);
}
	catch(SQLException e)
	{
	           out.println(" Database Error!! " +e);
	}
}	

%>
        
        

</body>
</html>
