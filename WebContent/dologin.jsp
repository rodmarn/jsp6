<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*,java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>登录成功</h1>
	<hr>
	<br>
	<br>
	<br>
	<%
	
		request.setCharacterEncoding("utf-8");
		//首先判断用户是否选择了记住登录状态
		String[] isUseCookies = request.getParameterValues("isUseCookie");
		if(isUseCookies!=null&&isUseCookies.length>0)
		{
			//把用户名和密码保存在Cookie对象里面
			//使用net包下的URLEncoder解决在Cookie当中无法保存中文字符串问题
			String username=URLEncoder.encode(request.getParameter("username"), "utf-8");
			String password=URLEncoder.encode(request.getParameter("password"), "utf-8");
			
			Cookie usernameCookie=new Cookie("username",username);
			Cookie passwordCookie=new Cookie("password",password);//创建两个cookie对象
			usernameCookie.setMaxAge(864000);
			passwordCookie.setMaxAge(864000);//设置cookie最大生存期限为10天
			response.addCookie(usernameCookie);
			response.addCookie(passwordCookie);//保存两个cookie对象
		}
		else{
			//判断之前是否有保存过cookie，若有则使其失效
			Cookie []cookies=request.getCookies();//先读取客户端保存的cookie数组
			if(cookies!=null&&cookies.length>0)
			{
				for(Cookie c:cookies)
				{
					if(c.getName().equals("username")||c.getName().equals("password"))
					{
						c.setMaxAge(0);//设置生存期限为0,使其失效
						response.addCookie(c);//重新保存
					}
				}
			}
		}
	%>
	<a href="users.jsp" target="_blank">查看用户信息</a>
</body>
</html>