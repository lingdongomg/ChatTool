<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="webexp7.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/dongman.css">
<title>学期汇总表</title>
</head>
<body>
<center> 
	<ul class = "nav">	
		<li class="mouse"><a class="mouse_1" href="javascript:history.back(-1)">返回上一页</a></li>
		<li class="xuanzhong"><a class="xuanzhong_1" href="querytotal.jsp">学期汇总表</a></li>			
	</ul>
	<br>	<br>	<br>
	<h1 class = "head">学校各类物品消耗汇总表</h1>
	<br>	<br>
	<table border="2">
<tr>
	<th>设备序号</th>
	<th>设备类别</th>
	<th>设备名称</th>
	<th>设备编号</th>
	<th>设备规格</th>
	<th>消耗数量</th>
	<th>学院</th>	
</tr>
<%
	DBUtil util = new DBUtil(); 
	String sql="select * from equipments";
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
	<td><%=rs.getString("factuse")%></td>
	<td><%=rs.getString("academy")%></td>
</tr>
<%
	}
%>
</table>
	<br>	<br>	<br>
	<h1 class = "head">数计学院各类物品消耗汇总表</h1>
	<br>	<br>
	<table border="2">
<tr>
	<th>设备序号</th>
	<th>设备类别</th>
	<th>设备名称</th>
	<th>设备编号</th>
	<th>设备规格</th>
	<th>消耗数量</th>
	<th>学院</th>	
</tr>
<% 
	String sql2="select * from equipments where academy='数计学院'";
    PreparedStatement ps2 = util.createStatement(sql2);
    try {
		ResultSet rs2 = ps2.executeQuery();
		session.setAttribute("rs2", rs2);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ResultSet rs2 = (ResultSet)session.getAttribute("rs2");
	while (rs2.next()){        
%>
<tr>
	<td><%=rs2.getString("pid")%></td>
	<td><%=rs2.getString("sort")%></td>
	<td><%=rs2.getString("name")%></td>
	<td><%=rs2.getString("deviceid")%></td>
	<td><%=rs2.getString("size")%></td>
	<td><%=rs2.getString("factuse")%></td>
	<td><%=rs2.getString("academy")%></td>
</tr>
<%
	}
%>
</table>
	<br>	<br>	<br>
	<h1 class = "head">电气学院各类物品消耗汇总表</h1>
	<br>	<br>
	<table border="2">
<tr>
	<th>设备序号</th>
	<th>设备类别</th>
	<th>设备名称</th>
	<th>设备编号</th>
	<th>设备规格</th>
	<th>消耗数量</th>
	<th>学院</th>	
</tr>
<% 
	String sql3="select * from equipments where academy='电气学院'";
    PreparedStatement ps3 = util.createStatement(sql3);
    try {
		ResultSet rs3 = ps3.executeQuery();
		session.setAttribute("rs3", rs3);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ResultSet rs3 = (ResultSet)session.getAttribute("rs3");
	while (rs3.next()){        
%>
<tr>
	<td><%=rs3.getString("pid")%></td>
	<td><%=rs3.getString("sort")%></td>
	<td><%=rs3.getString("name")%></td>
	<td><%=rs3.getString("deviceid")%></td>
	<td><%=rs3.getString("size")%></td>
	<td><%=rs3.getString("factuse")%></td>
	<td><%=rs3.getString("academy")%></td>
</tr>
<%
	}
%>
</table>
	<br>	<br>	<br>
	<h1 class = "head">所有物品计划消耗与实际消耗对比分析表</h1>
	<br>	<br>
	<table border="2">
<tr>
	<th>设备序号</th>
	<th>设备类别</th>
	<th>设备名称</th>
	<th>设备编号</th>
	<th>设备规格</th>
	<th>计划消耗</th>
	<th>实际消耗</th>
	<th>学院</th>	
</tr>
<% 
	String sql4="select * from equipments";
    PreparedStatement ps4 = util.createStatement(sql4);
    try {
		ResultSet rs4 = ps4.executeQuery();
		session.setAttribute("rs4", rs4);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ResultSet rs4 = (ResultSet)session.getAttribute("rs4");
	while (rs4.next()){        
%>
<tr>
	<td><%=rs4.getString("pid")%></td>
	<td><%=rs4.getString("sort")%></td>
	<td><%=rs4.getString("name")%></td>
	<td><%=rs4.getString("deviceid")%></td>
	<td><%=rs4.getString("size")%></td>
	<td><%=rs4.getString("planuse")%></td>
	<td><%=rs4.getString("factuse")%></td>
	<td><%=rs4.getString("academy")%></td>
</tr>
<%
	}
%>
</table>
	<br>	<br>	<br>
	<h1 class = "head">数计学院物品计划消耗与实际消耗对比分析表</h1>
	<br>	<br>
	<table border="2">
<tr>
	<th>设备序号</th>
	<th>设备类别</th>
	<th>设备名称</th>
	<th>设备编号</th>
	<th>设备规格</th>
	<th>计划消耗</th>
	<th>实际消耗</th>
	<th>学院</th>	
</tr>
<% 
	String sql5="select * from equipments where academy='数计学院'";
    PreparedStatement ps5 = util.createStatement(sql5);
    try {
		ResultSet rs5 = ps5.executeQuery();
		session.setAttribute("rs5", rs5);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ResultSet rs5 = (ResultSet)session.getAttribute("rs5");
	while (rs5.next()){        
%>
<tr>
	<td><%=rs5.getString("pid")%></td>
	<td><%=rs5.getString("sort")%></td>
	<td><%=rs5.getString("name")%></td>
	<td><%=rs5.getString("deviceid")%></td>
	<td><%=rs5.getString("size")%></td>
	<td><%=rs5.getString("planuse")%></td>
	<td><%=rs5.getString("factuse")%></td>
	<td><%=rs5.getString("academy")%></td>
</tr>
<%
	}
%>
</table>
	<br>	<br>	<br>
	<h1 class = "head">电气学院物品计划消耗与实际消耗对比分析表</h1>
	<br>	<br>
	<table border="2">
<tr>
	<th>设备序号</th>
	<th>设备类别</th>
	<th>设备名称</th>
	<th>设备编号</th>
	<th>设备规格</th>
	<th>计划消耗</th>
	<th>实际消耗</th>
	<th>学院</th>	
</tr>
<% 
	String sql6="select * from equipments where academy='电气学院'";
    PreparedStatement ps6 = util.createStatement(sql6);
    try {
		ResultSet rs6 = ps6.executeQuery();
		session.setAttribute("rs6", rs6);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ResultSet rs6 = (ResultSet)session.getAttribute("rs6");
	while (rs6.next()){        
%>
<tr>
	<td><%=rs6.getString("pid")%></td>
	<td><%=rs6.getString("sort")%></td>
	<td><%=rs6.getString("name")%></td>
	<td><%=rs6.getString("deviceid")%></td>
	<td><%=rs6.getString("size")%></td>
	<td><%=rs6.getString("planuse")%></td>
	<td><%=rs6.getString("factuse")%></td>
	<td><%=rs6.getString("academy")%></td>
</tr>
<%
	}
%>
</table>
</body>
</html>