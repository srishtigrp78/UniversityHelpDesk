<%@ page language="java" import="java.sql.*,helpdesk.db.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | FEEDBACK</title>
</head>
<body>
<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<th style="top: 0%;left: 44%;position: absolute;font-size: 40px;color: blue;"> FEEDBACK </th>
<td align="right"> <a href="/UniversityHelpdesk/jsp/admin.jsp" style="text-decoration: none;">HOME</a> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">


<%
Connection con=null;
PreparedStatement ps=null,ps1=null;
ResultSet rs=null,rs1=null;
HttpSession hs=null;
hs=request.getSession(false);
String id=(String)hs.getAttribute("info");
String src="";
String type=request.getParameter("recid");
System.out.println(id);
con=CrudOperation.createConnection();
if(hs.isNew())
{
	response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised access");}
else{
String quer="select * from feedback where sno=?";

int mid=Integer.parseInt(request.getParameter("msid"));
try{
		ps=con.prepareStatement(quer);
		
		ps.setInt(1,mid);
		
	rs=ps.executeQuery();
	
	if(rs.next())		
	{
	%>
	
	<!-- <div align="left" style="top: 10%;left: 2%;width: 20%;height: 20%;position: absolute;">
		
		</div> -->
		
		<div align="center" style="margin-top: 10%;font-size: 25px">
		<p><%=rs.getString("message") %></p> </div>
		
	<%
	}
	}
	catch(SQLException se)
	{
	System.out.println(se);
	}}

%>
</div>
<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>
</body>
</html>