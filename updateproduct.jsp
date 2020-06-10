
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




<h2>Update Product Details </h2>
<br>
 <div style="width: 100%; ">
<center>
<table cellspacing="10">
                      

                       <tr><td>	Enter the updated price:</td>
<td><input type="number" name="price" required></td></tr>




	
		
		


	
	

                                 
                              
</table><br>

                                          
 




<button class="title" name="signup"  value="sub" onclick="myFunction()" >submit</button>
</center>
<script>
function myFunction() {
  alert("data updated successfully");
}
</script>
<br>
<a href="product.jsp" style="color: white">go back</a>
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
     String id=request.getParameter("pid");
    Statement statement1 = connection.createStatement();
    String sql = "SELECT * FROM product WHERE pid='"+id+"'";

    ResultSet resultSet = statement1.executeQuery(sql);
   
    

	
	//String v0 = request.getParameter("eid");
	 
	String v1 = request.getParameter("price");
	
   
	
	
	Statement statement = connection.createStatement();
	int i=statement.executeUpdate("UPDATE product SET price='"+v1+"' WHERE pid='"+id+"'");
	
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
</html>	