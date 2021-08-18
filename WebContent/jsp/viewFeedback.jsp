<%@ page language="java" import="java.sql.*,helpdesk.db.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%Connection con=null;
PreparedStatement ps=null,ps1=null;
ResultSet rs=null,rs1=null;
%>
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
<th style="top: 0%;left: 42%;position: absolute;font-size: 40px;color: blue;"> VIEW FEEDBACK </th>
<td align="right"> <a href="/UniversityHelpdesk/jsp/admin.jsp" style="text-decoration: none;">HOME</a> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">

<div style="top: 10%;left: 2%;width: 40%;height: 80%;position: absolute;">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/feedback.jpg" style="border-radius: 25px">
</div>


<div style="top: 5%;left: 40%;width: 50%;height: 80%;position: absolute;font-size: 18px">


<form action="/UniversityHelpdesk/DeleteFeedback" method="post">
<table align="center" border=3 style="font-size: 20px;margin-top: 2%">
<tr style="color: white;"><th>SELECT</th><th>SUBJECT</th><th>DATE</th></tr>
<%con=CrudOperation.createConnection();

String quer="select * from feedback where status=?";

try{
	
	ps1=con.prepareStatement(quer);
	ps1.setString(1,"false");
	
	rs1=ps1.executeQuery();
	
	while(rs1.next())
	{	
		
	String d=rs1.getString("sno");
	String e=rs1.getString("subject");
	
	%>
	
	<tr><td><input type="checkbox" name="chk" value=<%=d %>></td><td><a href="/UniversityHelpdesk/jsp/showfeedbackdetails.jsp?msid=<%=rs1.getString("sno") %>&recid=rec"><%=e %></a></td><td><%=rs1.getString("date") %></td></tr>
	<% }
}
catch(SQLException se)
{
	System.out.println(se);} 
%>
<tr> <td>
<input type="submit" value="DELETE"> </td> </tr>
</table>
</form>
</div> </div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>

</body>
</html>