<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%@include file="Head.jsp" %>
<%
	String dateString= request.getParameter("date");  
	String locationString = request.getParameter("location"); 
	String keywordString= request.getParameter("keyword");  
	String detail= request.getParameter("detail");   
	String publicnessString= request.getParameter("publicness");   
	String priceString= request.getParameter("price");   
	String pictureString= request.getParameter("picture");   
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	Date date=sdf.parse(dateString);  
	
	Long keywordId = -1L;
	Keyword existKeyword = keywordService.selectKeywordByWord(keywordString);
	if (existKeyword != null){
		keywordId = existKeyword.getId();
	}else{
		Keyword keyword = new Keyword();
		keyword.setWord(keywordString);
		keywordId = keywordService.insert(keyword);
	}
	if (keywordId == -1L){
		response.sendRedirect("Wrong.jsp");
	}
	
	Long locationId = -1L;
	Location existLocation = locationService.selectLocationByName(locationString);
	if (existLocation != null){
		locationId = existLocation.getId();
	}else{
		Location location = new Location();
		location.setLocation(locationString);
		locationId = locationService.insert(location);
	}
	if (locationId == -1L){
		response.sendRedirect("Wrong.jsp");
	}
	Long userDailyKeywordId = -1L;
	UserDailyKeywords udk = new UserDailyKeywords();
    userId = Long.parseLong(uidString);
	udk.setUserId(userId);
	udk.setWordId(keywordId);
	udk.setDate(date);
	udk.setLocationId(locationId);
	userDailyKeywordId = userDailyKeywordsService.insert(udk);
	if (userDailyKeywordId == -1L){
		response.sendRedirect("Wrong.jsp");
	}
	Long publicnessId = -1L;
	
	Story story = new Story();
	story.setStory(detail);
	story.setUserDailyKeywordId(userDailyKeywordId);
	storyService.insert(story);
	
	Publicness publicness = new Publicness();
	publicness.setPublicness(Integer.parseInt(publicnessString));
	publicness.setUserDailyKeywordId(userDailyKeywordId);
	publicness.setPrice(Integer.parseInt(priceString));
	publicnessService.insert(publicness);
	
	if (pictureString != "" && pictureString != null){
		Photo photo = new Photo();
		photo.setId(Long.parseLong(pictureString));
		photo.setUserDailyKeywordId(userDailyKeywordId);
		photo.setName(keywordString);
		photoService.insert(photo);
	}
	
	response.sendRedirect("Item.jsp?uid="+uidString+"&id="+userDailyKeywordId);
%>