<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="keyword.bean.*"%>
<%@page import="keyword.service.*"%>
<%@page import="keyword.bean.*"%>
<%@page import="keyword.service.*"%>
<jsp:useBean id="userDao" scope="session" class="keyword.dao.UserDao" />
<jsp:useBean id="userService" scope="session" class="keyword.service.UserService" />

<%
	userService.setDao(userDao);
	String userName = request.getParameter("userName");
	String birthdayString = request.getParameter("birthday");
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date birthday = formatter.parse(birthdayString);
	Long userId = userService.createUser(userName, birthday);
	int birthYear = birthday.getYear()+1900;
	int birthMonth = birthday.getMonth()+1;
	int birthDate = birthday.getDate();
	response.sendRedirect("AnnualKeywords.jsp?uid="+userId+"&birthYear="+birthYear+"&birthMonth="+birthMonth+"&birthDate="+birthDate);
%>