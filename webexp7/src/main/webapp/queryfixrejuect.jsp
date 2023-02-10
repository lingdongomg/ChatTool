<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="webexp7.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/dongman.css">
<title>查询修理、报废记录</title>
</head>
<body>
<center> 
	<ul class = "nav">	
		<li class="mouse"><a class="mouse_1" href="javascript:history.back(-1)">返回上一页</a></li>
		<li class="xuanzhong"><a class="xuanzhong_1" href="queryfixrejuect.jsp">故障报废查询</a></li>			
	</ul>
	<br>	<br>	<br>
	<h1 class = "head">以下为修理记录</h1>
	<br>	<br>
	<table border="2">
<tr>
	<th>修理序号</th>
	<th>设备编号</th>
	<th>设备名称</th>
	<th>设备类别</th>
	<th>修理日期</th>
	<th>修理工厂</th>
	<th>修理价格</th>
	<th>负责人</th>
</tr>
<%
	DBUtil util = new DBUtil(); 
	String sql="select * from fix";
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
	<td><%=rs.getString("fixid")%></td>
	<td><%=rs.getString("deviceid")%></td>
	<td><%=rs.getString("name")%></td>
	<td><%=rs.getString("sort")%></td>
	<td><%=rs.getString("fixdate")%></td>
	<td><%=rs.getString("fixfactary")%></td>
	<td><%=rs.getString("fixprice")%></td>
	<td><%=rs.getString("person")%></td>
</tr>
<%
	}
%>
</table>
<br>	<br>
	<h1 class = "head">以下为报废记录</h1>
	<br>	<br>
	<table border="2">
<tr>
	<th>报废序号</th>
	<th>设备编号</th>
	<th>设备名称</th>
	<th>设备类别</th>
	<th>报废日期</th>
	<th>负责人</th>
</tr>
<%
	String sql2="select * from rejuect";
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
	<td><%=rs2.getString("rejectid")%></td>
	<td><%=rs2.getString("deviceid")%></td>
	<td><%=rs2.getString("name")%></td>
	<td><%=rs2.getString("sort")%></td>
	<td><%=rs2.getString("rejuectdate")%></td>
	<td><%=rs2.getString("person")%></td>
</tr>
<%
	}
%>
</table>

<br><br>
	<h1 class = "head">以下可以选择指定类型查询修理表</h1><br>  
<form method="get">
请输入要查询的类型：
      <input type="text" name="sort"> <br><br>
        <input type="submit" value="提交">     <br><br>  
</form>

<%
	String sort = request.getParameter("sort");
	if (sort!=null){
%>
	<table border="2">
<tr>
	<th>修理序号</th>
	<th>设备编号</th>
	<th>设备名称</th>
	<th>设备类别</th>
	<th>修理日期</th>
	<th>修理工厂</th>
	<th>修理价格</th>
	<th>负责人</th>
</tr>
<%
	String sql3="select * from fix where sort = '"+sort+"'";
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
	<td><%=rs3.getString("fixid")%></td>
	<td><%=rs3.getString("deviceid")%></td>
	<td><%=rs3.getString("name")%></td>
	<td><%=rs3.getString("sort")%></td>
	<td><%=rs3.getString("fixdate")%></td>
	<td><%=rs3.getString("fixfactary")%></td>
	<td><%=rs3.getString("fixprice")%></td>
	<td><%=rs3.getString("person")%></td>
</tr>
<%
	}
} 
%>
</table>
<br><br>
	<h1 class = "head">以下可以选择指定时间段查询修理表</h1><br>  
<form method="get">
	请输入要起始时间段：
      <input type="text" name="start"> <br><br>
 	请输入要起始时间段：
 	  <input type="text" name="end"> <br><br>
      <input type="submit" value="提交">     <br><br>  
</form>

<%
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	if (start!=null && end!=null){
%>
	<table border="2">
<tr>
	<th>修理序号</th>
	<th>设备编号</th>
	<th>设备名称</th>
	<th>设备类别</th>
	<th>修理日期</th>
	<th>修理工厂</th>
	<th>修理价格</th>
	<th>负责人</th>
</tr>
<%
	String sql4="select * from fix where fixdate between '"+start+"' and '"+end+"'";
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
	<td><%=rs4.getString("fixid")%></td>
	<td><%=rs4.getString("deviceid")%></td>
	<td><%=rs4.getString("name")%></td>
	<td><%=rs4.getString("sort")%></td>
	<td><%=rs4.getString("fixdate")%></td>
	<td><%=rs4.getString("fixfactary")%></td>
	<td><%=rs4.getString("fixprice")%></td>
	<td><%=rs4.getString("person")%></td>
</tr>
<%
	}
} 
%>
</table>
<br><br>
	<h1 class = "head">以下可以选择指定类型查询报废表</h1><br>  
<form method="get">
请输入要查询的类型：
      <input type="text" name="sort2"> <br><br>
        <input type="submit" value="提交">     <br><br>  
</form>

<%
	String sort2 = request.getParameter("sort2");
	if (sort2!=null){
%>
	<table border="2">
<tr>
	<th>报废序号</th>
	<th>设备编号</th>
	<th>设备名称</th>
	<th>设备类别</th>
	<th>报废日期</th>
	<th>负责人</th>
</tr>
<%
	String sql5="select * from rejuect where sort = '"+sort2+"'";
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
	<td><%=rs5.getString("rejectid")%></td>
	<td><%=rs5.getString("deviceid")%></td>
	<td><%=rs5.getString("name")%></td>
	<td><%=rs5.getString("sort")%></td>
	<td><%=rs5.getString("rejuectdate")%></td>
	<td><%=rs5.getString("person")%></td>
</tr>
<%
	}
} 
%>
</table>
<br><br>
	<h1 class = "head">以下可以选择指定时间段查询报废表</h1><br>  
<form method="get">
	请输入要起始时间段：
      <input type="text" name="start2"> <br><br>
 	请输入要起始时间段：
 	  <input type="text" name="end2"> <br><br>
      <input type="submit" value="提交">     <br><br>  
</form>

<%
	String start2 = request.getParameter("start2");
	String end2 = request.getParameter("end2");
	if (start2!=null && end2!=null){
%>
	<table border="2">
<tr>
	<th>报废序号</th>
	<th>设备编号</th>
	<th>设备名称</th>
	<th>设备类别</th>
	<th>报废日期</th>
	<th>负责人</th>
</tr>
<%
	String sql6="select * from rejuect where rejuectdate between '"+start2+"' and '"+end2+"'";
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
	<td><%=rs6.getString("rejectid")%></td>
	<td><%=rs6.getString("deviceid")%></td>
	<td><%=rs6.getString("name")%></td>
	<td><%=rs6.getString("sort")%></td>
	<td><%=rs6.getString("rejuectdate")%></td>
	<td><%=rs6.getString("person")%></td>
</tr>
<%
	}
} 
%>

</table>
</body>
</html>