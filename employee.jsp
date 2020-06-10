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
<h1 align="center"><font color="#000"><strong>EMPLOYEE DETAILS</strong></font></h1>

        <div class="main">
       
        <ul>
            
            <li><a href="insertemployee.jsp">Insert</a></li>
            <li><a href="deleteemployee.jsp">Delete</a></li>
            <li><a href="index.html">Go Back</a></li>
            
            
            </ul>
        </div>
        
<br><br>


<br><br>
<table style="border:1px solid black; margin-left:auto; margin-right:auto; color:black;text-align:center;"  width="1000" cellpadding="6" cellspacing="6" border="1">

<tr>
<tr>
<td bgcolor="lightcoral"><b>EID</b></td>
<td bgcolor="lightcoral"><b><b>EMPLOYEE NAME</b></b></td>
<td bgcolor="lightcoral"><b>PHONE NUMBER</b></td>
<td bgcolor="lightcoral"><b>MAIL  </b></td>
<td bgcolor="lightcoral"><b>SEX  </b></td>
<td bgcolor="lightcoral"><b>START DATE  </b></td>
<td bgcolor="lightcoral"><b>SALARY  </b></td>
<td bgcolor="lightcoral"><b>CITY</b></td>
<td bgcolor="lightcoral"><b><b>ADDRESS</b></b></td>
<td bgcolor="lightcoral"><b>DOB   </b></td>
<td bgcolor="lightcoral"><b>UPDATE</b></td>


</tr>
<%

try
	{
	java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	
Statement statement1 = connection.createStatement();
String sql = "SELECT * FROM employee";

ResultSet resultSet = statement1.executeQuery(sql);
while (resultSet.next()) {
%>

<tr>
<td bgcolor="lightpink"><%=resultSet.getString("eid")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("ename")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("phno")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("mail")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("sex")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("startdate")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("salary")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("city")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("address")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("dob")%></td>


<td   bgcolor="lightpink"><a href="updateemployee.jsp?eid=<%=resultSet.getString("eid")%>&ename=<%=resultSet.getString("ename")%>&phno=<%=resultSet.getString("phno")%>&email=<%=resultSet.getString("mail")%>&sex=<%=resultSet.getString("sex")%>&address=<%=resultSet.getString("address")%>&startdate=<%=resultSet.getString("startdate")%>&salary=<%=resultSet.getString("salary")%>&city=<%=resultSet.getString("city")%>&address=<%=resultSet.getString("address")%>&dob=<%=resultSet.getString("dob")%>">update</a></td>

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
</html>


	

	





