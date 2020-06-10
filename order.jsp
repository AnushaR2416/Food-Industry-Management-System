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
<body>
<header>
<br>
<h1 align="center"><font color="#000"><strong>ORDER DETAILS</strong></font></h1>

        <div class="main">
       
        <ul>
            
            
         
            <li><a href="index.html">Go Back</a></li>
            
            
            </ul>
        </div>
        
<br><br>


<br><br>
    <center><h2>Unassigned Orders</h2></center>
    <br>
<table style="border:1px solid black; margin-left:auto; margin-right:auto; color:black;text-align:center"  width="1000" cellpadding="5" cellspacing="5" border="1">

<tr>
<tr>
<td bgcolor="lightcoral"><b>ORDER N0.</b></td>
<td bgcolor="lightcoral"><b>CID</b></td>
<td bgcolor="lightcoral"><b><b>CUSTOMER NAME</b></b></td>
<td bgcolor="lightcoral"><b>PID</b></td>
<td bgcolor="lightcoral"><b>PRODUCT NAME</b></td>
<td bgcolor="lightcoral"><b>CITY</b></td>
<td bgcolor="lightcoral"><b>ADDRESS</b></td>
<td bgcolor="lightcoral"><b>QUANTITY</b></td>
<td bgcolor="lightcoral"><b>TOTAL</b></td>
<td bgcolor="lightcoral"><b>ORDER DATE</b></td>
<td bgcolor="lightcoral"><b>ASSIGN</b></td>



</tr>
<%

try
	{
	java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	
Statement statement1 = connection.createStatement();

String sql="select o.ordno,c.cid,c.cname,p.pid,p.pname,c.ccity,c.caddress,o.quantity,o.total,o.orderdate FROM orders o ,product p,customer c where o.pid=p.pid and c.cid=o.cid and o.assign='NO' order by orderdate desc";
	

ResultSet resultSet = statement1.executeQuery(sql);
while (resultSet.next()) {
%>

<tr>
<td bgcolor="lightpink"><%=resultSet.getString("ordno")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("cid")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("cname")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("pid")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("pname")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("ccity")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("caddress")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("quantity")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("total")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("orderdate")%></td>

<td  bgcolor="lightpink"><a href="assignorder.jsp?ordno=<%=resultSet.getString("ordno")%>">Assign</a></td>

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
    <center><h2>Assigned Orders</h2></center>
    <br>
<table style="border:1px solid black; margin-left:auto; margin-right:auto; color:black;text-align:center"  width="1000" cellpadding="5" cellspacing="5" border="1">

<tr>
<tr>
<td bgcolor="lightcoral"><b>ORDER N0.</b></td>
<td bgcolor="lightcoral"><b>CID</b></td>
<td bgcolor="lightcoral"><b><b>CUSTOMER NAME</b></b></td>
<td bgcolor="lightcoral"><b>PID</b></td>
<td bgcolor="lightcoral"><b>PRODUCT NAME</b></td>
<td bgcolor="lightcoral"><b>CITY</b></td>
<td bgcolor="lightcoral"><b>ADDRESS</b></td>
<td bgcolor="lightcoral"><b>QUANTITY</b></td>
<td bgcolor="lightcoral"><b>TOTAL</b></td>
<td bgcolor="lightcoral"><b>ORDER DATE</b></td>
<td bgcolor="lightcoral"><b>SALESMAN ID</b></td>
    



</tr>
<%

try
	{
	java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection1 = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	
Statement statement2 = connection1.createStatement();

String sql1="select o.ordno,c.cid,c.cname,p.pid,p.pname,c.ccity,c.caddress,o.quantity,o.total,o.orderdate,s.eid FROM orders o ,product p,customer c,sale s where o.pid=p.pid and c.cid=o.cid and o.ordno=s.ordno and o.assign='YES' order by orderdate desc";
	

ResultSet resultSet1 = statement2.executeQuery(sql1);
while (resultSet1.next()) {
%>

<tr>
<td bgcolor="lightpink"><%=resultSet1.getString("ordno")%></td>
<td bgcolor="lightpink"><%=resultSet1.getString("cid")%></td>
<td bgcolor="lightpink"><%=resultSet1.getString("cname")%></td>
<td bgcolor="lightpink"><%=resultSet1.getString("pid")%></td>
<td bgcolor="lightpink"><%=resultSet1.getString("pname")%></td>
<td bgcolor="lightpink"><%=resultSet1.getString("ccity")%></td>
<td bgcolor="lightpink"><%=resultSet1.getString("caddress")%></td>
<td bgcolor="lightpink"><%=resultSet1.getString("quantity")%></td>
<td bgcolor="lightpink"><%=resultSet1.getString("total")%></td>
<td bgcolor="lightpink"><%=resultSet1.getString("orderdate")%></td>
<td bgcolor="lightpink"><%=resultSet1.getString("eid")%></td>

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
    <BR><BR>

</header>
    </body>
    </html>
	

	





