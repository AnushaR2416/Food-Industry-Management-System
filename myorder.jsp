<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.*" %>
	<!DOCTYPE html>

<html>
    <head>
    <body>
 <link rel="stylesheet"type="text/css"href="style1.css">
<style>
a{
color:black;
}
</style>


<br>
<h1 align="center"><font color="#000"><strong>Order Details</strong></font></h1>

        <div class="main">
       
        <ul>
            
            
         
            <li><a href="shopping.jsp">Go Back</a></li>
            
            
            </ul>
        </div>
        
<br><br>


<br><br>
<table style="border:1px solid black; margin-left:auto; margin-right:auto; color:black;text-align:center"  width="1000" cellpadding="5" cellspacing="5" border="1">

<tr>
<tr>
<td bgcolor="lightcoral"><b>ORDER N0.</b></td>
<td bgcolor="lightcoral"><b>PRODUCT NAME</b></td>
<td bgcolor="lightcoral"><b><b>PRICE</b></b></td>
<td bgcolor="lightcoral"><b>QUANTITY</b></td>
<td bgcolor="lightcoral"><b>TOTAL PRICE</b></td>
<td bgcolor="lightcoral"><b>ORDER DATE</b></td>



</tr>
<%

try
	{
String cmail=request.getParameter("cmail");
	java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	
Statement statement1 = connection.createStatement();

String sql="select o.ordno,p.pname,p.price,o.quantity,o.total,o.orderdate FROM orders o ,product p,customer c where o.pid=p.pid and o.cid=c.cid and c.cmail='"+cmail+"' order by orderdate desc ";
	

ResultSet resultSet = statement1.executeQuery(sql);
while (resultSet.next()) {
%>

<tr>
<td><%=resultSet.getString("ordno")%></td>
<td><%=resultSet.getString("pname")%></td>
<td><%=resultSet.getString("price")%></td>
<td><%=resultSet.getString("quantity")%></td>
<td><%=resultSet.getString("total")%></td>
<td><%=resultSet.getString("orderdate")%></td>


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
    
</body>
    </head>
</html>


	

	





