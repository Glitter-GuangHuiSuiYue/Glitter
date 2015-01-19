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
	String word = request.getParameter("keyword");
	List<Keyword> keywords = keywordService.selectKeywordsContainsWord(word);
	userDailyKeywords = new ArrayList<UserDailyKeywords>();
	if (keywords != null){
		for (Keyword keyword : keywords){
			List<UserDailyKeywords> results = userDailyKeywordsService.selectAllDatesByUIDKID(userId, keyword.getId());
			for (UserDailyKeywords userDailyKeyword : results){
				userDailyKeywords.add(userDailyKeyword); 
			}
		}
	}
	
	Iterator<UserDailyKeywords> iterator = userDailyKeywords.iterator();
	while (iterator.hasNext()){
		UserDailyKeywords userDailyKeyword = iterator.next();
		Date date = userDailyKeyword.getDate();
		word = keywordService.selectKeywordByID(userDailyKeyword.getWordId()).get(0).getWord();
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

<div style="MARGIN-LEFT: 0%;width:1000px;">
<h2>Others' Keywords</h2>
<hr/>
</div>

<% 
	userDailyKeywords = new ArrayList<UserDailyKeywords>();
	if (keywords != null){
		for (Keyword keyword : keywords){
			List<UserDailyKeywords> results = userDailyKeywordsService.selectAllDatesByExcludedUIDKID(userId, keyword.getId());
			for (UserDailyKeywords userDailyKeyword : results){
				int publicness = publicnessService.selectPublicnesssByUserDailyKeywordId(userDailyKeyword.getId()).getPublicness();
				if (publicness != 0){
					userDailyKeywords.add(userDailyKeyword);
				}
			}
		}
	}
	
	iterator = userDailyKeywords.iterator();
	while (iterator.hasNext()){
		UserDailyKeywords userDailyKeyword = iterator.next();
		String userName = userService.selectUserByID(userDailyKeyword.getUserId()).getUserName();
		Date date = userDailyKeyword.getDate();
		word = keywordService.selectKeywordByID(userDailyKeyword.getWordId()).get(0).getWord();
		//Get price
		int price = publicnessService.selectPublicnesssByUserDailyKeywordId(userDailyKeyword.getId()).getPrice();
		boolean hasBought = buyKeywordService.hasUserBought(userId, userDailyKeyword.getId());
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
		  <span style="float:leFt;"><font size=5 ><a href = "KeywordsOfDate.jsp?uid=<%= userDailyKeyword.getUserId() %>&date=<%= date.toString().substring(0, 10) %>"><%= date.toString().substring(0, 10)  %></a> <strong>@<%=userName %></strong> </font> </span><span style="float:right;" ><font size=5 ><strong><a href = "Search.jsp?uid=<%=userId %>&keyword=<%= word %>"><%= word  %></a></strong></font> </span>
		  <br>
		  <br>
		  <br>
		  <br>
		  <div style="text-align:left;">
				<% 
				if ((price == 0 || hasBought) && photos != null && photos.size() > 0){ 
					for (Photo photo : photos) {%>
					<img id="img1" src="User/Picture/<%= photo.getId()%>.png" style='width:100px;height:60px;'  onclick=";"></img>
					<%
					}
				}
				%>
				<% 
				if (price == 0 || hasBought) {
				%>
		    		<%=storyDetail %>
		    	<%
				}else{
		    	%>
		    		<div style="text-align:center;"><font size=5 ><strong><a href="BuyUserDailyKeywords.jsp?uid=<%=userId %>&udkid=<%=userDailyKeyword.getId() %>">Pay $<%=price %> to see</a></strong></font></div>
		    	<%} %>
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