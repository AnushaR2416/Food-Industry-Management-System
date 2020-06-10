
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

<title>FORM</title>
    </head>

<body>

 <link rel="stylesheet"type="text/css"href="style1.css">

<header>

    <div class="bodyright">
<div class="registration" style="color:black;">
<form method="post"  id="reg" >
<center><br><br><br>
<h2 >Delete the Product</h2>
<br><br>
Enter the product Id: <input type="text" name="pid" required/><br/><br/>

<button class="title" name="signup"  value="sub" onclick="myFunction()" >submit</button>
<script>
function myFunction() {
  alert("data deleted successfully");
}
</script> 

   
</form>   
</div></div> 




<%
String v0 = request.getParameter("pid");
	try
{
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	
	
	
	Statement statement = connection.createStatement();
	int i=statement.executeUpdate("DELETE FROM product WHERE pid=('"+v0+"')");
	
//out.println("data deleted successfully");
	connection.close();
	}
	catch(SQLException e)
	{
	           out.println(" Database Error!! " +e);
	}
	

%>	


<br><br>
<center>
<a href="product.jsp" style="color:black" >go back</a>
</center>
</header>
</html>  