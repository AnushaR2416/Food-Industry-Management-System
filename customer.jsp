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
<h1 align="center"><font color="#000"><strong>CUSTOMER DETAILS</strong></font></h1>
<br>
        <div class="main">
       
        <ul>
            
            
         
            <li><a href="index.html">Go Back</a></li>
            <br>
            
            </ul>
        </div>
        
<br><br>
  <br><br> 


<table style="border:1px solid black; margin-left:auto; margin-right:auto; color:black;text-align:center"  width="1000" cellpadding="5" cellspacing="5" border="1">
<br>
<tr>
<tr>
<td bgcolor="lightcoral"><b>CID</b></td>
<td bgcolor="lightcoral"><b><b>CUSTOMER NAME</b></b></td>
<td bgcolor="lightcoral"><b>PHONE NUMBER</b></td>
<td bgcolor="lightcoral"><b>MAIL</b></td>
<td bgcolor="lightcoral"><b>SEX</b></td>
<td bgcolor="lightcoral"><b>CITY</b></td>
<td bgcolor="lightcoral"><b>ADDRESS</b></td>
<td bgcolor="lightcoral"><b>PASSWORD</b></td>
<td bgcolor="lightcoral"><b>TOTAL TRANSACTION AMT</b></td>



</tr>
<%

try
	{
	java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	
Statement statement1 = connection.createStatement();
String sql = "SELECT * FROM customer";

ResultSet resultSet = statement1.executeQuery(sql);
while (resultSet.next()) {
%>

<tr>
<td   bgcolor="lightpink"><%=resultSet.getString("cid")%></td>
<td   bgcolor="lightpink"><%=resultSet.getString("cname")%></td>
<td   bgcolor="lightpink"><%=resultSet.getString("cphno")%></td>
<td   bgcolor="lightpink"><%=resultSet.getString("cmail")%></td>
<td   bgcolor="lightpink"><%=resultSet.getString("sex")%></td>
<td   bgcolor="lightpink"><%=resultSet.getString("ccity")%></td>
<td   bgcolor="lightpink"><%=resultSet.getString("caddress")%></td>
<td   bgcolor="lightpink"><%=resultSet.getString("cpassword")%></td>
<td   bgcolor="lightpink"><%=resultSet.getString("tot_trans_amt")%></td>


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
    <br><br>
     <%
    java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
	 Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	
Statement statement2 = connection.createStatement();
String sql1 = "call maxtrans";
ResultSet rs = statement2.executeQuery(sql1);
while (rs.next()) {
               
%>
   <center>            
<h4>The customer with highest amount of transaction is <%= rs.getString("cname")%> and his total transaction is <%= rs.getString("max_transaction")%> </%></h4></center>
    <br><br>
    <%
       }
       %>
</header>
</html>


	

	





