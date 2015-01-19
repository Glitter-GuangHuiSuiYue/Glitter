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
	String locationInString = request.getParameter("location");
	Location location = locationService.selectLocationByName(locationInString);
	userDailyKeywords = userDailyKeywordsService.selectAllDatesByUIDLID(userId, location.getId());
	
	Iterator<UserDailyKeywords> iterator = userDailyKeywords.iterator();
	while (iterator.hasNext()){
		UserDailyKeywords userDailyKeyword = iterator.next();
		String word = keywordService.selectKeywordByID(userDailyKeyword.getWordId()).get(0).getWord();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date = userDailyKeyword.getDate();
		String dateInString = sdf.format(date);
		%>
		<div style="height:200px; width:1000px; border-style:outset;" >
		  <div style="MARGIN-LEFT: 1%;"><font size=5><a href = "KeywordsOfDate.jsp?uid=<%= userId %>&date=<%= dateInString %>"><%= dateInString  %></a></font></div><br>
		  <br><br>
		  <div style="text-align:center;">
		    <font size=5 ><strong><a href = "Search.jsp?uid=<%=userId %>&keyword=<%=word %>"><%= word %></a></strong></font> 
				<% if (userDailyKeyword.getLocationId() != null){ %>
		  			<br><br><br><br>
					<div style="text-align:right;"><font size=3 ><strong>@
					<%=locationService.selectLocationByID(userDailyKeyword.getLocationId()).get(0).getLocation() %></strong></font></div>
					<%
					}
				%>
			<br><br><br>
		 </div>
		</div><br> <%
	}
%>

<div style="MARGIN-LEFT: 0%;width:1000px;">
<h2>Others' Keywords</h2>
<hr/>
</div>
</div> 
</body>
</html>