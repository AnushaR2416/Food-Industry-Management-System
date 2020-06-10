
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
<div class="registration" style="color: black;">
<form method="post"  id="reg" >
<center><br><br><br>




<h2>Enter Employee details</h2>
<br>
 <div style="width: 100%; ">
<center>
<table cellspacing="10">
                       <tr><td>EID:</td>
<td><input type="text" name="eid" required></td></tr>

                       <tr><td>	Name:</td>
<td><input type="text" name="name" required></td></tr>




	
		
		


	
	
<tr><td>
Phone:</td>
<td>
<input type="number" name="phone"></td></tr>
<tr><td>
Email:</td>
<td><input type="text" name="email"></td></tr>
<tr><td>
sex:</td>
<td><input type="text" name="sex" required><br></td></tr>
<tr><td>
                                 Start Date:</td>
<td><input type="date" name="startdate" required><br></td></tr>
<tr><td>
                                 Salary:</td>
<td><input type="number" name="salary" required><br></td></tr>
<tr><td>
                                 
                                 
                                 City:</td>
<td><input type="text" name="city" required></td></tr>
<tr><td>
Address:</td>
<td><textarea name="adr" cols="30" rows="5"></textarea></td></tr>
<tr><td>Date of birth:</td>
		<td> <input type="date" name="dob" required></td></tr>
                                          
		
		

</table><br>

                                          
 




<button class="title" name="signup"  value="sub" onclick="myFunction()" >submit</button>
</center>
<script>
function myFunction() {
  alert("data inserted successfully");
}
</script>
<br>
<a href="employee.jsp" style="color: black">go back</a>
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
    String sql = "SELECT * FROM employee";

    ResultSet resultSet = statement1.executeQuery(sql);
   
    

	
	String v0 = request.getParameter("eid");
	 
	String v1 = request.getParameter("name");
	
    String v2 = request.getParameter("phone");
String v3 = request.getParameter("email");
	 
	String v4 = request.getParameter("sex");
	
    String v5 = request.getParameter("startdate");
String v6 = request.getParameter("salary");
	 
	String v7 = request.getParameter("city");
	
    String v8 = request.getParameter("adr");
	String v9 = request.getParameter("dob");
	
	
	
	Statement statement = connection.createStatement();
	int i=statement.executeUpdate("INSERT INTO employee VALUES('"+v0+"','"+v1+"','"+v2+"','"+v3+"','"+v4+"','"+v5+"','"+v6+"','"+v7+"','"+v8+"','"+v9+"');");
	
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
</body>
</html>	