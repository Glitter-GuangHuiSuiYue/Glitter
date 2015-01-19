<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="Head.jsp" %>
<br>
<br>
<div style="MARGIN-LEFT: 15%;">
<div style="MARGIN-LEFT: 0%;width:1000px;">
<h2>What's new</h2>
<hr/>
</div>
<textarea id = 'detail' style="height:100px; width:995px;" >
</textarea>
<div style="MARGIN-RIGHT: 100%;width:1000px;" align="right">
<br>
<button name = 'add' onclick = "javascript:newGlitter(<%=userId %>);" style="height:40px; width:100px;" >
Publish
</button>
</div>
</div>