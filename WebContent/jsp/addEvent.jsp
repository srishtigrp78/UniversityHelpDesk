<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | EVENT</title>
</head>
<body>
<%HttpSession hs=null;
hs=request.getSession(false); 
if(hs.isNew())
{
response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised users");
}
else
{%>
<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<th style="top: 0%;left: 44%;position: absolute;font-size: 40px;color: blue;"> ADD EVENT </th>
<td align="right"> <a href="/UniversityHelpdesk/jsp/admin.jsp" style="text-decoration: none;">HOME</a> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">

<div style="top: 10%;left: 2%;width: 40%;height: 80%;position: absolute;">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/event.jpg" style="border-radius: 25px">
</div>


<div style="top: 20%;left: 35%;width: 45%;height: 60%;position: absolute;font-size: 18px">

<form action="/UniversityHelpdesk/AddEvent" method="post">   
	<table style="margin-left:25%;">
			<tr>
				<td>EVENT TITLE</td><td colspan=2><input type="text" name="txttitle" id="txttitle" placeholder="Enter event TITLE"/></td>
			</tr>
			<tr>
				<td>START DATE</td><td colspan=2><input type="date" name="txtstartdate" id="txtstartdate" /></td>
			</tr>
			<tr>
				<td>END DATE</td><td colspan=2><input type="date" name="txtenddate" id="txtenddate"/></td>
			</tr>
			<tr>
				<td>EVENT CATEGORY</td><td colspan=2><select name="category" id="category">
  <option value="sports">SPORTS</option>
  <option value="painting">PAINTING</option>
  <option value="technical">TECHNICAL</option>
  <option value="gaming">GAMING</option>
</select></td>
			</tr>
			<tr>
				<td>DESCRIPTION</td><td colspan=2><input type="text" name="txtdescription" id="txtdescription" placeholder="Enter event DESCRIPTION"/></td>
			</tr>
			
			<tr>
				<td>LOCATION</td><td colspan=2><input type="text" name="txtlocation" id="txtlocation" placeholder="Enter event lOCATION"/></td>
			</tr>
			<tr>
				<td>REGISTRATION STARTS ON</td><td colspan=2><input type="date" name="txtregstart" id="txtregstart" /></td>
			</tr>
			<tr>
				<td>REGISTRATION ENDS ON</td><td colspan=2><input type="date" name="txtregend" id="txtregend"/></td>
			</tr>
			
			<tr style="text-align:center;"><td><input type="submit" name="register" value="ADD EVENT"/></td>
			<td><input type="reset" name="reset" value="RESET"/></td></tr>
		</table>
		</form>
		
		</div>

</div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>
<%} %>
</body>
</html>