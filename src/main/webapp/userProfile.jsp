<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="com.tinder.demo.Users" %>
	<%
		if(session.getAttribute("user")!=null){
	%>
			Hello, <% Users u = (Users)session.getAttribute("user"); %> <%= u.getName() %>!
			<img src="<%=u.getImgpath()%>" alt="profile img" height="100" weight="100">
			This is your profile page.
			
			<form action="/uploadFiles" method="post" enctype="multipart/form-data">
				<input type="file" name="files" /> <!-- multiple /><br> -->
				<input type="submit" /><br>
			</form>
	<%
		}else{
			response.sendRedirect("loginup.jsp");
		}
	%>
</body>
</html>