
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>

 

	<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet"type="text/css"href="sty.css">

<header>
<title>PRODUCTS</title>

<body>

    <div class="bodyright">
<div class="registration" style="color:white;">
<form method="post"  id="reg" enctype="multipart/form-data" >
<center><br><br><br>
<h1 >Enter the Product Details:</h1>
<br><br>

Product Name:  <input type="text"   name="pname" /><br/><br/>
Price:  <input type="number"   name="price" /><br/><br/>
    Image:  <input type="file"   name="fname" /><br/><br/>

<button class="title" name="signup"  value="sub" onclick="myFunction()" >submit</button>
<script>
function myFunction() {
  //alert("data inserted successfully");
}
</script>
<br><br>
<a href="product.jsp" style="color: white">go back</a>
</center>
</form>   
        </div></div>

</body>



<%
String btn=request.getParameter("signup");
    FileInputStream fis=null;
   PreparedStatement ps=null;
   ResultSet rs=null;
   Connection connection=null;
 
if("sub".equals(btn)){
   String v0 = request.getParameter("pname");
	
    String v1 = request.getParameter("price");
   String v4 = request.getParameter("fname");

	try
{
java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
  
connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
   
   File image=new File(v4);
   ps=connection.prepareStatement("insert into product(pname,price,IMAGE) values(?,?,?)");
   ps.setString(1,v0);
      ps.setString(2,v1);
   fis = new FileInputStream(image);
   ps.setBinaryStream(3,(InputStream) fis,(int)(image.length()));
   
   
   
   int count = ps.executeUpdate();
	if(count != 0 ){ 
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
}	

%>
    
</header>
    </head>
</html>	