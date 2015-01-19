<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<%@page import="keyword.bean.*"%>
<%@page import="keyword.service.*"%>
<%@page import="keyword.bean.*"%>
<%@page import="keyword.service.*"%>
<jsp:useBean id="userDao" scope="session" class="keyword.dao.UserDao" />
<jsp:useBean id="userService" scope="session" class="keyword.service.UserService" />
<%
	userService.setDao(userDao);
	String userName = request.getParameter("userName");
	session.setAttribute("userName", userName);
	User user = userService.selectUserByUserName(userName);
	Long uid = user.getId();
	session.setAttribute("userId", uid);
	Date birthday = user.getBirthday();
	int birthYear = birthday.getYear()+1900;
	session.setAttribute("birthYear", birthYear);
	int birthMonth = birthday.getMonth()+1;
	session.setAttribute("birthMonth", birthMonth);
	int birthDate = birthday.getDate();
	session.setAttribute("birthDate", birthDate);
	response.sendRedirect("AnnualKeywords.jsp?uid="+uid+"&birthYear="+birthYear+"&birthMonth="+birthMonth+"&birthDate="+birthDate);
%>