<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.*" %>
	<!DOCTYPE html>


 <link rel="stylesheet"type="text/css"href="style1.css">
<style>
a{
color:black;
}
</style>

<header>
<br>
<h1 align="center"><font color="#000"><strong>Sale Details</strong></font></h1>

        <div class="main">
       
        <ul>
            
           
            <li><a href="index.html">Go Back</a></li>
            
            
            </ul>
        </div>
        
<br><br>


<br><br>
<table style="border:1px solid black; margin-left:auto; margin-right:auto; color:black;text-align:center"  width="500" cellpadding="5" cellspacing="5" border="1">

<tr>
<tr>

<td bgcolor="lightcoral"><b>EID</b></td>
<td bgcolor="lightcoral"><b>EMPLOYEE NAME</b></td>
    <td bgcolor="lightcoral"><b>0RDER NO</b></td>


</tr>
<%

try
	{
	java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	
Statement statement1 = connection.createStatement();
String sql = "SELECT s.eid,e.ename,s.ordno FROM employee e , sale s where s.eid=e.eid";

ResultSet resultSet = statement1.executeQuery(sql);
while (resultSet.next()) {
%>

<tr>
<td bgcolor="lightpink"><%=resultSet.getString("eid")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("ename")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("ordno")%></td>


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


	

	





