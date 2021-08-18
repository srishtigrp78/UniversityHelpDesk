<%@ page language="java" import="java.sql.*,helpdesk.db.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | MESSAGE</title>
</head>
<body>

<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<th style="top: 0%;left: 44%;position: absolute;font-size: 40px;color: blue;"> MESSAGE </th>
<td align="right"> <a href="/UniversityHelpdesk/Signout" style="text-decoration: none;">LOGOUT</a> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">

		 

<%
Connection con=null;
PreparedStatement ps=null,ps1=null;
ResultSet rs=null,rs1=null;
HttpSession hs=null;
hs=request.getSession(false);
String id=(String)hs.getAttribute("info");
String src="";
String type=request.getParameter("recid");

con=CrudOperation.createConnection();
if(hs.isNew())
{
	response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised access");}
else{
String quer="select * from message where msgid=?";
String str="select * from login where userid=?";
int mid=Integer.parseInt(request.getParameter("msid"));
try{
		ps=con.prepareStatement(quer);
		ps1=con.prepareStatement(str);
		ps.setInt(1,mid);
		ps1.setString(1,id);
	rs=ps.executeQuery();
	rs1=ps1.executeQuery();
	if(rs.next() && rs1.next())
		
		
	{%>
	
	<div align="left" style="top: 2%;left: 2%;width: 20%;height: 20%;position: absolute;">
	
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
<% }
		%>
		
		</div>
		
		<div align="center" style="margin-top: 10%;font-size: 25px">
		<p><%=rs.getString("msgtxt") %></p> </div>
		
	<%
	}
	}
	catch(SQLException se)
	{
	System.out.println(se);
	}
	

finally
{
	try
{
	if(ps!=null)
		ps.close();
	
}
	catch(SQLException se)
	{
	System.out.println(se);
	}
}



if(type.equals("rec"))
	src="/UniversityHelpdesk/jsp/newuserinbox.jsp";
else if(type.equals("sent"))
src="/UniversityHelpdesk/jsp/newusersentitems.jsp";
}%>

</div>

<div align="right" style="top: 87%;right: 2%;width: 20%;height: 10%;position: absolute;">

<a href="<%=src%>" style="text-decoration: none;font-size: 25px;color: white;"> Back </a>


</div>



<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>



</body>
</html>