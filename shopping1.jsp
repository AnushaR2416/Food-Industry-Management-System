<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page import="java.io.*" %>
<%@ page import="java.*" %>
    
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet"type="text/css"href="style1.css">
<body>
    
<%
//String pid=session.getAttribute("pid").toString();
//String cmail=session.getAttribute("cmail").toString();
   
  try{
	java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	 
   String pid=request.getParameter("pid");
   String cmail=request.getParameter("cmail");
Statement statement3 = connection.createStatement();
String sql1 = "SELECT * FROM product where pid='"+pid+"'";

ResultSet rs = statement3.executeQuery(sql1);
rs.next();



%>`

<div class="bodyright">
    <div class="registration">
        <center>
        <form action="onlinepay.jsp?cmail=<%= cmail%>" method="post"  id="reg" >

            <h2 >Place your order</h2>
            Product id:<input type="text" name="pid" value="<%=rs.getString("pid")%>" /><br/><br/>    
            Product name:<input type="text" name="pname" value="<%=rs.getString("pname")%>" /><br/><br/>
            Quantity :<input type="text"   name="nop" required/><br/><br/>  
<!--         <button class="title" name="pay"  value="sub2" onclick="myFunction1()" ><a href="payfees.html?pid=<%=request.getParameter("pid")%>&quantity=<%=request.getParameter("nop")%>" >MAKE PAYMENT</a></button>-->

            <button class="title" name="signup"  value="sub1" onclick="myFunction()" >MAKE PAYMENT</button>
             <script>
            function myFunction1() {
                response.sendRedirect("payfees.html");
              //alert("data inserted successfully");
            }
            </script>
            <script>
            function myFunction() {
                
              //alert("data inserted successfully");
            }
            </script>
            <br><br>
            <a href="shopping.jsp">go back</a>
        </form>
            </center>
    </div>
</div>

<%
    rs.close();
	connection.close();
	}
catch(ClassNotFoundException er)
{
System.err.println("Unable to load JDBC driver"+ er);
}
	catch(SQLException e)
	{
	           out.println(" Database Error!! " +e);
	}

%>

</body>
</head>
</html>	
                                             






