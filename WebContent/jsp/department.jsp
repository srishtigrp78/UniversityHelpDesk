<%@ page language="java" import="java.sql.*,helpdesk.db.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | DEPARTMENT</title>
</head>
<body>
<%Connection con=null;
PreparedStatement ps=null,ps1=null;
ResultSet rs=null,rs1=null;
%>
<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<th style="top: 0%;left: 44%;position: absolute;font-size: 40px;color: blue;"> DEPARTMENTS </th>
<td align="right"> <a href="/UniversityHelpdesk/jsp/home.jsp" style="text-decoration: none;">HOME</a> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">

<div style="top: 10%;left: 2%;width: 40%;height: 80%;position: absolute;">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/department.jpg" style="border-radius: 25px">
</div>


<div style="top: 15%;left: 50%;width: 45%;height: 50%;position: absolute;font-size: 17px">
<form>
<table align="center" border=3 style="font-size: 17px;margin-top: 2%;">
<tr style="color: white;"><th>DEPARTMENT ID</th><th>DEPARTMENT NAME</th><th>CONTACT NUMBER</th><th>EMAIL ID</th></tr>
<%con=CrudOperation.createConnection();
String quer="select * from department";
try{
	ps=con.prepareStatement(quer);
    rs=ps.executeQuery();

	while(rs.next())
	{	%>
	
	<!-- <div align="left" style="top: 2%;left: 2%;width: 20%;height: 20%;position: absolute;"> -->
	<tr>
	<td><%=rs.getString("id") %></td>
	<td><%=rs.getString("deptname") %></td>
	<td><%=rs.getString("phoneno") %></td>
	
	<td><%=rs.getString("emailid") %></tr>
	
	<%
	}
	} 

	catch(SQLException se)
	{
		System.out.println(se);
		} 
	%>
	</table></form>
</div>

</div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>

</body>
</html>