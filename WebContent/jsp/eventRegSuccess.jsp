<%@ page language="java" import="java.sql.*,helpdesk.db.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | EVENT</title>
</head>
<body>
<%Connection con=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
HttpSession hs=null;

hs=request.getSession(false); 
String ui=(String)hs.getAttribute("info");

if(ui==null || hs.isNew())
{
response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised users");
}
else
{%>
<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left:95%;width: 5%;height: 5%;position: absolute;background-color: white;">


<%
					con = CrudOperation.createConnection();
						String str = "select * from login where userid=?";

						try {

							ps1 = con.prepareStatement(str);
							ps1.setString(1, ui);
							rs1 = ps1.executeQuery();

							while (rs1.next()) {
				%>

				
					<%
						String utype = rs1.getString("usertype");
												if (utype.equals("admin")) {
					%> <a href="/UniversityHelpdesk/jsp/admin.jsp" style="text-decoration: none;">
					HOME</a> <%
 	} else if (utype.equals("newuser")) {
 %> <a href="/UniversityHelpdesk/jsp/newuser.jsp" style="text-decoration: none;">HOME</a> <%
 	} else if (utype.equals("staff")) {
 %> <a href="/UniversityHelpdesk/jsp/staff.jsp" style="text-decoration: none;">HOME</a> <%
 	} else if (utype.equals("student")) {
 %> <a href="/UniversityHelpdesk/jsp/student.jsp" style="text-decoration: none;">HOME</a> <%
 	} else if (utype.equals("faculty")) {
 %> <a href="/UniversityHelpdesk/jsp/faculty.jsp" style="text-decoration: none;">HOME</a> <%
 	} %> </td>
 <%	}
 		} catch (SQLException se) {
 			System.out.println(se);
 		}}
 %>


</div>

<div style="top: 35%;left: 0%;width: 100%;height: 60%;position: absolute;background-color: #808080;">

<div style="top: 20%;left: 0%;width: 100%;height: 80%;position: absolute">

<h2 align="center"> Congratulations !!! You have successfully registered for the event... </h2>
<br>
<p align="center" style="color: white;font-size: 20px"> Please visit event location to confirm your registration... 
<%-- <%
					con = CrudOperation.createConnection();
						String str = "select * from login where userid=?";

						try {

							ps1 = con.prepareStatement(str);
							ps1.setString(1, ui);
							rs1 = ps1.executeQuery();

							while (rs1.next()) {
				%>

				<td align="right">
					<%
						String utype = rs1.getString("usertype");
												if (utype.equals("admin")) {
					%> <a href="/UniversityHelpdesk/jsp/admin.jsp" style="text-decoration: none;">
					HOME</a> <%
 	} else if (utype.equals("newuser")) {
 %> <a href="/UniversityHelpdesk/jsp/newuser.jsp" style="text-decoration: none;">HOME</a> <%
 	} else if (utype.equals("staff")) {
 %> <a href="/UniversityHelpdesk/jsp/staff.jsp" style="text-decoration: none;">HOME</a> <%
 	} else if (utype.equals("student")) {
 %> <a href="/UniversityHelpdesk/jsp/student.jsp" style="text-decoration: none;">HOME</a> <%
 	} else if (utype.equals("faculty")) {
 %> <a href="/UniversityHelpdesk/jsp/faculty.jsp" style="text-decoration: none;">HOME</a> <%
 	}
 %> --%>
					 </p>

</div>

</div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>

</body>
</html>