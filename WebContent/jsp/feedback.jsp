<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
<td align="right"> <a href="/UniversityHelpdesk/jsp/home.jsp" style="text-decoration: none;">HOME</a> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">

<div style="top: 10%;left: 2%;width: 40%;height: 80%;position: absolute;">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/feedback.jpg" style="border-radius: 25px">
</div>


<div style="top: 25%;left: 43%;width: 45%;height: 80%;position: absolute;font-size: 18px">

<form action="/UniversityHelpdesk/Feedback" method="post" onsubmit="return chk()">
<table>
<tr><th>SUBJECT</th><td><input type="text" name="sub" id="sub" size="40"></td></tr>
<tr><th>FEEDBACK</th><td> <textarea rows="8" cols="41" name="feedback" id="feedback"> </textarea> </td></tr> 
<tr align="center"><th colspan="2"><input type="submit" value="SUBMIT"></th></tr></table>
</form>

</div>

</div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>

</body>
</html>