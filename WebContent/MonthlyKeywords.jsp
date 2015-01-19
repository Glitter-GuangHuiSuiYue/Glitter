<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily Keywords</title>
</head>
<body>

<%
	int year = Integer.parseInt(request.getParameter("year"));  
	int birthYear = Integer.parseInt(request.getParameter("birthYear"));  
	int currentYear = Integer.parseInt(request.getParameter("currentYear"));  
	int birthMonth = Integer.parseInt(request.getParameter("birthMonth"));  
	int currentMonth = Integer.parseInt(request.getParameter("currentMonth"));
	int birthDate = Integer.parseInt(request.getParameter("birthDate"));  
	int currentDate = Integer.parseInt(request.getParameter("currentDate"));
%>

<%@include file="PublishKeywords.jsp" %>

<br>
<%
	userDailyKeywords = userDailyKeywordsService.selectAllDatesByUID(userId); 
	//Set<Date> dates = new TreeSet<Date>();
	formatter.format(today);
	Map<String, String> dateKeywordMap = new HashMap<String, String>();
	formatter = new SimpleDateFormat("yyyy-MM");
	for (UserDailyKeywords userDailyKeyword : userDailyKeywords){
		dateKeywordMap.put(formatter.format(userDailyKeyword.getDate()), keywordService.selectKeywordByID(userDailyKeyword.getWordId()).get(0).getWord());
	}
%>
<br>
<div style="MARGIN-LEFT: 15%;">
<div style="MARGIN-LEFT: 0%;width:1000px;">
<h2><%=year %></h2>
<hr/>
</div>
<br>
<table border='1'cellspacing="0">
<tr>
<%
	for (int month = 1; month <= 12; month ++){
		String dateKey = year + "-" + (month < 10 ? "0" : "") + month;
		if (year == birthYear && month < birthMonth){
			%>
			<td width="80"></td>
			<%
		}else if (year == currentYear && month > currentMonth){
			%>
			<td width="80"></td>
			<%
		}else{

			if (dateKeywordMap.containsKey(dateKey)){
				%>
				<td width="80"><a href="DateKeywords.jsp?uid=<%=userId %>&year=<%=year %>&month=<%=month %>&birthYear=<%=birthYear %>&birthMonth=<%=birthMonth %>&birthDate=<%=birthDate %>&currentYear=<%=currentYear%>&currentMonth=<%=currentMonth%>&currentDate=<%=currentDate%>"><%=dateKeywordMap.get(dateKey) %></a></td>
				<%
			}else{
				%>
				<td width="80"><a href="DateKeywords.jsp?uid=<%=userId %>&year=<%=year %>&month=<%=month %>&birthYear=<%=birthYear %>&birthMonth=<%=birthMonth %>&birthDate=<%=birthDate %>&currentYear=<%=currentYear%>&currentMonth=<%=currentMonth%>&currentDate=<%=currentDate%>"><%=month %></a></td>
				<%
			}
			%>
<%
		}
	}
%>
</tr>
</table>
</div> 
</body>
</html>