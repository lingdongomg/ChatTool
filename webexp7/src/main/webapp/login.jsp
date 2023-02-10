<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/index.css">
<title>首页</title>
</head>

<body>
	<div class="biaodan">
		<h1>实验设备管理系统</h1>
		<form action="${pageContext.request.contextPath}/Login" method="get">
			<p>用户名</p>
			<input type="text" name="Id" placeholder="请输入用户名">
			<p>密码</p>
			<input type="password" name="Password" placeholder="请输入密码">	
			<input type="submit" name="submit" value="登录" >
			<a href="register.jsp">注册</a>
		</form>
	</div>

</body>
</html>
