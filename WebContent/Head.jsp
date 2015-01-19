<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Session"%>
<%@page import="keyword.bean.*"%>
<%@page import="keyword.service.*"%>
<jsp:useBean id="userDao" scope="session" class="keyword.dao.UserDao" />
<jsp:useBean id="userService" scope="session" class="keyword.service.UserService" /> 
<jsp:useBean id="userDailyKeywordsDao" scope="session" class="keyword.dao.UserDailyKeywordsDao" />
<jsp:useBean id="userDailyKeywordsService" scope="session" class="keyword.service.UserDailyKeywordsService" />
<jsp:useBean id="keywordDao" scope="session" class="keyword.dao.KeywordDao" />
<jsp:useBean id="keywordService" scope="session" class="keyword.service.KeywordService" /> 
<jsp:useBean id="storyDao" scope="session" class="keyword.dao.StoryDao" />
<jsp:useBean id="storyService" scope="session" class="keyword.service.StoryService" />
<jsp:useBean id="photoDao" scope="session" class="keyword.dao.PhotoDao" />
<jsp:useBean id="photoService" scope="session" class="keyword.service.PhotoService" />
<jsp:useBean id="locationDao" scope="session" class="keyword.dao.LocationDao" />
<jsp:useBean id="locationService" scope="session" class="keyword.service.LocationService" />  
<jsp:useBean id="publicnessDao" scope="session" class="keyword.dao.PublicnessDao" />
<jsp:useBean id="publicnessService" scope="session" class="keyword.service.PublicnessService" /> 
<jsp:useBean id="buyKeywordDao" scope="session" class="keyword.dao.BuyKeywordDao" />
<jsp:useBean id="buyKeywordService" scope="session" class="keyword.service.BuyKeywordService" />  
<jsp:useBean id="commentDao" scope="session" class="keyword.dao.CommentDao" /> 
<jsp:useBean id="commentService" scope="session" class="keyword.service.CommentService" />  
<%
	String uidString = request.getParameter("uid");
	Long userId = Long.parseLong(uidString);
	userService.setDao(userDao);
	keywordService.setDao(keywordDao);
	userDailyKeywordsService.setDao(userDailyKeywordsDao);
	storyService.setDao(storyDao);
	photoService.setDao(photoDao);
	locationService.setDao(locationDao);
	publicnessService.setDao(publicnessDao);
	buyKeywordService.setDao(buyKeywordDao);
	commentService.setDao(commentDao);
	List<UserDailyKeywords> userDailyKeywords = userDailyKeywordsService.selectAllDatesByUID(userId); 
	//Set<Date> dates = new TreeSet<Date>();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date today = new Date();
	formatter.format(today);
%>
<script language='javascript'>
	function newGlitter(uid)
	{
		var date = prompt("date");
		var keyword = prompt("keyword");
		var detail = document.getElementById("detail").value;
		window.location.href='WhatsNew.jsp?date='+date+'&uid='+uid+'&keyword='+keyword+'&detail='+detail;
	}
	function newComment(uid,udkid)
	{
		var comment = document.getElementById("addComment").value;
		window.location.href='WhatsNewComment.jsp?&uid='+uid+'&udkid='+udkid+'&comment='+comment;
	}
	function search(uid,word){
		if(event.keyCode == 13) {
			window.location.href='Search.jsp?uid='+uid+'&keyword='+word;
		}
	}
	function detailSearch(uid,word,time,location){
		window.location.href='DetailSearch.jsp?uid='+uid+'&keyword='+word+'&time='+time+'&location='+location;
	}
	function newGlitter(uid)
	{
		var date = prompt("date");
		var location = prompt("location");
		var keyword = prompt("keyword");
		var publicness = prompt("publicness");
		var price = 0;
		if (publicness == 1)
		{
			price = prompt("price");
		}
		var picture = prompt("picture");
		var detail = document.getElementById("detail").value;
		window.location.href='WhatsNew.jsp?date='+date+'&location='+location+'&uid='+uid+'&keyword='+keyword+'&detail='+detail+'&publicness='+publicness+'&price='+price+'&picture='+picture;
	}
</script>
<div style="MARGIN-LEFT: 15%;">
<table cellspacing=0 cellpadding=0 width=1280 border=0 align="center" >
<tr><td align=left><a href="DetailSearch.jsp?uid=<%=userId %>&keyword=&time=&location="><img height=50 src='glitter.png' border=0 /></a></td>
<td align=right valign=bottom style="position:absolute; right:10.5%;"><span class="STYLE2">  
    <input id = 'search' style="height:30px; width:200px;" onkeyup='search(<%=userId %>,this.value);'/></span></td>
</tr>
<tr>
<td align=right valign=bottom style="position:absolute; right:10.5%;"><a href="DetailSearch.jsp?uid=<%=userId %>&keyword=&time=&location=">Need Detail Search!</a></td>
</tr>
</table></div>