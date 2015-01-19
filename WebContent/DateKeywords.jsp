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
	int month = Integer.parseInt(request.getParameter("month"));  
	int birthMonth = Integer.parseInt(request.getParameter("birthMonth"));  
	int currentMonth = Integer.parseInt(request.getParameter("currentMonth"));
	int birthDate = Integer.parseInt(request.getParameter("birthDate"));  
	int currentDate = Integer.parseInt(request.getParameter("currentDate")); 
%>

<%@include file="PublishKeywords.jsp" %>

<br>
<%
	formatter.format(today);
	Map<String, String> dateKeywordMap = new HashMap<String, String>();
	Map<String, String> datePhotoMap = new HashMap<String, String>();
	Map<String, String> dateIdMap = new HashMap<String, String>();
	for (UserDailyKeywords userDailyKeyword : userDailyKeywords){
		dateKeywordMap.put(formatter.format(userDailyKeyword.getDate()), keywordService.selectKeywordByID(userDailyKeyword.getWordId()).get(0).getWord());
		List<Photo> photoList = photoService.selectPhotosByUserDailyKeywordId(userDailyKeyword.getId());
		if (photoList != null && photoList.size() > 0){
			datePhotoMap.put(formatter.format(userDailyKeyword.getDate()), photoList.get(0).getId().toString());
		}
		dateIdMap.put(formatter.format(userDailyKeyword.getDate()), userDailyKeyword.getId().toString());
	}
%>
<br>
<div style="MARGIN-LEFT: 15%;">
<div style="MARGIN-LEFT: 0%;width:1000px;">
<h2><%=year %> - <%=month %></h2>
<hr/>
</div>
<br>
<table border='1'cellspacing="0" cellpadding="10">
<tr>
<%
	for (int date = 1; date <= 31; date ++){
		String dateKey = year + "-" + (month < 10 ? "0" : "") + month + "-" + (date < 10 ? "0" : "") + date;
		if (date == 29 && month == 2 && year % 4 != 0){
			break;
		}
		if (date == 30 && month == 2 && year % 4 == 0){
			break;
		}
		if (date == 31 && (month == 4 || month == 6 || month == 9 || month == 11)){
			break;
		}
		if (year == birthYear){
			if (month == birthMonth){
				if (date >= birthDate){
					if (datePhotoMap.containsKey(dateKey)){
						%>
						<td width="80"><a href="Item.jsp?uid=<%=userId %>&id=<%=dateIdMap.get(dateKey) %>"><img id="img1" src="User/Picture/<%=datePhotoMap.get(dateKey) %>.png" style='width:100px;height:60px;'  onclick=";"></img></a></td>
						<%
					}else{
						if (dateKeywordMap.containsKey(dateKey)){
							%>
							<td width="80"><a href="Item.jsp?uid=<%=userId %>&id=<%=dateIdMap.get(dateKey) %>"><%=dateKeywordMap.get(dateKey) %></a></td>
							<%
						}else{
							%>
							<td width="80"><%=date %></td>
							<%
						}
					}
				}else{
					%><td width="80"></td><%
				}
			}else if (month > birthMonth){
				if (datePhotoMap.containsKey(dateKey)){
					%>
					<td width="80"><a href="Item.jsp?uid=<%=userId %>&id=<%=dateIdMap.get(dateKey) %>"><img id="img1" src="/User/Picture/<%=datePhotoMap.get(dateKey) %>.png" style='width:100px;height:60px;'  onclick=";"></img></a></td>
					<%
				}else{
					if (dateKeywordMap.containsKey(dateKey)){
						%>
						<td width="80"><a href="Item.jsp?uid=<%=userId %>&id=<%=dateIdMap.get(dateKey) %>"><%=dateKeywordMap.get(dateKey) %></a></td>
						<%
					}else{
						%>
						<td width="80"><%=date %></td>
						<%
					}
				}
			}
		}else{
			if (year == currentYear){
				if (month < currentMonth){
					if (datePhotoMap.containsKey(dateKey)){
						%>
						<td width="80"><a href="Item.jsp?uid=<%=userId %>&id=<%=dateIdMap.get(dateKey) %>"><img id="img1" src="User/Picture/<%=datePhotoMap.get(dateKey) %>.png" style='width:100px;height:60px;'  onclick=";"></img></a></td>
						<%
					}else{
						if (dateKeywordMap.containsKey(dateKey)){
							%>
							<td width="80"><a href="Item.jsp?uid=<%=userId %>&id=<%=dateIdMap.get(dateKey) %>"><%=dateKeywordMap.get(dateKey) %></a></td>
							<%
						}else{
							%>
							<td width="80"><%=date %></td>
							<%
						}
					}
				}else if (month == currentMonth){
					if (date <= currentDate){
						if (datePhotoMap.containsKey(dateKey)){
							%>
							<td width="80"><a href="Item.jsp?uid=<%=userId %>&id=<%=dateIdMap.get(dateKey) %>"><img id="img1" src="User/Picture/<%=datePhotoMap.get(dateKey) %>.png" style='width:100px;height:60px;'  onclick=";"></img></a></td>
							<%
						}else{
							if (dateKeywordMap.containsKey(dateKey)){
								%>
								<td width="80"><a href="Item.jsp?uid=<%=userId %>&id=<%=dateIdMap.get(dateKey) %>"><%=dateKeywordMap.get(dateKey) %></a></td>
								<%
							}else{
								%>
								<td width="80"><%=date %></td>
								<%
							}
						}
					}
				}
			}else{
				if (datePhotoMap.containsKey(dateKey)){
					%>
					<td width="80"><a href="Item.jsp?uid=<%=userId %>&id=<%=dateIdMap.get(dateKey) %>"><img id="img1" src="User/Picture/<%=datePhotoMap.get(dateKey) %>.png" style='width:100px;height:60px;'  onclick=";"></img></a></td>
					<%
				}else{
					if (dateKeywordMap.containsKey(dateKey)){
						%>
						<td width="80"><a href="Item.jsp?uid=<%=userId %>&id=<%=dateIdMap.get(dateKey) %>"><%=dateKeywordMap.get(dateKey) %></a></td>
						<%
					}else{
						%>
						<td width="80"><%=date %></td>
						<%
					}
				}
			}
		}
		if (date % 10 == 0){
			%>
			</tr><tr>
			<%
		}
	}
%>
</tr>
</table>
</div> 
</body>
</html>