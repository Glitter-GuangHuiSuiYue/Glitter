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
</div>
<div style="MARGIN-LEFT: 15%;">
<% 
	Long keyWordId = Long.valueOf(request.getParameter("wordId"));
	userDailyKeywords = userDailyKeywordsService.selectAllDatesByUIDKID(userId, keyWordId); 
	Set<Date> dates = new TreeSet<Date>();
	for (int i = 0; i < userDailyKeywords.size(); i ++){
		if (!dates.contains(userDailyKeywords.get(i).getDate())){
			dates.add(userDailyKeywords.get(i).getDate());
		}
	}
	Iterator<Date> iterator = dates.iterator();
	while (iterator.hasNext()){
		Date date = iterator.next();
		%> <button style="height:200px; width:1000px;" ><h1> <%= date.toString().substring(0, 10) %></h1> <%
		for (int i = 0; i < userDailyKeywords.size(); i ++){
			UserDailyKeywords userDailyKeyword = userDailyKeywords.get(i);
			if (userDailyKeyword.getDate().equals(date)){
				%> <h2> <%= keywordService.selectKeywordByID(userDailyKeyword.getWordId()).get(0).getWord()  %></h2> <%
			}
		}
		%> </button><br> <%
	}
	
%>
</div> 
</body>
</html>