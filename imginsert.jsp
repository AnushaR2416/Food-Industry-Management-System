
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>


<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html ;charset=UTF-8">
</head>
</body>

<%

    FileInputStream fis=null;
   PreparedStatement ps=null;
   ResultSet rs=null;
   Connection connection=null;
 
  

	try
{
java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
  
connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
    String v0 = request.getParameter("pname");
	System.out.println("Connection created");
    int v1 = Integer.parseInt(request.getParameter("price"));
   String v4 = request.getParameter("fname");
   File image=new File(v4);
   ps=connection.prepareStatement("insert into product(pname,price,IMAGE)"+" values(?,?,?)");
   ps.setString(1,v0);
     ps.setInt(2,v1);
   fis = new FileInputStream(image);
   ps.setBinaryStream(3,fis,(int)(image.length()));
   
   
   int count = ps.executeUpdate();
	if(count > 0 ){ 
    out.println("data inserted successfully");
   }
    
    else
    {
    out.println("data not inserted successfully");
    }
	
}
catch (Exception ex) {
	ex.printStackTrace();
    }
    
	finally
    {
    try
    {
    if(rs!=null)
    {
    rs.close();
    rs=null;
    }
    if(ps!=null)
    {
    ps.close();
    ps=null;
    }
    if(connection!=null)
    {
    connection.close();
    connection=null;
    }
    }
    catch(Exception ex)
    {
    ex.printStackTrace();
    }

    }
	

%>
</body>
</html>
    
