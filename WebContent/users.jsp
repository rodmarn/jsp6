<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>用户信息</h1>
	<hr>
	<%
		request.setCharacterEncoding("utf-8");
		String username="";
		String password="";
		Cookie []cookies=request.getCookies();//先读取客户端保存的cookie数组
		if(cookies!=null&&cookies.length>0)
		{
			for(Cookie c:cookies)
			{
				if(c.getName().equals("username"))
				{
					username=URLDecoder.decode(c.getValue(),"utf-8");//中文转码（解码）
				}
				if(c.getName().equals("password"))
				{
					password=URLDecoder.decode(c.getValue(),"utf-8");
				}
			}
		}
	%>
	<br>
	<br>
	<br>
	用户名：<%=username %><br>
	密码：<%=password %><br>
</body>
</html>