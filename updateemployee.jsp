
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




<h2>Enter Employee details</h2>
<br>
 <div style="width: 100%; ">
<center>

<table cellspacing="10">


                       <tr><td>	Name:</td>
<td><input type="text" name="name" value="<%=request.getParameter("ename")%>"></td></tr>
<tr><td>
Phone:</td>
<td>
<input type="number" name="phone" value="<%=request.getParameter("phno")%>"></td></tr>
<tr><td>
Email:</td>
<td><input type="text" name="email" value="<%=request.getParameter("email")%>"></td></tr>
<tr><td>
sex:</td>
<td><input type="text" name="sex" value="<%=request.getParameter("sex")%>"><br></td></tr>
<tr><td>
                                 Start Date:</td>
<td><input type="date" name="startdate" value="<%=request.getParameter("startdate")%>"><br></td></tr>
<tr><td>
                                 Salary:</td>
<td><input type="number" name="salary" value="<%=request.getParameter("salary")%>"><br></td></tr>
<tr><td>
                                 
                                 
                                 City:</td>
<td><input type="text" name="city" value="<%=request.getParameter("city")%>"></td></tr>
<tr><td>
Address:</td>
<td><textarea name="adr" cols="30" rows="5" value="<%=request.getParameter("address")%>"></textarea></td></tr>
<tr><td>Date of birth:</td>
		<td> <input type="date" name="dob" value="<%=request.getParameter("dob")%>"></td></tr>
                                          
		
	

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
    String id=request.getParameter("eid");
    Statement statement1 = connection.createStatement();
    String sql = "SELECT * FROM employee WHERE eid='"+id+"'";

    ResultSet resultSet = statement1.executeQuery(sql);
   
    

	
	//String v0 = request.getParameter("eid");
	 
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
	int i=statement.executeUpdate("UPDATE employee SET ename='"+v1+"',phno='"+v2+"',mail='"+v3+"',sex='"+v4+"',startdate='"+v5+"',salary='"+v6+"',city='"+v7+"',address='"+v8+"',dob='"+v9+"' WHERE eid='"+id+"'");
	
//out.println("data updated successfully");
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
</head>
</html>	