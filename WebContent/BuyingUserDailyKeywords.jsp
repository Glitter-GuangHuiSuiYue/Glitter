<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<%@page import="keyword.bean.*"%>
<%@page import="keyword.service.*"%>
<%@page import="keyword.bean.*"%>
<%@page import="keyword.service.*"%>
<jsp:useBean id="buyKeywordDao" scope="session" class="keyword.dao.BuyKeywordDao" />
<jsp:useBean id="buyKeywordService" scope="session" class="keyword.service.BuyKeywordService" />  
<%
	buyKeywordService.setDao(buyKeywordDao);
	String userIdString = request.getParameter("uid");
	String userDailyKeywordIdString = request.getParameter("udkid");
	buyKeywordService.buy(Long.parseLong(userIdString), Long.parseLong(userDailyKeywordIdString));
	response.sendRedirect("Item.jsp?uid="+userIdString+"&id="+userDailyKeywordIdString);
%>