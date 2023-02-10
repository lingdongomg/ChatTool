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
		<li class="mouse"><a class="mouse_1" href="javascript:history.back(-1)">返回上一页</a></li>
		<li class="xuanzhong"><a class="xuanzhong_1" href="queryequipment.jsp">实验设备查询</a></li>			
	</ul>
	<br>	<br>	<br>
	<h1 class = "head">以下为学校所有实验设备</h1>
	<br>	<br>
	<table border="2">
<tr>
	<th>设备序号</th>
	<th>设备类别</th>
	<th>设备名称</th>
	<th>设备编号</th>
	<th>设备规格</th>
	<th>设备数量</th>
	<th>购买日期</th>
	<th>保质期</th>
	<th>设备状态</th>
	<th>借出状态</th>
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
	<td><%=rs.getString("number")%></td>
	<td><%=rs.getString("buydate")%></td>
	<td><%=rs.getString("lifetime")%></td>
	<td><%=rs.getString("devicestate")%></td>
	<td><%=rs.getString("borrowstate")%></td>
	<td><%=rs.getString("academy")%></td>
</tr>
<%
	}
%>
</table>
<br><br>
	<h1 class = "head">以下可以选择指定学院查询</h1>
<form method="get">
请选择要查询的学院：
<select name="xueyuan">
   		<option value="数计学院">数计学院</option>
   		<option value="电气学院">电气学院</option>
</select>
      
        <input type="submit" value="提交">     <br><br>  
</form>

<%
	String xueyuan = request.getParameter("xueyuan");
	if (xueyuan!=null){
%>
	<table border="2">
<tr>
	<th>设备序号</th>
	<th>设备类别</th>
	<th>设备名称</th>
	<th>设备编号</th>
	<th>设备规格</th>
	<th>设备数量</th>
	<th>购买日期</th>
	<th>保质期</th>
	<th>设备状态</th>
	<th>借出状态</th>
	<th>学院</th>	
</tr>
<%
	DBUtil util2 = new DBUtil(); 
	String sql2="select * from equipments where academy = '"+xueyuan+"'";
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
	<td><%=rs2.getString("number")%></td>
	<td><%=rs2.getString("buydate")%></td>
	<td><%=rs2.getString("lifetime")%></td>
	<td><%=rs2.getString("devicestate")%></td>
	<td><%=rs2.getString("borrowstate")%></td>
	<td><%=rs2.getString("academy")%></td>
</tr>
<%
	}
} 
%>
</body>
</html>