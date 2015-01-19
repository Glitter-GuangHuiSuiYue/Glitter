<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily Keywords</title>
<script language='javascript'>
function buy(userId,userDailyKeywordId)
{
	window.location.href='BuyingUserDailyKeywords.jsp?uid='+userId + '&udkid='+userDailyKeywordId;
}
</script>
</head>
<body>
<br><br><br><br><br><br><br><br>
<div style="MARGIN-LEFT: 40%;">
<img height=150 src='glitter.png' border=0 />
<br>
<br>
<br>
<br>
<%
	String uidString = request.getParameter("uid");
	Long userId = Long.parseLong(uidString);
	String udkidString = request.getParameter("udkid");
	Long userDailyKeywordId = Long.parseLong(udkidString);
%>
<input type='button' id='buy' value='Want to see detail? Buy the keyword now!' onclick='buy(<%=userId %>,<%=userDailyKeywordId %>);'/>
<br>
</div> 
</body>
</html>