<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="css/dongman.css">
	<title>主页</title>
</head>
	
<body>
	<ul class = "nav">	
		<li class="mouse"><a class="mouse_1" href="index3.jsp">用户主页</a></li>
		<li class="mouse"><a class="mouse_1" href="queryequipment.jsp">实验设备查询</a></li>
		<li class="xuanzhong"><a class="xuanzhong_1" href="borrowequipment.jsp">使用设备</a></li>							
	</ul>
	<br>	<br>	<br>
	<h1 class = "head">请输入要借用/归还的设备编号</h1>


<center> 

	<form action="${pageContext.request.contextPath}/Update_borrowstate" method="get">
       请输入要借用的设备序号：<input type="text" name="borrow"><br><br>
        <input type="submit" value="提交">     <br><br><br><br>    
       请输入要归还的设备序号：<input type="text" name="give"><br><br>
        <input type="submit" value="提交">     <br><br>  
	</form>
	
	
</center>


	
</body>
</html>
	