<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.*" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
</head>
<body>

<%
    String name = request.getParameter("username");
    String pass = request.getParameter("password");
    
    
 

if((name.equals("admin")&&pass.equals("admin123")))
    {
    	response.sendRedirect("index.html");
    }else
    {
    	response.sendRedirect("error1.html");
    }

%>
</body>
</html>


