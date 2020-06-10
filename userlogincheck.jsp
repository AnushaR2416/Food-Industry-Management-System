<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.*" %>
<!DOCTYPE html>



<%
    String cmail = request.getParameter("username");
    String pass = request.getParameter("password");
    
    
  %>
<%

try
{
java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");

Statement statement = connection.createStatement();
String sql = "SELECT * FROM customer where cmail='"+cmail+"'and cpassword='"+pass+"'";

ResultSet resultSet = statement.executeQuery(sql);

%>
<% 
if (resultSet.next()) {
session.setAttribute("cmail",cmail);

    	response.sendRedirect("shopping.jsp"); 	
}
else
{
	response.sendRedirect("error.html");	
}

%>
<%

}
catch (Exception e) {
e.printStackTrace();
}

%>


