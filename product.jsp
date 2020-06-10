<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.*" %>
	<!DOCTYPE html>
<html>
<head>

 <link rel="stylesheet"type="text/css"href="style1.css">
<body>
<style>
a{
color:black;
}
</style>

<header>
<br>
<h1 align="center"><font color="#000"><strong>Product Details</strong></font></h1>

        <div class="main">
       
        <ul>
            
            <li><a href="insertproduct.jsp">Insert</a></li>
            <li><a href="deleteproduct.jsp">Delete</a></li>
            <li><a href="index.html">Go Back</a></li>
            
            
            </ul>
        </div>
        
<br><br>


<br><br>
<table style="border:1px solid black; margin-left:auto; margin-right:auto; color:black;text-align:center"  width="500" cellpadding="6" cellspacing="6" border="1">

<tr>
<tr>
<td bgcolor="lightcoral"><b>PID</b></td>
<td bgcolor="lightcoral"><b>PNAME</b></td>
<td bgcolor="lightcoral"><b>PRICE</b></td>
<td bgcolor="lightcoral"><b>UPDATE</b></td>

</tr>
<%

try
	{
	java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	
Statement statement1 = connection.createStatement();
String sql = "SELECT * FROM product";

ResultSet resultSet = statement1.executeQuery(sql);
while (resultSet.next()) {
%>

<tr>
<td bgcolor="lightpink"><%=resultSet.getString("pid")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("pname")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("price")%></td>

<td bgcolor="lightpink"  ><a href="updateproduct.jsp?pid=<%=resultSet.getString("pid")%>">update</a></td>

</tr>

<%
}
}

catch(ClassNotFoundException er)
{
System.err.println("Unable to load JDBC driver"+ er);
}
catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</header>
</body>
</html>


	

	





