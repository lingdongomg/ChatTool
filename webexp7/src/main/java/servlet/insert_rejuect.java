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
 * Servlet implementation class insert_rejuevt
 */
@WebServlet("/insert_rejuect")
public class insert_rejuect extends HttpServlet {
	private DBUtil util = new DBUtil(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert_rejuect() {
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
		String deviceid = request.getParameter("deviceid");
        String name = request.getParameter("name");
        String rejuectdate = request.getParameter("rejuectdate");
        String person = request.getParameter("person");
        String sort = request.getParameter("sort");
        String pid = request.getParameter("pid");

        String sql = "insert into rejuect(deviceid,name,sort,rejuectdate,person)" +
                " values(?,?,?,?,?)";
        
        String sql1="delete from equipments where pid=" + pid;
        PreparedStatement ps = util.createStatement(sql);
        PreparedStatement ps1 = util.createStatement(sql1);

	     try {
	         ps.setString(1, deviceid);
	         ps.setString(2, name);
	         ps.setString(3, sort);
	         ps.setString(4, rejuectdate);
	         ps.setString(5, person);
	         ps.executeUpdate();
	     	 ps1.executeUpdate();
	     } catch (SQLException e) {
	         e.printStackTrace();
	     } finally{
	         util.close();
	     }    
	     out.println("登记成功，且已将报废设备从设备表中移除");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
