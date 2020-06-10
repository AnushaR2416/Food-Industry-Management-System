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
<%
String cmail=session.getAttribute("cmail").toString(); %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<style>
.topright { position: absolute; top: 25px; right: 30px; text-align: right; }
    body{
     background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    background-image: url(bg.jpg) ;
    }
    

ul
{
list-style-type:none;
margin:0;
padding:0;
overflow:hidden;
}
li
{
float:right;
}
header{
padding:30px;
font-size:40px;
color:black;
}
li a
{
    display:block;
    color: black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
li a:hover {
    background-color: white;
    }
    

    </style>


<body>

       <div style="background-color: pink">
       <div class="topright">
<br>
<b>Hi, <%= cmail%></b></div>

        <header>
        <img src="logo.jpg" style="float:left; width:150px; height:140px;">
        <center>SEVEN STAR SNACKS</center></header>
        <ul>
        <li><a href="first.html">Log Out</a></li>
        <li><a href="updatecustomer.jsp?cmail=<%= cmail%>">Update</a></li>
        <li><a href="myorder.jsp?cmail=<%= cmail%>">My Orders</a></li>
        </ul>
        <h2><marquee>Healthy We</marquee></h2></div> 
    </div>
    </header>
    

    

<div>
<br><br><br><br><br>
<table style="border:1px solid black; margin-left:auto; margin-right:auto; color:black;text-align:center"  width="1000" cellpadding="5" cellspacing="5" border="1">
<tr>
<tr>
<td bgcolor="lightcoral"><b>PRODUCT N0.</b></td>

<td bgcolor="lightcoral"><b><b>PRODUCT NAME</b></b></td>

<td bgcolor="lightcoral"><b>PRICE</b></td>
<td bgcolor="lightcoral"><b>ORDER </b></td>


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
String r=resultSet.getString("pid");
 
    %>
<tr>
    <td bgcolor="lightpink"><%=r%></td>
    <td bgcolor="lightpink"><%=resultSet.getString("pname")%></td>
    <td bgcolor="lightpink"><%=resultSet.getString("price")%></td>
<td bgcolor="lightpink"><a href="shopping1.jsp?pid=<%= r%>&cmail=<%= cmail%>">ORDERNOW</a></td>
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
    </div>
    </body>

</html>


	

	





