<%@ page language="java" import="java.sql.*,helpdesk.db.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UNIVERSITY HELPDESK | EVENT</title>
</head>
<body>
<%
		Connection con = null;
		PreparedStatement ps1 = null,ps=null;
		ResultSet rs1 = null,rs=null;
		HttpSession hs = request.getSession(false);
		String uid = (String) hs.getAttribute("info");
		if (hs.isNew() || uid == null) {
			response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised access");
		} else {
	%>
<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;background-color: grey">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<th style="top: 0%;left: 44%;position: absolute;font-size: 40px;color: blue;"> EVENTS </th>
<td align="right"> <%
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
 %> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">
<form>
<table align="center" border=3 style="font-size: 20px;margin-top: 2%">
<tr style="color: white;"><th>EVENT TITLE</th><th>REGISTRATION START DATE</th><th>REGISTRATION END DATE</th><th>CATEGORY</th></tr>
<%
String quer="select * from event";
try{
	ps=con.prepareStatement(quer);
    rs=ps.executeQuery();

	while(rs.next())
	{	%>
	
	<!-- <div align="left" style="top: 2%;left: 2%;width: 20%;height: 20%;position: absolute;"> -->
	<tr>
	<td><a href="/UniversityHelpdesk/jsp/viewEventDetails.jsp?msid=<%=rs.getString("title") %>"><%=rs.getString("title") %></a></td>
	<td><%=rs.getString("regstart") %></td>
	<td><%=rs.getString("regend") %></td>
	
	<td><%=rs.getString("category") %></tr>




	<%
	}
	}
	catch(SQLException se)
	{
		System.out.println(se);
		} 
		}
	%>

</table></form>
</div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>
</body>
</html>