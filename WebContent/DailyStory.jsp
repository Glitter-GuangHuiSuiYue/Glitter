<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily Story</title>
</head>
<body>
<%@include file="Head.jsp" %>
<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String dateString= request.getParameter("date");  
%>
<br>
<div style="MARGIN-LEFT: 15%;">
<div style="MARGIN-LEFT: 0%;width:1000px;">
<h2><%=dateString %></h2>
<hr/>
</div>
</div>
<div style="MARGIN-LEFT: 15%;">
<% 
	Iterator<UserDailyKeywords> iterator = userDailyKeywords.iterator();
	while (iterator.hasNext()){
		UserDailyKeywords userDailyKeyword = iterator.next();
		Keyword keyword = keywordService.selectKeywordByID(userDailyKeyword.getWordId()).get(0);
		System.out.println(userDailyKeyword.getId());
		String storyDetail = "";
		Story story = storyService.selectStoryByUserDailyKeywordId(userDailyKeyword.getId());
		if (story != null){
			storyDetail = story.getStory();
		}
		%> 
		<h2> <%= keyword.getWord() %></h2>
		<br> 
		<h3> <%= storyDetail  %></h3>
		<br> <%
	}
%>
</div> 
</body>
</html>