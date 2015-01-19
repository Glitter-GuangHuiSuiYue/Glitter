<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<% 
	Iterator<UserDailyKeywords> iterator = userDailyKeywords.iterator();
	while (iterator.hasNext()){
		UserDailyKeywords userDailyKeyword = iterator.next();
		Date date = userDailyKeyword.getDate();
		String word = keywordService.selectKeywordByID(userDailyKeyword.getWordId()).get(0).getWord();
		//Get detail story
		Story story = storyService.selectStoryByUserDailyKeywordId(userDailyKeyword.getId());
		//Get photos
		List<Photo> photos = photoService.selectPhotosByUserDailyKeywordId(userDailyKeyword.getId());
		String storyDetail = "";
		if (story != null){
			storyDetail = story.getStory();
		}
		%>
		<div style="height:200px; width:1000px; border-style:outset;" >
		  <span style="float:leFt;"><font size=5><a href = "KeywordsOfDate.jsp?uid=<%= userId %>&date=<%= date.toString().substring(0, 10) %>"><%= date.toString().substring(0, 10)  %></a></font> </span><span style="float:right;" ><font size=5 ><strong><a href = "Search.jsp?uid=<%=userId %>&keyword=<%= word %>"><%= word  %></a></strong></font> </span>
		  <br>
		  <br>
		  <br>
		  <br>
		  <div style="text-align:left;">
				<% 
				if (photos != null && photos.size() > 0){ 
					for (Photo photo : photos) {%>
					<img id="img1" src="User/Picture/<%= photo.getId()%>.png" style='width:100px;height:60px;'  onclick=";"></img>
					<%
					}
				}
				%>
		    <%=storyDetail %>
				<% if (userDailyKeyword.getLocationId() != null){ %>
		  			<br><br><br>
					<div style="text-align:right;"><font size=3 ><strong>@<a href = "KeywordsOfLocation.jsp?uid=<%= userId %>&location=<%= locationService.selectLocationByID(userDailyKeyword.getLocationId()).get(0).getLocation() %>">
					<%=locationService.selectLocationByID(userDailyKeyword.getLocationId()).get(0).getLocation() %></a></strong></font></div>
					<%
					}
				%>
			<br><br><br>
		 </div>
		</div><br> <%
	}
%>
</div> 
</body>
</html>