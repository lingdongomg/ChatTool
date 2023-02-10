<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="webexp7.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/dongman.css">
<title>查看需购订单</title>
</head>
<body>
<center> 
	<ul class = "nav">	
		<li class="mouse"><a class="xuanzhong_1" href="index2.jsp">用户主页</a></li>
		<li class="xuanzhong"><a class="mouse_1" href="queryneed.jsp">查看需购订单</a></li>					
	</ul>
	<br>	<br>	<br>
	<h1 class = "head">请查看以下需购订单</h1>
	<br>	<br>
	<table border="2">
<tr>
	<th>设备序号</th>
	<th>设备类别</th>
	<th>设备名称</th>
	<th>设备编号</th>
	<th>设备规格</th>
	<th>设备数量</th>
</tr>
<%
	DBUtil util = new DBUtil(); 
	String sql="select * from equipments where devicestate ='未购买'";
    PreparedStatement ps = util.createStatement(sql);
    try {
		ResultSet rs = ps.executeQuery();
		session.setAttribute("rs", rs);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ResultSet rs = (ResultSet)session.getAttribute("rs");
	while (rs.next()){        
%>
<tr>
	<td><%=rs.getString("pid")%></td>
	<td><%=rs.getString("sort")%></td>
	<td><%=rs.getString("name")%></td>
	<td><%=rs.getString("deviceid")%></td>
	<td><%=rs.getString("size")%></td>
	<td><%=rs.getString("number")%></td>
</tr>
<%
	}
%>
</table>
<br><br>
<form method="get">
       请输入要购买的设备序号：<input type="text" name="goumai"><br><br>
        <input type="submit" value="提交">     <br><br>  
</form>

<%
	String goumai = request.getParameter("goumai");
	if (goumai!=null){
%><br>
	请输入您的购买信息<br>
	<form action="${pageContext.request.contextPath}/Update_equipment" method="get">
	<input type='hidden' name='pid' value="<%=goumai%>">
	请输入购买价格：<input type="text" name="price"><br>
	请输入购买日期：<input type="text" name="buydate"><br>
	请输入物品厂商：<input type="text" name="manufacturer"><br>
	输入物品保质期：<input type="text" name="lifetime"><br>
	输入购买者姓名：<input type="text" name="buyer"><br><br>
	<input type="submit" value="提交"><br>
	</form>
<%} %>
<center> 
</body>
</html>