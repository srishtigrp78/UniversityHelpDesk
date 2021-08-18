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

function chkmain()
{
	
	var flag=true;

	uN=document.getElementById("txtfullname").value;
	 if(checkEmpty(uN)==false)
		{
		 flag=false;
		 alert("NAME REQUIRED");
		 document.getElementById("txtfullname").focus();
		 return flag;
		}
	 txtprof=document.getElementById("txtprof").value;
	 if(checkEmpty(txtprof)==false)
		{
		 flag=false;
		 alert("DEPARTMENT IS REQUIRED");
		 document.getElementById("txtprof").focus();
		 return flag;
		}
	 txtaddress=document.getElementById("txtaddress").value;
	 if(checkEmpty(txtaddress)==false)
		{
		 flag=false;
		 alert("ADDRESS REQUIRED");
		 document.getElementById("txtaddress").focus();
		 return flag;
		}
	 txtid=document.getElementById("txtid").value;
	 if(checkEmpty(txtid)==false)
		{
		 flag=false;
		 alert("ID REQUIRED");
		 document.getElementById("txtid").focus();
		 return flag;
		}
	 txtcontact=document.getElementById("txtcontact").value;
	 if(checkEmpty(txtcontact)==false)
		{
		 flag=false;
		 alert("CONTACT NUMBER REQUIRED");
		 document.getElementById("txtcontact").focus();
		 return flag;
		}
	 
	 txtuserid=document.getElementById("txtuserid").value;
	 if(checkEmpty(txtuserid)==false)
		{
		 flag=false;
		 alert(" USER ID REQUIRED");
		 document.getElementById("txtuserid").focus();
		 return flag;
		}
	 txtpassword=document.getElementById("txtpassword").value;
	 if(txtpassword.length<2)
		{
		 flag=false;
		 alert("PASSWORD LENGTH SHOULD BE GREATER THAN 2 IS REQUIRED");
		 document.getElementById("txtpassword").focus();
		 return flag;
		}
	 
	 return flag;
}
	 
	 
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | FACULTY</title>
</head>
<body>

<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<th style="top: 0%;left: 43%;position: absolute;font-size: 40px;color: blue;"> ADD FACULTY </th>
<td align="right"> <a href="/UniversityHelpdesk/jsp/admin.jsp" style="text-decoration: none;">HOME</a> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">

<div style="top: 10%;left: 2%;width: 40%;height: 80%;position: absolute;">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/faculty.jpeg" style="border-radius: 25px">
</div>


<div style="top: 22%;left: 37%;width: 45%;height: 60%;position: absolute;font-size: 18px">

<%HttpSession hs=null;
hs=request.getSession(false); 
if(hs.isNew())
{
response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised users");
}
else
{%>

<form action="/UniversityHelpdesk/AddFaculty" method="post" onsubmit="return chkmain()">   
	<table style="margin-left:25%;">
			<tr>
				<td>FULL NAME</td><td colspan=2><input type="text" name="txtfullname" id="txtfullname" placeholder="Enter full NAME"/></td>
			</tr>
			<tr>
			<td>DEPARTMENT</td><td colspan=2><input type="text" name="txtprof" id="txtprof" placeholder="Enter PROFESSION"/></td></tr>
		    
			<tr>
				<td>E-MAIL ID</td><td colspan=2><input type="email" name="txtid" id="txtid" placeholder="Enter your E-MAIL ID"/></td>
			</tr>
			<tr>
				<td>ADDRESS</td><td colspan=2><input type="text" name="txtaddress" id="txtaddress" placeholder="Enter your ADDRESS"/></td>
			</tr>
			<tr>
				<td>CONTACT NO.</td><td colspan=2><input type="number" name="txtcontact" id="txtcontact" placeholder="Enter your CONTACT NO."/></td>
			</tr>
			
			<tr>
			<td>USER ID</td>
			<td><input type="text" name="txtuserid" id="txtuserid" placeholder="Enter USER ID"/></td></tr>
			<tr>
			<td>PASSWORD</td>
			<td><input type="password" name="txtpassword" id="txtpassword" placeholder="Enter PASSWORD"></td></tr>
			<tr style="text-align:center;"><td><input type="submit" name="register" value="REGISTER"/></td>
			<td><input type="reset" name="reset" value="RESET"/></td></tr>
		</table>
		</form>

<%} %>

</div> </div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>

</body>
</html>