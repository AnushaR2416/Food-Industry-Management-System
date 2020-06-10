
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.DriverManager" %>

<%@ page import="java.*" %>

 

	<!DOCTYPE html>
    <meta charset="ISO-8859-1">
<html>
<head>

    <link rel="stylesheet" type="text/css" href="style1.css">
 </head>


<title>Customers</title>

<body>

    <div class="bodyright">
<div class="registration" style="color:black; ">
<form action="shopping.jsp" method="post"  id="reg" >
<center><br><br><br>



<h1 style="font-size: 20px "><b>Update Customer details</b></h1>
<br>
 <div style="width: 100%; font-size: 18px">
<center>

<table cellspacing="17">
<%
   String mail=request.getParameter("cmail");
java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	
Statement statement3 = connection.createStatement();
String sql1 = "SELECT * FROM customer where cmail='"+mail+"'";

ResultSet rs = statement3.executeQuery(sql1);
rs.next();

String cid=rs.getString("cid");

%>`




                       <tr><td>	Name:</td>
<td><input type="text" name="name" value="<%=rs.getString("cname")%>"></td></tr>
<tr><td>
Phone:</td>
<td>
<input type="number" name="phone" value="<%=rs.getString("cphno")%>"></td></tr>
<tr><td>
Email:</td>
<td><input type="text" name="email" value="<%=rs.getString("cmail")%>"></td></tr>
<tr><td>
sex:</td>
<td><input type="text" name="sex" value="<%=rs.getString("sex")%>"><br></td></tr>
<tr><td>
                
                                 
                                 
                                 City:</td>
<td><input type="text" name="city" value="<%=rs.getString("ccity")%>"></td></tr>
<tr><td>
Address:</td>
<td><textarea name="adr" cols="30" rows="5" value="<%=rs.getString("caddress")%>"></textarea></td></tr>
                                    
		
	

</table><br>

                                          
 




<button class="title" name="signup"  value="sub" onclick="myFunction()" >submit<href="shopping.jsp"></button>
</center>
<script>
function myFunction() {
  alert("Updated successfully");
}
</script>
<br>
<a href="shopping.jsp" style="color: blueviolet">go back</a>
    <br><br>
</center>





<%
String btn=request.getParameter("signup");
if("sub".equals(btn)){

	try
{
java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
 connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
   // String id=request.getParameter("cid");
    Statement statement1 = connection.createStatement();
    String sql = "SELECT * FROM customer WHERE cid='"+cid+"'";

    ResultSet resultSet = statement1.executeQuery(sql);
   
    

	
	//String v0 = request.getParameter("eid");
	 
	String v1 = request.getParameter("name");
	
    String v2 = request.getParameter("phone");
String v3 = request.getParameter("email");
	 
	String v4 = request.getParameter("sex");
	
   
	 
	String v7 = request.getParameter("city");
	
    String v8 = request.getParameter("adr");
	
	
	
	
	Statement statement = connection.createStatement();
	int i=statement.executeUpdate("UPDATE customer SET cname='"+v1+"',cphno='"+v2+"',cmail='"+v3+"',sex='"+v4+"',ccity='"+v7+"',caddress='"+v8+"' WHERE cid='"+cid+"'");
	
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
</form>   
        </div></div>
    </body>
</head>

</html>	