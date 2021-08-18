<%@ page language="java" import="java.sql.*,helpdesk.db.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | INBOX</title>
<%Connection con=null;
PreparedStatement ps=null,ps1=null;
ResultSet rs=null,rs1=null;
HttpSession hs=null;
hs=request.getSession(false);
String id=(String)hs.getAttribute("info");%>
</head>
<body>

<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<th style="top: 0%;left: 45%;position: absolute;font-size: 40px;color: blue;"> INBOX </th>
<td align="right"> <a href="/UniversityHelpdesk/Signout" style="text-decoration: none;"> LOGOUT </a> </td>
</tr>
</table>
</div>


<div style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">

<div style="top: 5%;left: 2%;width: 98%;height: 90%;position: absolute;font-size: 18px">

<form action="/UniversityHelpdesk/NewUserInbox" method="post">
<table align="center" border=3 style="font-size: 20px;margin-top: 2%">
<tr style="color: white;"><th>SELECT</th><th>SENDER ID</th><th>SUBJECT</th><th>DATE</th></tr>
<%con=CrudOperation.createConnection();
if(hs.isNew())
	response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised access");
else{
String quer="select * from message where recid=? and rstatus=?";
String str="select * from login where userid=?";
try{
	
	ps1=con.prepareStatement(str);
	

	ps1.setString(1,id);
	rs1=ps1.executeQuery();
	
	

	while(rs1.next())
	{	%>
	
	<div align="left" style="top: 2%;left: 0%;width: 20%;height: 20%;position: absolute;">
	
	<%
	
		String utype=rs1.getString("usertype");
		if(utype.equals("admin"))
				{%>
			<a href="/UniversityHelpdesk/jsp/admin.jsp"><input type="button" value="HOME"/></a>
				<% }
		else if(utype.equals("newuser"))
		{%>
	<a href="/UniversityHelpdesk/jsp/newuser.jsp"><input type="button" value="HOME"/></a>
		<% }
		else if(utype.equals("staff"))
		{%>
	<a href="/UniversityHelpdesk/jsp/staff.jsp"><input type="button" value="HOME"/></a>
		<% }
		else if(utype.equals("student"))
		{%>
	<a href="/UniversityHelpdesk/jsp/student.jsp"><input type="button" value="HOME"/></a>
		<% }
		else if(utype.equals("faculty"))
		{%>
	<a href="/UniversityHelpdesk/jsp/faculty.jsp"><input type="button" value="HOME"/></a>
		<% }%>
		</div>
		<%
		}
}

catch(SQLException se)
{
	System.out.println(se);}
	try{
		ps=con.prepareStatement(quer);
		
		ps.setString(1,id);
		ps.setString(2,"false");
		
		
	rs=ps.executeQuery();
	while(rs.next())
	{	
		
	String d=rs.getString("msgid");
	String e=rs.getString("senderid");
	String f=rs.getString("subject");
	%>
	
	<tr><td><input type="checkbox" name="chk" value=<%=d %>></td><td><%=e %></td><td><a href="/UniversityHelpdesk/jsp/newusershowmsg.jsp?msid=<%=rs.getString("msgid") %>&recid=rec"><%=f %></a></td><td><%=rs.getString("date") %></tr>
	<%}
}
catch(SQLException se)
{
	System.out.println(se);} }
%>
<tr> <td>
<input type="submit" value="DELETE"> </td> </tr>
</table>
</form>
</div>
</div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>

</body>
</html>