<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%@include file="Head.jsp" %>
<% 
	uidString= request.getParameter("uid");
	String udkidString= request.getParameter("udkid");  
	String comment= request.getParameter("comment");   
	
	Long userDailyKeywordId = Long.parseLong(udkidString);
    userId = Long.parseLong(uidString);
	commentService.createComment(userId, userDailyKeywordId, 0, comment, today);
	if (userDailyKeywordId == -1L){
		response.sendRedirect("Wrong.jsp");
	}
	
	response.sendRedirect("Item.jsp?uid="+uidString+"&id="+udkidString);
%>