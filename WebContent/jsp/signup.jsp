<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function checkEmpty(info)
{

	if(info.length==0)
		{
		return false;
		}
	return true;
		}
function chk()
{
	var flag=true;
	var id=document.getElementById("userid").value;
	var name=document.getElementById("fullname").value;
	var emailid=document.getElementById("id").value;
	var contact=document.getElementById("contact").value;
	var address=document.getElementById("address").value;
	var password=document.getElementById("userpass").value;
	if(name.length==0)
	{
	 flag=false;
    	alert("name required");
	}
	else if(id.length==0)
	{
	 flag=false;
    	alert("user id required");
	}
	else if(emailid.length==0)
	{
	 flag=false;
    	alert("email id required");
	}
	else if(address.length==0)
	{
	 flag=false;
    	alert("address required");
	}
	else if(contact.length==0)
	{
	 flag=false;
    	alert("contact number required");
	}
	else if(password.length==0)
	{
	 flag=false;
    	alert("password required");
	}
	return flag;
	}</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | SIGNUP</title>
</head>
<body>

<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<th style="top: 0%;left: 44%;position: absolute;font-size: 40px;color: blue;"> SIGN-UP </th>
<td align="right"> <a href="/UniversityHelpdesk/jsp/home.jsp" style="text-decoration: none;">HOME</a> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">

<div style="top: 10%;left: 2%;width: 40%;height: 80%;position: absolute;">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/sign_up.jpg" style="border-radius: 25px">
</div>

<div style="top: 23%;left: 40%;width: 40%;height: 80%;position: absolute;font-size: 18px">

<form action="/UniversityHelpdesk/Signup" method="post" onsubmit="return chk()">
		<table style="margin-left:25%;">
		<tr>
				<td>USER ID</td><td><input type="text" name="userid" id="userid" placeholder="Enter your USER ID"/></td>
			</tr>
			<tr>
				<td>FULL NAME</td><td><input type="text" name="fullname" id="fullname" placeholder="Enter your NAME"/></td>
			</tr>
			<tr>
				<td>E-MAIL ID</td><td><input type="text" name="id" id="id" placeholder="Enter your E-MAIL ID"/></td>
			</tr>
			<tr>
				<td>CONTACT NO.</td><td><input type="number" name="contact" id="contact" placeholder="Enter your CONTACT NO."/></td>
			</tr>
			<tr>
				<td>ADDRESS</td><td><input type="text" name="address" id="address" placeholder="Enter your ADDRESS"/></td>
			</tr>
			<tr>
				<td>PASSWORD</td><td><input type="password" name="userpass" id="userpass" placeholder="Enter your PASSWORD"/></td>
			</tr>
			<tr><td style="text-align:center;"><input type="submit" name="register" value="REGISTER"/></td>
			<td style="text-align:center;"> <input type="reset" name="reset" value="RESET"/></td></tr>
		</table></form>
		
		</div>
		
</div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>
		
</body>
</html>