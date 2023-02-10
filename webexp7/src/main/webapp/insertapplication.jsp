<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/dongman.css">
<title>申请表</title>
</head>
<body>
<ul class = "nav">	
		<li class="mouse"><a class="xuanzhong_1" href="index1.jsp">用户主页</a></li>
		<li class="xuanzhong"><a class="mouse_1" href="insertapplication.jsp">提交购买申请</a></li>
		<li class="mouse"><a class="mouse_1" href="updataequipment.jsp">更新设备信息</a></li>
		<li class="mouse"><a class="mouse_1" href="queryequipment.jsp">实验设备查询</a></li>
		<li class="mouse"><a class="mouse_1" href="queryfixrejuect.jsp">故障报废查询</a></li>
		<li class="mouse"><a class="mouse_1" href="querytotal.jsp">学期汇总表</a></li>							
	</ul>
	<br>  <br>  <br>  
		<h1 class = "head">请输入申请信息</h1>
<br>  <br>  
<center> 	
<form action="${pageContext.request.contextPath}/Insert_application" method="get">
        <style type="text/css">      
			label
			{
				display: inline-block;
				width: 120px;
				text-align: justify;
				text-align-last: justify;
				margin-right: 10px;
				}				
        </style>
   
         <label>设备类别：</label><input type="text" name="Sort"><br>  
         <label>设备名称：</label><input type="text" name="Name"><br>  
         <label>设备编号：</label><input type="text" name="Deviceid"><br>  
         <label>设备规格：</label><input type="text" name="Size"><br>  
     	 <label>设备数量： </label><input type="text" name="Number"><br>  
         <label>计划使用数量：</label><input type="text" name="Planuse"><br>  
         <label>申请说明：</label><input type="text" name="Explains"><br>  
         <label>学院：</label><input type="text" name="Academy"><br>  <br>  
                                         
        <input type="submit" value="提交">     <br><br>  
</form>

</center> 
</body>
</html>