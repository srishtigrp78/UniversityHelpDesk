<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | DEPARTMENT</title>
</head>
<body>

<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<%HttpSession hs=null;
hs=request.getSession(false); 
if(hs.isNew())
{
response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised users");
}
else
{%>

<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<th style="top: 0%;left: 37%;position: absolute;font-size: 40px;color: blue;"> ADD DEPARTMENT </th>
<td align="right"> <a href="/UniversityHelpdesk/jsp/admin.jsp" style="text-decoration: none;">HOME</a> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">

<div style="top: 10%;left: 2%;width: 40%;height: 80%;position: absolute;">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/department.jpg" style="border-radius: 25px">
</div>


<div style="top: 30%;left: 37%;width: 45%;height: 60%;position: absolute;font-size: 18px">

<form action="/UniversityHelpdesk/AddDeptDetail" method="post">   
	<table style="margin-left:25%;">
			<tr>
				<td>NAME</td><td colspan=2><input type="text" name="txtfullname" id="txtfullname" placeholder="Enter full NAME"/></td>
			</tr>
			
			<tr>
				<td>E-MAIL ID</td><td colspan=2><input type="email" name="txtid" id="txtid" placeholder="Enter your E-MAIL ID"/></td>
			</tr>
			<tr>
				<td>CONTACT NO.</td><td colspan=2><input type="number" name="txtcontact" id="txtcontact" placeholder="Enter your CONTACT NO."/></td>
			</tr>
			<tr>
			<td>UNIQUE CODE</td><td colspan=2><input type="text" name="txtcode" id="txtcode" placeholder="Enter CODE"/></td></tr>
		   
			<tr style="text-align:center;"><td><input type="submit" name="register" value="ADD"/></td>
			<td><input type="reset" name="reset" value="RESET"/></td></tr>
		</table>
		</form>
		
</div> </div>
		
		<%} %>
		
		<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>
		
</body>
</html>