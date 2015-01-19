<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily Keywords</title>
</head>
<body>
<%@include file="PublishKeywords.jsp" %>
<div style="MARGIN-LEFT: 15%;">
<div style="MARGIN-LEFT: 0%;width:1000px;">
<h2>History</h2>
<hr/>
</div>
<br>
<table border='1'cellspacing="0" cellpadding="33" >
<tr>
<%

	String birthYearString = request.getParameter("birthYear");
	Integer birthYear = Integer.parseInt(birthYearString);
	String birthMonthString = request.getParameter("birthMonth");
	Integer birthMonth = Integer.parseInt(birthMonthString);
	String birthDateString = request.getParameter("birthDate");
	Integer birthDate = Integer.parseInt(birthDateString);
	Date date = new Date();
	int currentYear = date.getYear() + 1900;
	int currentMonth = date.getMonth() + 1;
	int currentDate = date.getDate();
	for (int year = birthYear - (birthYear % 10); year <= currentYear; year ++){
		if (year >= birthYear){
			%>
			<td><a href="MonthlyKeywords.jsp?uid=<%=userId %>&year=<%=year %>&birthYear=<%=birthYear %>&birthMonth=<%=birthMonth %>&birthDate=<%=birthDate %>&currentYear=<%=currentYear%>&currentYear=<%=currentYear%>&currentMonth=<%=currentMonth%>&currentYear=<%=currentYear%>&currentDate=<%=currentDate%>"><%=year %></a></td>
			<%
			if (year % 10 == 9){
				%>
				</tr><tr>
				<%
			}
		}else{
			%>
			<td></td>
			<%
		}
	}
%>
</tr>
</table>
</div> 
<!-- <object id="player" height="400" width="500" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">
    <param name="url" value="http://localhost:8080/Eyes/User/Video/Wildlife.wmv">
</object>
<EMBED src="http://localhost:8080/Eyes/User/Video/Wildlife.wmv" width="499" height="356" type="audio/x-wav" loop="false" autostart="false"></EMBED>    
 -->
</body>
</html>