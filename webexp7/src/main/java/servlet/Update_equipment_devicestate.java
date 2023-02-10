package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import webexp7.DBUtil;

/**
 * Servlet implementation class Update_equipment_devicestate
 */
@WebServlet("/Update_equipment_devicestate")
public class Update_equipment_devicestate extends HttpServlet {
	private DBUtil util = new DBUtil(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_equipment_devicestate() {
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
		String pid = request.getParameter("pid");
    	String devicestate = request.getParameter("devicestate");	
    	if(devicestate.equals("良好")) {
    		String sql = "update equipments set devicestate='"+devicestate+"',borrowstate='未借出' where pid="+pid;
            PreparedStatement ps = util.createStatement(sql);
    		try {		
    			ps.executeUpdate();
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		
    	}
    	else {
    		String sql = "update equipments set devicestate='"+devicestate+"',borrowstate='无法借用' where pid="+pid;
            PreparedStatement ps = util.createStatement(sql);
    		try {		
    			ps.executeUpdate();
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
    	out.println("更新成功");
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
