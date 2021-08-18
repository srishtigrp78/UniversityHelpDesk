<%@ page language="java" import="java.sql.*,helpdesk.db.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | EVENT</title>
</head>
<body>
<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<%Connection con=null;
PreparedStatement ps=null,ps1=null,ps2=null;
ResultSet rs=null,rs1=null,rs2=null;
HttpSession hs=null,hs1=null;
String title=request.getParameter("msid");
hs=request.getSession(false); 
String ui=(String)hs.getAttribute("info");
hs1=request.getSession();

hs1.setAttribute("title",title);
if(ui==null || hs.isNew())
{
response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised users");
}
else
{%>
<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>

<th style="top: 0%;left: 35%;position: absolute;font-size: 40px;color: blue;"> EVENT REGISTRATION </th>

<td align="right"> <%
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
 %>
					</div> <%
 	}
 		} catch (SQLException se) {
 			System.out.println(se);
 		}
 %> </td>

</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">


<div style="top: 25%;left: 2%;width: 98%;height: 70%;position: absolute;font-size: 18px">

<form action="/UniversityHelpdesk/EventRegistration" method="post" onsubmit="return chk()">
<table align="center">
<%
String str1 = "select * from login where userid=?";

try {

	ps2 = con.prepareStatement(str1);
	ps2.setString(1, ui);
	rs2 = ps2.executeQuery();

	while (rs2.next()) {
String ustype = rs2.getString("usertype");
if (ustype.equals("newuser")){
String quer="select * from signup where userid=?";
try{
	ps=con.prepareStatement(quer);
	ps.setString(1,ui);
    rs=ps.executeQuery();

	while(rs.next())
	{	%>
<tr>
				<td>USER ID:</td><td><input type="text" name="userid" id="userid" value="<%=rs.getString("userid") %>" disabled/></td>
			</tr>
			<tr>
				<td>FULL NAME:</td><td>
				<input type="text" name="fullname" id="fullname" value="<%=rs.getString("name") %>"/></td>
			</tr>
			<tr>
				<td>E-MAIL ID:</td><td>
				<input type="text" name="id" id="id" value="<%=rs.getString("emailid") %>"/></td>
			</tr>
			<tr>
				<td>CONTACT NO:</td><td>
				<input type="number" name="contact" id="contact" value="<%=rs.getString("phoneno") %>"/></td>
			</tr>
			<tr>
				<td>ADDRESS:</td><td><input type="text" name="address" id="address" value="<%=rs.getString("address") %>"/></td>
			</tr>
			
			<tr><td style="text-align:center;"><input type="submit" name="register" value="REGISTER FOR EVENT"/></td>
			<td style="text-align:center;"> <a href="/UniversityHelpdesk/jsp/viewEvent.jsp"> <input type="button" name="back" value="BACK"/></a></td></tr></table>
			</form>
			<%
	}
	}
	catch(SQLException se)
	{
		System.out.println(se);
		} 

}
else if(ustype.equals("faculty")){
	String quer="select * from faculty where userid=?";
	try{
	ps=con.prepareStatement(quer);
	ps.setString(1,ui);
    rs=ps.executeQuery();

	while(rs.next())
	{	%>
<tr>
				<td>USER ID:</td><td><input type="text" name="userid" id="userid" value="<%=rs.getString("userid") %>" disabled/></td>
			</tr>
			<tr>
				<td>FULL NAME:</td><td>
				<input type="text" name="fullname" id="fullname" value="<%=rs.getString("name") %>"/></td>
			</tr>
			<tr>
				<td>E-MAIL ID:</td><td>
				<input type="text" name="id" id="id" value="<%=rs.getString("email") %>"/></td>
			</tr>
			<tr>
				<td>CONTACT NO:</td><td>
				<input type="number" name="contact" id="contact" value="<%=rs.getString("phoneno") %>"/></td>
			</tr>
			<tr>
				<td>ADDRESS:</td><td><input type="text" name="address" id="address" value="<%=rs.getString("address") %>"/></td>
			</tr>
			
			<tr><td style="text-align:center;"><input type="submit" name="register" value="REGISTER FOR EVENT"/></td>
			<td style="text-align:center;"><a href="/UniversityHelpdesk/jsp/viewEvent.jsp"> <input type="button" name="back" value="BACK"/></a></td></tr></table>
			</form>
			<%
	}
	}
	catch(SQLException se)
	{
		System.out.println(se);
		} 
}else if(ustype.equals("student")){
	String quer="select * from student where userid=?";
	try{
	ps=con.prepareStatement(quer);
	ps.setString(1,ui);
    rs=ps.executeQuery();

	while(rs.next())
	{	%>
<tr>
				<td>USER ID:</td><td><input type="text" name="userid" id="userid" value="<%=rs.getString("userid") %>" disabled/></td>
			</tr>
			<tr>
				<td>FULL NAME:</td><td>
				<input type="text" name="fullname" id="fullname" value="<%=rs.getString("name") %>"/></td>
			</tr>
			<tr>
				<td>E-MAIL ID:</td><td>
				<input type="text" name="id" id="id" value="<%=rs.getString("email") %>"/></td>
			</tr>
			<tr>
				<td>CONTACT NO:</td><td>
				<input type="number" name="contact" id="contact" value="<%=rs.getString("phoneno") %>"/></td>
			</tr>
			<tr>
				<td>ADDRESS:</td><td><input type="text" name="address" id="address" value="<%=rs.getString("address") %>"/></td>
			</tr>
			
			<tr><td style="text-align:center;"><input type="submit" name="register" value="REGISTER FOR EVENT"/></td>
			<td style="text-align:center;"> <a href="/UniversityHelpdesk/jsp/viewEvent.jsp"> <input type="button" name="back" value="BACK"/></a></td></tr></table>
			</form>
			<%
	}
	}
	catch(SQLException se)
	{
		System.out.println(se);
		} 
}} }
catch(SQLException se)
	{
		System.out.println(se);
		} %>

</div>

</div>


<%} %>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>
</body>
</html>