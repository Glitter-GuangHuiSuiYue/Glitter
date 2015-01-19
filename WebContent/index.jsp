<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily Keywords</title>
<script language='javascript'>
function login(name)
{
	if(event.keyCode == 13) {
		window.location.href='EnterKeywords.jsp?userName='+name;
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
User Name <input id='userName' onkeyup='login(this.value);'/>
<br>
<br>
<a href="RegisterKeywords.jsp">No Glitter Account? Register Now!</a>
</div> 
</body>
</html>