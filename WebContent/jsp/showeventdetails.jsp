<%@ page language="java" import="java.sql.*,helpdesk.db.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | EVENT</title>
<%Connection con=null;
PreparedStatement ps=null,ps1=null;
ResultSet rs=null,rs1=null;
%>
</head>
<body>
<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<th style="top: 0%;left: 44%;position: absolute;font-size: 40px;color: blue;"> EVENT </th>
<td align="right"> <a href="/UniversityHelpdesk/jsp/home.jsp" style="text-decoration: none;">HOME</a> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">
<form>
<table align="center" border=3 style="font-size: 20px;margin-top: 2%">

<%con=CrudOperation.createConnection();
String title=request.getParameter("msid");
String quer="select * from event where title=?";
try{
	ps=con.prepareStatement(quer);
	ps.setString(1,title);
    rs=ps.executeQuery();

	while(rs.next())
	{	%>
	
	<div align="left" style="top: 2%;left: 2%;width: 20%;height: 20%;position: absolute;">
	
			<tr>
				<td>EVENT TITLE</td><td colspan=2>
				<input type="text" name="txttitle" id="txttitle" value="<%=rs.getString("title") %>" disabled/></td>
			</tr>
			<tr>
				<td>START DATE</td><td colspan=2>
				<input type="date" name="txtstartdate" id="txtstartdate" value="<%=rs.getString("startdate") %>" disabled /></td>
			</tr>
			<tr>
				<td>END DATE</td><td colspan=2>
				<input type="date" name="txtenddate" id="txtenddate" value="<%=rs.getString("enddate") %>" disabled/></td>
			</tr>
			<tr>
				<td>EVENT CATEGORY</td><td colspan=2>
				<input type="text" name="txtcategory" id="txtcategory" value="<%=rs.getString("category") %>" disabled/></td>
			</tr>
			<tr>
				<td>DESCRIPTION</td><td colspan=2>
				<input type="text" name="txtdescription" id="txtdescription" value="<%=rs.getString("description") %>" disabled/></td>
			</tr>
			
			<tr>
				<td>LOCATION</td><td colspan=2>
				<input type="text" name="txtlocation" id="txtlocation" value="<%=rs.getString("location") %>" disabled/></td>
			</tr>
			<tr>
				<td>REGISTRATION STARTS ON</td><td colspan=2>
				<input type="date" name="txtregstart" id="txtregstart" value="<%=rs.getString("regstart") %>" disabled/></td>
			</tr>
			<tr>
				<td>REGISTRATION ENDS ON</td><td colspan=2>
				<input type="date" name="txtregend" id="txtregend" value="<%=rs.getString("regend") %>" disabled/></td>
			</tr>
			
			<tr style="text-align:center;"><td><a href="/UniversityHelpdesk/jsp/loginForRegistration.jsp"><input type="button" name="register" value="WANT TO REGISTER FOR EVENT ?"/></a></td>
			<td><a href="/UniversityHelpdesk/jsp/event.jsp"><input type="button" name="back" value="BACK"/></a></td></tr>
		
	<%
	}
	}
	catch(SQLException se)
	{
		System.out.println(se);
		} 
	%>

</table>
		</form>
</div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>
</body>
</html>