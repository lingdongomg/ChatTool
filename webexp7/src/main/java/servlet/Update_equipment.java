package servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import webexp7.DBUtil;

/**
 * Servlet implementation class Update_equipment
 */
@WebServlet("/Update_equipment")
public class Update_equipment extends HttpServlet {
	private DBUtil util = new DBUtil(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_equipment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pid = request.getParameter("pid");
    	String price = request.getParameter("price");	
    	String buydate = request.getParameter("buydate");	
    	String manufacturer = request.getParameter("manufacturer");	
    	String lifetime  = request.getParameter("lifetime");
    	String buyer  = request.getParameter("buyer");	
        String sql = "update equipments set price='"+price+"',buydate='"+buydate+"',manufacturer='"+manufacturer+"',lifetime='"+lifetime+"',buyer='"+buyer+"',devicestate='Œ¥ΩË”√'  where pid="+pid;
        PreparedStatement ps = util.createStatement(sql);
		try {		
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		response.sendRedirect("index2.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
