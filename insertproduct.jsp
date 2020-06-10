
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
<title>PRODUCTS</title>
</head>
<body>

    <div class="bodyright">
<div class="registration" style="color:black;">
<form method="post"  id="reg" >
<center><br><br><br>
<h1 >Enter the Product Details:</h1>
<br><br>

Product Name:  <input type="text"   name="pname" /><br/><br/>
Price:  <input type="number"   name="price" /><br/><br/>

<button class="title" name="signup"  value="sub" onclick="myFunction()" >submit</button>
<script>
function myFunction() {
  alert("data inserted successfully");
}
</script>
<br><br>
<a href="product.jsp" style="color: black">go back</a>
</center>
</form>   
        </div></div>

</body>
</html>


<%
String btn=request.getParameter("signup");
if("sub".equals(btn)){

	try
{
java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
 
    Statement statement1 = connection.createStatement();
    String sql = "SELECT * FROM product";

    ResultSet resultSet = statement1.executeQuery(sql);
   
    

	
	//String v0 = request.getParameter("pid");
	 
	String v2 = request.getParameter("pname");
	
    String v3 = request.getParameter("price");
	
	Statement statement = connection.createStatement();
	int i=statement.executeUpdate("INSERT INTO product(pname,price) VALUES('"+v2+"','"+v3+"');");
	
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