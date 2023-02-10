<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="webexp7.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/dongman.css">
<title>审核购买申请</title>
</head>
<body>
<center> 
	<ul class = "nav">	
		<li class="mouse"><a class="xuanzhong_1" href="index.jsp">用户主页</a></li>
		<li class="xuanzhong"><a class="mouse_1" href="examine.jsp">审核购买申请</a></li>
		<li class="mouse"><a class="mouse_1" href="queryequipment.jsp">实验设备查询</a></li>
		<li class="mouse"><a class="mouse_1" href="queryfixrejuect.jsp">故障报废查询</a></li>
		<li class="mouse"><a class="mouse_1" href="money.jsp">主账务文件</a></li>
		<li class="mouse"><a class="mouse_1" href="querytotal.jsp">学期汇总表</a></li>							
	</ul>
	<br>	<br>	<br>
	<h1 class = "head">请审核下列购买申请</h1>
	<br>	<br>
	<table border="2">
<tr>
	<th>申请编号</th>
	<th>设备类别</th>
	<th>设备名称</th>
	<th>设备编号</th>
	<th>设备规格</th>
	<th>设备数量</th>
	<th>计划使用数量</th>
	<th>申请说明</th>
	<th>学院</th>
</tr>
<%
	DBUtil util = new DBUtil(); 
	String sql="select * from application where applicationstate ='未审核'";
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
	<td><%=rs.getString("applicationid")%></td>
	<td><%=rs.getString("sort")%></td>
	<td><%=rs.getString("name")%></td>
	<td><%=rs.getString("deviceid")%></td>
	<td><%=rs.getString("size")%></td>
	<td><%=rs.getString("number")%></td>
	<td><%=rs.getString("planuse")%></td>
	<td><%=rs.getString("explains")%></td>
	<td><%=rs.getString("academy")%></td>
</tr>
<%
	}
%>
</table>
<br><br>
<form action="${pageContext.request.contextPath}/Update_application" method="get">
       请输入要批准的申请编号：<input type="text" name="pizhun"><br><br>
        <input type="submit" value="提交">     <br><br>  
</form>
</center>
</body>
</html>