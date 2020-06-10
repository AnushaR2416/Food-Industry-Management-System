<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.*" %>
    <%@ page import="java.sql.DriverManager" %>

	<!DOCTYPE html>
<html>
    <head>

 <link rel="stylesheet"type="text/css"href="style1.css">
<style>
a{
color:black;
}
</style>

<header>
<br>


        <div class="main">
       
        <ul>
            
            
            <li><a href="order.jsp">Go Back</a></li>
            
            
            </ul>
        </div>
        
<br><br>


<br><br>
    <h1 align="center"><font color="#fff"><strong>Employee Details</strong></font></h1>
    <br><br>
<table style="border:1px solid black; margin-left:auto; margin-right:auto; color:black;text-align:center"  width="1000" cellpadding="5" cellspacing="5" border="1">

<tr>
<tr>
<td bgcolor="lightcoral"><b>EID</b></td>
<td bgcolor="lightcoral"><b><b>EMPLOYEE NAME</b></b></td>
<td bgcolor="lightcoral"><b>PHONE NUMBER</b></td>
<td bgcolor="lightcoral"><b>MAIL</b></td>
<td bgcolor="lightcoral"><b>SEX</b></td>

<td bgcolor="lightcoral"><b>CITY</b></td>
<td bgcolor="lightcoral"><b><b>ADDRESS</b></b></td>




</tr>
    <%
String ordno=request.getParameter("ordno");


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
<td bgcolor="lightpink"><%=resultSet.getString("city")%></td>
<td bgcolor="lightpink"><%=resultSet.getString("address")%></td>




</tr>

<%
}
   %>
    </table>
        <%
   }
           
           
           
   catch(ClassNotFoundException er)
{
System.err.println("Unable to load JDBC driver"+ er);
}
catch (Exception e) {
e.printStackTrace();
}
   %>
<center>
    <form  method="post"  id="reg">
        <br><br><br>
					 	<H3>ASSIGN ORDER TO EMPLOYEE</H3><br><br>
						
						
						ORD NO: <input type="text" name='ordno' value="<%= ordno%>" ><br><br>
						
						EID: <input type="text" name='eid' placeholder="Enter Employee ID"  required><br><br>
						
<br><button class="btn" type="submit" name="submit" value="cnf">SUBMIT</button>
<BR><BR>
						
						
								
 <%   
    
    String btn=request.getParameter("submit");
if("cnf".equals(btn)){
    String eid=request.getParameter("eid");
    try
	{
	java.lang.Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/foodind?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
	

Statement statement = connection.createStatement();
	int i=statement.executeUpdate("INSERT INTO sale VALUES('"+ordno+"','"+eid+"');");
	//if(i>0)
   // out.println("data inserted successfully");
    
 Statement statement1 = connection.createStatement();  
    int j=statement1.executeUpdate("UPDATE orders SET assign='YES' WHERE ordno='"+ordno+"'");
    //if(j>0)
    //out.println("data updated successfully");
    
     ResultSet rs;
     CallableStatement cs;
    cs=connection.prepareCall("{call proc1(?)}");
     
    // String sql1="CALL proc1();
   
    cs.setString(1,ordno); 
     /*
     cs.registerOutParameter(2,java.sql.Types.CHAR(25));
      cs.registerOutParameter(3,java.sql.Types.VARCHAR(30));
      cs.registerOutParameter(4,java.sql.Types.INTEGER);
      cs.registerOutParameter(5,java.sql.Types.VARCHAR(30));
     cs.registerOutParameter(6,java.sql.Types.VARCHAR(30));
     
     cs.registerOutParameter(7,java.sql.Types.CHAR(25));
     
     
     
     boolean k=cs.execute();
     cs.getString()
     if(k==true)
     
     //out.println("successful");
  
     
     String cname  =cs.getString("cname");
     out.println(cname);
*/
     
					
}
catch(ClassNotFoundException er)
{
System.err.println("Unable to load JDBC driver"+ er);
}
catch (Exception e) {
e.printStackTrace();
}
    }
%>
     </form>
    </center>
    </body>
</header>
</html>


	

	





