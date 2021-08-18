"WebContent/jsp/home.jsp"<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | HOME</title>
</head>
<script>

	function check()
	{
		var id=document.getElementById("txtuserid").value;
		var pass=document.getElementById("txtpassword").value;
		if(id.length==0)
			{
			alert("user id required");
			document.getElementById("txtuserid").focus();
			return false;
			}
		else if(pass.length==0)
			{
			alert("password required");
			return false;
			}
	}
	</script>
</head>
<body>

<!-- <div style="top: 0%;left: 0%;width: 100%;height: 20%;position: absolute;background-color: grey">
<h1 align="center"> UNIVERSITY HELPDESK </h1>
</div> -->

<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;">
<img width="100%" height="100%" src="/UniversityHelpDesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 12%;width: 85%;height: 5%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<td> <a href="/UniversityHelpDesk/jsp/aboutus.jsp" style="text-decoration: none;">ABOUT US</a> </td>
<td> <a href="/UniversityHelpDesk/jsp/department.jsp" style="text-decoration: none;">DEPARTMENTS</a> </td>
<td> <a href="/UniversityHelpDesk/jsp/event.jsp" style="text-decoration: none;">EVENTS</a> </td>
<td> <a href="/UniversityHelpDesk/jsp/gallery.jsp" style="text-decoration: none;">GALLERY</a> </td>
<td> <a href="/UniversityHelpDesk/jsp/feedback.jsp" style="text-decoration: none;">FEEDBACK</a> </td>
<td> <a href="/UniversityHelpDesk/jsp/contactus.jsp" style="text-decoration: none;">CONTACT US</a> </td>
</tr>
</table>
</div>


<div style="top: 35%;left: 0%;width: 100%;height: 60%;position: absolute;background-color: #808080;">


<div style="top: 10%;left: 2%;width: 40%;height: 80%;position: absolute;">
<img width="100%" height="100%" src="/UniversityHelpDesk/images/helpdesk.jpg" style="border-radius: 25px">
</div>



<div style="top: 30%;left: 53%;width: 40%;height: 70%;position: absolute;font-size: 18px">


<%String msg=request.getParameter("msg"); %>
<%if(msg!=null)
	{%>
	<script>alert("<%=msg %>");</script>
	<%}%>
			<form action="/UniversityHelpDesk/Login" method="post" onsubmit="check()">
				<table>
					<tr>
						<td><p>USER ID</p></td><td><input type="text" id="txtuserid" name="txtuserid" placeholder="Enter your ID"/></td>
					</tr>
					<tr>
						<td><p>PASSWORD</p></td><td><input type="password" id="txtpassword" name="txtpassword" placeholder="Enter your PASSWORD"/></td>
					</tr>
					<!-- <tr>
						<td colspan="2" style="text-align:right;"><input type="submit" name="Login" value="LOGIN"/><a></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><a href="/UniversityHelpdesk/jsp/signup.jsp">SIGNUP</a></td>
					</tr> -->
					
					<tr>
						<td colspan="2" align="center"><input type="submit" name="Login" value="LOGIN"/></td>
					</tr>
					
					<tr> </tr>
					<tr> </tr>
					<tr> </tr>
					<tr> </tr>
					<tr> </tr>
					<tr> </tr>
					<tr> </tr>
					<tr> </tr>
					<tr> </tr>
					<tr> </tr>
					
					<tr>
					<td align="right">
					<p style="color: white;"> New User ? </p> </td>
					<td align="center"> <a href="/UniversityHelpDesk/jsp/signup.jsp" style="text-decoration: none;">SIGN UP here</a> </td>
					</tr>
					
					
				</table>
			</form>
		
		
		</div>
		</div>
		
		<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>
		
</body>
</html>
</body>
</html>