
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.DriverManager" %>

<%@ page import="java.*" %>

 

	<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet"type="text/css"href="style1.css">

<header>
<title>Employees</title>
</head>
<body>

    <div class="bodyright">
<div class="registration" style="color:black;">
<form method="post"  id="reg" >
<center><br><br><br>




<h2>Customer Registration</h2>
<br>
 <div style="width: 100%; ">
<center>
<table cellspacing="10">
                       <tr><td>NAME:</td>
<td><input type="text" name="name" required></td></tr>

                       <tr><td>	PHONE NUMBER:</td>
<td><input type="number" name="pno" required></td></tr>




	
		
		


	
	
<tr><td>
Email Id:</td>
<td>
<input type="text" name="email" required></td></tr>
<tr><td>
Sex:</td>
<td><input type="text" name="sex"></td></tr>
<tr><td>
City:</td>
<td><input type="text" name="city" required><br></td></tr>
<tr><td>
                                
<tr><td>
Address:</td>
<td><textarea name="adr" cols="30" rows="5"></textarea></td></tr>
<tr><td>Password:</td>
		<td> <input type="password" name="pass" required></td></tr>
<tr><td>Re-enter Password:</td>
		<td> <input type="password" name="rpass" required></td></tr>
                                          
		
		

</table><br>

                                          
 




<button class="title" name="signup"  value="sub" onclick="myFunction()" >submit</button>
</center>
<script>
function myFunction() {
  alert("data inserted successfully");
}
</script>
<br>
<a href="login.html" style="color: black">go back</a>
</center>
</form>   
        </div></div>
</head>




<%
String btn=request.getParameter("signup");
if("sub".equals(btn)){

	try
{
java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
 
    Statement statement1 = connection.createStatement();
    String sql = "SELECT * FROM customer";

    ResultSet resultSet = statement1.executeQuery(sql);
   
    

	
	 
	String v1 = request.getParameter("name");
	
    String v2 = request.getParameter("pno");
String v3 = request.getParameter("email");
	 
	String v4 = request.getParameter("sex");
	
    String v5 = request.getParameter("city");
String v6 = request.getParameter("adr");
	 
	String v7 = request.getParameter("pass");
	
   
	
	
	
	Statement statement = connection.createStatement();
	int i=statement.executeUpdate("INSERT INTO customer(cname,cphno,cmail,sex,ccity,caddress,cpassword,tot_trans_amt) VALUES('"+v1+"','"+v2+"','"+v3+"','"+v4+"','"+v5+"','"+v6+"','"+v7+"',0);");
	
//out.println("data inserted successfully");
	connection.close();
	}
catch (ClassNotFoundException er) {
	System.err.println("Unable to load JDBC bridge "+er);
}
	catch(SQLException e)
	{
	           out.println(" Database Error!! " +e);
	}
}	

%>
</header>
</html>	