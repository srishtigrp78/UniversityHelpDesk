<%@ page language="java" import="java.sql.*,helpdesk.db.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | MESSAGE</title>
</head>
<body>
<%Connection con=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
HttpSession hs=null;
hs=request.getSession(false);
String id=(String)hs.getAttribute("info");
System.out.println(id);
%>
<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 15%;width: 85%;height: 5%;position: absolute;background-color: white;">
</div>

<div style="top: 35%;left: 0%;width: 100%;height: 60%;position: absolute;background-color: #808080;">

<div style="top: 20%;left: 0%;width: 100%;height: 80%;position: absolute">

<h2 align="center" style="font-size: 30px"> Message Sent Successfully... </h2>
<%
con=CrudOperation.createConnection();
if(id==null || hs.isNew())
	response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised access");
else{
	System.out.println(id);
	String str="select * from login where userid=?";
	System.out.println(str);
		try{
			
			
			ps1=con.prepareStatement(str);
			System.out.println(ps1);
			
			ps1.setString(1,id);
			rs1=ps1.executeQuery();
			
			while(rs1.next())
			{	%>
			
			<p align="center" style="color: white;font-size: 20px">  

			
			<%
			
				String utype=rs1.getString("usertype");
				if(utype.equals("admin"))
						{%>
					<a href="/UniversityHelpdesk/jsp/admin.jsp" style="text-decoration: none;">BACK</a>
						<% }
				else if(utype.equals("newuser"))
				{%>
			<a href="/UniversityHelpdesk/jsp/newuser.jsp" style="text-decoration: none;">BACK</a>
				<% }
				else if(utype.equals("staff"))
				{%>
			<a href="/UniversityHelpdesk/jsp/staff.jsp" style="text-decoration: none;">BACK</a>
				<% }
				else if(utype.equals("student"))
				{%>
			<a href="/UniversityHelpdesk/jsp/student.jsp" style="text-decoration: none;">BACK</a>
				<% }
				else if(utype.equals("faculty"))
				{%>
			<a href="/UniversityHelpdesk/jsp/faculty.jsp" style="text-decoration: none;">BACK</a>
				<% }%>
				</div>
				</p>
				<%
				}
		}
		catch(SQLException se)
		{
			System.out.println(se);}}
%>
<br>


</div>

</div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>

</body>
</html>