<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>History</title>
</head>
<body>
<%@include file="Head.jsp" %>
<br>
<div style="MARGIN-LEFT: 15%;">
<div style="MARGIN-LEFT: 0%;width:1000px;">
<h2>My Keywords</h2>
<hr/>
</div>
<% 
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String dateString= request.getParameter("date");  
	Date date=sdf.parse(dateString);  
	userDailyKeywords = userDailyKeywordsService.selectAllDatesByUIDDate(userId, dateString);
	Boolean noKeyword = (userDailyKeywords.size() == 0);
	Iterator<UserDailyKeywords> iterator = userDailyKeywords.iterator();
	while (iterator.hasNext()){
		UserDailyKeywords userDailyKeyword = iterator.next();
		String word = keywordService.selectKeywordByID(userDailyKeyword.getWordId()).get(0).getWord();
		%>
		<div style="height:200px; width:1000px; border-style:outset;" >
		  <div style="MARGIN-LEFT: 1%;"><font size=5><%= dateString  %></font></div><br>
		  <br><br>
		  <div style="text-align:center;">
		    <font size=5 ><strong><a href = "Search.jsp?uid=<%=userId %>&keyword=<%=word %>"><%= word %></a></strong></font> 
				<% if (userDailyKeyword.getLocationId() != null){ %>
		  			<br><br><br><br>
					<div style="text-align:right;"><font size=3 ><strong>@<a href = "KeywordsOfLocation.jsp?uid=<%= userId %>&location=<%= locationService.selectLocationByID(userDailyKeyword.getLocationId()).get(0).getLocation() %>">
					<%=locationService.selectLocationByID(userDailyKeyword.getLocationId()).get(0).getLocation() %></a></strong></font></div>
					<%
					}
				%>
			<br><br><br>
		 </div>
		</div><br> <%
	}
	if (noKeyword){ 
		%> <div style="MARGIN-LEFT: 72%;width:1000px;"><a href = "DailyKeywords.jsp">Create today's keyword</a> </div> <%
	}
%>

<div style="MARGIN-LEFT: 0%;width:1000px;">
<h2>Others' Keywords</h2>
<hr/>
</div>
</div> 
</body>
</html>