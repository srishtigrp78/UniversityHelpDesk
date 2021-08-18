<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | ADMIN</title>
</head>
<body>

<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<%HttpSession hs=null;
hs=request.getSession(false); 
String ui=(String)hs.getAttribute("info");
System.out.print(ui);
if(ui==null || hs.isNew())
{
	response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised users");
}
else
{%>

<div style="top: 30%;left: 4%;width: 96%;height: 5%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<td> <a href="/UniversityHelpdesk/jsp/admin.jsp" style="text-decoration: none;">HOME</a> </td>
<td> <a href="/UniversityHelpdesk/jsp/addDepartmentDetail.jsp" style="text-decoration: none;">ADD DEPARTMENT</a> </td>
<td> <a href="/UniversityHelpdesk/jsp/addFaculty.jsp" style="text-decoration: none;">ADD FACULTY</a> </td>
<td> <a href="/UniversityHelpdesk/jsp/addStudent.jsp" style="text-decoration: none;">ADD STUDENT</a> </td>
<td> <a href="/UniversityHelpdesk/jsp/addEvent.jsp" style="text-decoration: none;">ADD EVENT</a> </td>
<td> <a href="/UniversityHelpdesk/jsp/viewFeedback.jsp" style="text-decoration: none;">VIEW FEEDBACK</a> </td>
<td> <a href="/UniversityHelpdesk/jsp/changepassword.jsp" style="text-decoration: none;">CHANGE PASSWORD</a> </td>
<td> <a href="/UniversityHelpdesk/Signout" style="text-decoration: none;">LOGOUT</a> </td>
</tr>
</table>
</div>

<div style="top: 35%;left: 0%;width: 100%;height: 60%;position: absolute;background-color: #808080;">


<div style="top: 20%;left: 5%;width:20%;height: 50%;position: absolute;">
<a href="/UniversityHelpdesk/jsp/newusercompose.jsp" style="text-decoration: none;">
<img src="/UniversityHelpdesk/images/compose1.png" height="100%" width="100%"> </a> 
<h2 align="center" style="color: white;">COMPOSE</h2> </div>

<div style="top: 20%;left: 40%;width:20%;height: 50%;position: absolute;">
<a href="/UniversityHelpdesk/jsp/newuserinbox.jsp" style="text-decoration: none;">
<img src="/UniversityHelpdesk/images/inbox1.png" height="100%" width="100%"> </a>
<h2 align="center" style="color: white;">INBOX</h2> </div>

<div style="top: 20%;left: 75%;width:20%;height: 50%;position: absolute;">
<a href="/UniversityHelpdesk/jsp/newusersentitems.jsp" style="text-decoration: none;">
<img src="/UniversityHelpdesk/images/outbox1.png" height="100%" width="100%"> </a> 
<h2 align="center" style="color: white;">OUTBOX</h2> </div>

</div>

<%} %>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>

</body>
</html>