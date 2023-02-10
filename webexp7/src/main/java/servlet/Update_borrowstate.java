package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import webexp7.DBUtil;

/**
 * Servlet implementation class Update_borrowstate
 */
@WebServlet("/Update_borrowstate")
public class Update_borrowstate extends HttpServlet {
	private DBUtil util = new DBUtil(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_borrowstate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = utf-8");
		PrintWriter out = response.getWriter();
		String pid = request.getParameter("borrow");
		String pid2 = request.getParameter("give");
		if (pid2.equals("")) {
			String sql3="select * from equipments where pid="+pid;
			PreparedStatement ps3 = util.createStatement(sql3);
			try {
				ResultSet rs = ps3.executeQuery();	
				while (rs.next()) 
				{
					String borrowstate = rs.getString("borrowstate");  
					String number = rs.getString("number");  
					if (borrowstate.equals("借出中")){
						out.println("借出中，无法借用");
					}
					else if(borrowstate.equals("无法借用")) {
						out.println("设备损坏，无法借用");
					}
					else {
						String sql = "update equipments set borrowstate='借出中',factuse='"+number+"' where pid="+pid;
						PreparedStatement ps = util.createStatement(sql);
						ps.executeUpdate();
						out.println("借用成功");
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
       
		else if(pid.equals("")) {
			String sql3="select * from equipments where pid="+pid2;
			PreparedStatement ps3 = util.createStatement(sql3);
			try {
				ResultSet rs = ps3.executeQuery();	
				while (rs.next()) 
				{
					String borrowstate = rs.getString("borrowstate");  
					if (borrowstate.equals("借出中")){
						 String sql2 = "update equipments set borrowstate='未借出' where pid="+pid2;
						  PreparedStatement ps = util.createStatement(sql2);
						  ps.executeUpdate();
						  out.println("归还成功");
					}
					else {
						out.println("该设备无须归还");
					}
				}									
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			out.println("使用失败");
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
