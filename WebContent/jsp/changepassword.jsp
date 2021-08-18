<%@ page language="java" import="java.sql.*,helpdesk.db.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function check(ui) {
		var x;
		if (XMLHttpRequest) {
			x = new XMLHttpRequest();
		} else {
			x = new ActiveXObject("Microsoft.XMLHTTP");
		}
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				info = x.responseText;

				document.getElementById("msg").innerHTML = "<font color='purple'>"
						+ info + "</font>"
			}
		}
		x.open("get", "/UniversityHelpdesk/ChangePassword?userpass=" + ui,
				"true");
		x.send();
	}
	function chk()

	{
		P1 = document.getElementById("txtpassword2").value;
		P2 = document.getElementById("txtpassword3").value;
		if (P1 != P2) {
			alert("kindly reconfirm your password");
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | CHANGE PASSWORD</title>
</head>
<body>
	<%
		Connection con = null;
		PreparedStatement ps1 = null;
		ResultSet rs1 = null;
		HttpSession hs = request.getSession(false);
		String uid = (String) hs.getAttribute("info");
		if (hs.isNew() || uid == null) {
			response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised access");
		} else {
	%>
	<div
		style="top: 0%; left: 0%; width: 100%; height: 30%; position: absolute; background-color: grey">
		<img width="100%" height="100%"
			src="/UniversityHelpdesk/images/onlinehd.jpg">
	</div>

	<div
		style="top: 30%; left: 0%; width: 100%; height: 8%; position: absolute; background-color: white;">
		<table width="100%">
			<tr>
				<th
					style="top: 0%; left: 38%; position: absolute; font-size: 40px; color: blue;">
					CHANGE PASSWORD</th>

				<%
					con = CrudOperation.createConnection();
						String str = "select * from login where userid=?";

						try {

							ps1 = con.prepareStatement(str);
							ps1.setString(1, uid);
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
 %>
					</div> <%
 	}
 		} catch (SQLException se) {
 			System.out.println(se);
 		}
 %>
				</td>
			</tr>
		</table>
	</div>

	<div align="center"
		style="top: 38%; left: 0%; width: 100%; height: 57%; position: absolute; background-color: #808080;">

		<div style="top: 10%;left: 2%;width: 40%;height: 80%;position: absolute;">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/feedback.jpg" style="border-radius: 25px">
</div>


<div style="top: 30%;left: 35%;width: 50%;height: 60%;position: absolute;font-size: 18px">



			<form action="/UniversityHelpdesk/ChangePassword" method="post">
				<table style="margin-left: 25%;">
					<tr>
						<td>OLD PASSWORD</td>
						<td><input type="password" name="txtpassword1"
							id="txtpassword1" placeholder="Enter old password"
							onblur="check(this.value)"></td>
						<td><h2 id="info"></h2>
					</tr>
					<tr>
						<td>NEW PASSWORD</td>
						<td><input type="password" name="txtpassword2"
							id="txtpassword2" placeholder="Enter new password"></td>
					</tr>
					<tr>
						<td>CONFIRM NEW PASSWORD</td>
						<td><input type="password" name="txtpassword3"
							id="txtpassword3" placeholder="Re-confirm password"
							onblur="chk()"></td>
						<td><h3 id="pass"></h3>
					</tr>
					<tr style="text-align: center;">
						<td><input type="submit" value="SUBMIT"></td>
						<td><input type="reset" name="reset" value="RESET" /></td>
					</tr>
				</table>
			</form>


			<div id="center"></div>
			<%
				}
			%>
			<br> <br> <br> <br>
			<center>
				<div id="msg"></div>
			</center>
			<div id="msg1"></div>


		</div>
	</div>

	<div align="center"
		style="top: 95%; left: 0%; width: 100%; height: 5%; position: absolute; background-color: white; font-size: 15px">
		Copyright © 2017 All rights reserved</div>

</body>
</html>