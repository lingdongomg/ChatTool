<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="webexp7.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/dongman.css">
<title>主账务文件</title>
</head>
<body>
<center> 
	<ul class = "nav">	
		<li class="mouse"><a class="mouse_1" href="index.jsp">用户主页</a></li>
		<li class="mouse"><a class="mouse_1" href="examine.jsp">审核购买申请</a></li>
		<li class="mouse"><a class="mouse_1" href="queryequipment.jsp">实验设备查询</a></li>
		<li class="mouse"><a class="mouse_1" href="queryfixrejuect.jsp">故障报废查询</a></li>
		<li class="xuanzhong"><a class="xuanzhong_1" href="money.jsp">主账务文件</a></li>
		<li class="mouse"><a class="mouse_1" href="querytotal.jsp">学期汇总表</a></li>							
	</ul>
	<br>	<br>	<br>
	<h1 class = "head">以下为学校主账务文件</h1>
	<br>	<br>
	固定资产表<br>	<br>
	<table border="2">
<tr>
	<th>设备序号</th>
	<th>设备类别</th>
	<th>设备名称</th>
	<th>设备编号</th>
	<th>设备单价</th>
	<th>设备数量</th>
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
	double money = 0;
	double money_shuji = 0;
	double money_dianqi = 0;
	while (rs.next()){
	if(rs.getString("price")!=null){
	money += Double.parseDouble(rs.getString("price"))*Double.parseDouble(rs.getString("number"));
%>
<tr>
	<td><%=rs.getString("pid")%></td>
	<td><%=rs.getString("sort")%></td>
	<td><%=rs.getString("name")%></td>
	<td><%=rs.getString("deviceid")%></td>
	<td><%=rs.getString("price")%></td>
	<td><%=rs.getString("number")%></td>
	<td><%=rs.getString("academy")%></td>
</tr>
<%
	if(rs.getString("academy").equals("数计学院")){
		money_shuji += Double.parseDouble(rs.getString("price"))*Double.parseDouble(rs.getString("number"));
	}
	else if (rs.getString("academy").equals("电气学院")){
		money_dianqi += Double.parseDouble(rs.getString("price"))*Double.parseDouble(rs.getString("number"));
	}
	}
	}
%>
</table>
	<br>	<br>	
	维修费用表<br>	<br>
		<table border="2">
<tr>
	<th>维修序号</th>
	<th>设备编号</th>
	<th>设备名称</th>
	<th>维修耗费</th>
</tr>
<%
	String sql2="select * from fix";
    PreparedStatement ps2 = util.createStatement(sql2);
    try {
		ResultSet rs2 = ps2.executeQuery();
		session.setAttribute("rs2", rs2);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ResultSet rs2 = (ResultSet)session.getAttribute("rs2");
	double money2 = 0;	
	while (rs2.next()){        
		money2 += Double.parseDouble(rs2.getString("fixprice"));
%>
<tr>
	<td><%=rs2.getString("fixid")%></td>
	<td><%=rs2.getString("deviceid")%></td>
	<td><%=rs2.getString("name")%></td>
	<td><%=rs2.getString("fixprice")%></td>
</tr>
<%
	}
%>
</table>

<br><br>
	<h1 class = "head">以下为耗费总金额</h1><br><br>

<%
	out.println("学校耗费的总金额为："+(money+money2)+"<br><br>");
	out.println("数计学院耗费的金额为："+(money_shuji+money2)+"<br><br>");
	out.println("电气学院耗费的金额为："+(money_dianqi)+"<br><br>");

	
%>


</body>
</html>