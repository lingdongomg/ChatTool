<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/register.css">
<title>注册</title>
</head>
<body>

	<div class="biaodan">
		<h1>管理系统用户注册</h1>
		<form action="${pageContext.request.contextPath}/Insert_user" method="get">
			<p>账号</p>
			<input type="text" name="Id" placeholder="请输入账号">
			<p>密码</p>
			<input type="text" name="Password" placeholder="请输入密码">	
			<p>单位</p>
			<input type="text" name="Department" placeholder="请输入单位">	
			<p>请选择您的身份</p>
			<select name="Work">
        		<option value="领导">领导</option>
        		<option value="实验室负责人">实验室负责人</option>
        		<option value="实验室使用者">实验室使用者</option>
        		<option value="实验设备采购者">实验设备采购者</option>
        	  </select><br>  <br>  
			<input type="submit" name="submit" value="确定注册" >
		</form>
	</div>



</body>
</html>