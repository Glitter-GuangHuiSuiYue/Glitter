<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily Keywords</title>
<script language='javascript'>
function register(userName,birthday)
{
	if(event.keyCode == 13) {
		window.location.href='FastRegisterKeywords.jsp?userName='+userName+'&birthday='+birthday;
	}
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
UserName <input id='userName'/>
<br>
<br>
Birthday <input id='birthday' onkeyup='register(document.getElementById("userName").value,this.value);'/>
</div> 
</body>
</html>