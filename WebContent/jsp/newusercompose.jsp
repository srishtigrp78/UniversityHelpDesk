<%@ page language="java" import="java.sql.*,helpdesk.db.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- <script>index=0;
var arr=new Array(3);
arr[0]="/UniversityHelpdesk/images/c1.png";
arr[1]="/UniversityHelpdesk/images/c2.png";
arr[2]="/UniversityHelpdesk/images/c3.png";
function showpics()
{
	
	
	im=document.getElementById("images");
	im.src=arr[index];
	index++;
	if(index>2)
		index=0;
	setTimeout("showpics()",1500);
	}</script>
<link rel="stylesheet" href="/buildinglifestyle/css/messages.css"/> -->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%Connection con=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
HttpSession hs=null;
hs=request.getSession(false);
String id=(String)hs.getAttribute("info");
%>
<title>UNIVERSITY HELPDESK | COMPOSE</title>

<script>
function checkuserid(ui)
{
	
	var x;
	if(XMLHttpRequest)
		x=new XMLHttpRequest();
	else
		x=new ActiveXObject("Microsoft.XMLHTTP");
	
	x.onreadystatechange=function(){
		                          if(x.readyState==4&&x.status==200)
		                        	  {
		                        	  info=x.responseText;

		                        	  document.getElementById("msg1").innerHTML="<font color='GREEN'>"+info+"</font>";
		                        	  }
	                              }
	x.open("get","/UniversityHelpdesk/NewUserCompose?userid="+ui,"true");
	x.send();
	
}

function chk() {
	var flag=true;
	var id=document.getElementById("recid").value;
	if(id.length==0)
		{
		alert("RECEIVER ID REQUIRED ");
		document.getElementById("recid").focus();
		flag=false;
		return flag;
		}
	var sub=document.getElementById("sub").value;
	if(id.length==0)
		{
		alert("SUBJECT REQUIRED");
		document.getElementById("sub").focus();
		flag=false;
		return flag;
		}
	var msg=document.getElementById("msg").value;
	if(id.length==0)
		{
		alert("MESSAGE REQUIRED");
		document.getElementById("msg").focus();
		flag=false;
		return flag;
		}
	return flag;
}</script>
</head>

<!-- <body background="/UniversityHelpdesk/images/1893488.jpg" onload="showpics()"> -->
<body>

<div style="top: 0%;left: 0%;width: 100%;height: 30%;position: absolute;">
<img width="100%" height="100%" src="/UniversityHelpdesk/images/onlinehd.jpg">
</div>

<div style="top: 30%;left: 0%;width: 100%;height: 8%;position: absolute;background-color: white;">
<table width="100%">
<tr>
<th style="top: 0%;left: 42%;position: absolute;font-size: 40px;color: blue;"> COMPOSE </th>
<td align="right"> <a href="/UniversityHelpdesk/jsp/home.jsp" style="text-decoration: none;">LOGOUT</a> </td>
</tr>
</table>
</div>

<div align="center" style="top: 38%;left: 0%;width: 100%;height: 57%;position: absolute;background-color: #808080;">

		
	
	
	<p style="font-size: 20px;color: white;">SEND A MESSAGE</p>
	
<%
con=CrudOperation.createConnection();
if(id==null || hs.isNew())
	response.sendRedirect("/UniversityHelpdesk/jsp/home.jsp?msg=unauthorised access");
else{
	
	String str="select * from login where userid=?";
	
		try{
			
			
			ps1=con.prepareStatement(str);
			System.out.println(ps1);
			
			ps1.setString(1,id);
			rs1=ps1.executeQuery();
			
			while(rs1.next())
			{	%>
			
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
				<% }%>
				</div>
				<%
				}
		}
		catch(SQLException se)
		{
			System.out.println(se);}
%>
<div align="center" style="font-size: 18px">
<form action="/UniversityHelpdesk/NewUserCompose" method="post" onsubmit="return chk()">
<table>
<tr><td>RECEIVER ID</td><td>  <input type="text" name="recid" id="recid" onblur="checkuserid(this.value)"></td></tr>
<div id="msg1"> </div> <br><br>
<tr><td>SUBJECT</td><td><input type="text" name="sub" id="sub"></td></tr>
<tr><td>MESSAGE</td><td> <textarea rows="5" cols="22" name="msg" id="msg"> </textarea> </td></tr> 
<tr><th colspan="2"><input type="submit" value="SUBMIT"></th></tr></table>
</form>
<%} %>
</div>

</div>

<div align="center" style="top: 95%;left: 0%;width: 100%;height: 5%;position: absolute;background-color: white;font-size: 15px">
		Copyright © 2017 All rights reserved 
		</div>

<!-- <div id="right" style="float:left"><img src="/UniversityHelpdesk/images/ms1.jpg" width=450px height="400px" id="images"></div> -->
</body>
</html>