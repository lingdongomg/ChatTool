<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="webexp7.DBUtil" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="css/dongman.css">
	<title>更新实验设备</title>
</head>
	
<body>
	<ul class = "nav">	
		<li class="mouse"><a class="mouse_1" href="index1.jsp">用户主页</a></li>
		<li class="mouse"><a class="mouse_1" href="insertapplication.jsp">提交购买申请</a></li>
		<li class="xuanzhong"><a class="xuanzhong_1" href="updataequipment.jsp">更新设备信息</a></li>
		<li class="mouse"><a class="mouse_1" href="queryequipment.jsp">实验设备查询</a></li>
		<li class="mouse"><a class="mouse_1" href="queryfixrejuect.jsp">报废故障查询</a></li>
		<li class="mouse"><a class="mouse_1" href="querytotal.jsp">学期汇总表</a></li>							
	</ul>
	<br>	<br>	<br>
	<h1 class = "head">以下可以更新设备的状态</h1>

<center>
<form action="${pageContext.request.contextPath}/Update_equipment_devicestate" method="get">
请输入要更新设备的序号： <input type="test" name="pid"> <br> <br>
请选择更新后该设备的状态：
<select name="devicestate">
   		<option value="良好">良好</option>
   		<option value="损坏">损坏</option>
   		<option value="报废">报废</option>
</select>
       <br> <br>
        <input type="submit" value="提交">     <br><br><br>  
</form>
	<h1 class = "head">以下设备可以进行损坏维修登记</h1>
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
String sql="select * from equipments where devicestate ='损坏'";
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
</table><br><br> 

<form action="${pageContext.request.contextPath}/insert_fix" method="get">
请输入损坏设备设备编号： <input type="test" name="deviceid"> <br>
请输入损坏设备设备名称： <input type="test" name="name"> <br>
请输入损坏设备设备类型： <input type="test" name="sort"> <br>
请输入损坏设备修理日期： <input type="test" name="fixdate"> <br>
请输入损坏设备修理厂家： <input type="test" name="fixfactary"> <br>
请输入损坏设备修理价格： <input type="test" name="fixprice"> <br>
请输入损坏设备的责任人： <input type="test" name="person"> <br><br> 
        <input type="submit" value="提交">     <br><br><br> 
</form>
	<h1 class = "head">以下设备可以进行报废处理登记</h1>
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
String sql2="select * from equipments where devicestate ='报废'";
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
</tr>
<%
}
%>
</table><br><br> 
<form action="${pageContext.request.contextPath}/insert_rejuect" method="get">
请输入报废设备设备序号： <input type="test" name="pid"> <br>
请输入报废设备设备编号： <input type="test" name="deviceid"> <br>
请输入报废设备设备名称： <input type="test" name="name"> <br>
请输入损坏设备设备类型： <input type="test" name="sort"> <br>
请输入报废设备处理日期： <input type="test" name="rejuectdate"> <br>
请输入报废设备的责任人： <input type="test" name="person"> <br><br>
        <input type="submit" value="提交">     <br><br><br> 
</form>
</center>


	
</body>
</html>
	