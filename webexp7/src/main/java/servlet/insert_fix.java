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
 * Servlet implementation class insert_fix
 */
@WebServlet("/insert_fix")
public class insert_fix extends HttpServlet {
	private DBUtil util = new DBUtil(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert_fix() {
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
        String fixdate = request.getParameter("fixdate");
        String fixfactary = request.getParameter("fixfactary");
        String fixprice = request.getParameter("fixprice");
        String person = request.getParameter("person");
        String sort = request.getParameter("sort");
        
        String sql = "insert into fix(deviceid,name,sort,fixdate,fixfactary,fixprice,person)" +
                " values(?,?,?,?,?,?,?)";

        PreparedStatement ps = util.createStatement(sql);

	     try {
	         ps.setString(1, deviceid);
	         ps.setString(2, name);
	         ps.setString(3, sort);
	         ps.setString(4, fixdate);
	         ps.setString(5, fixfactary);
	         ps.setString(6, fixprice);
	         ps.setString(7, person);
	         ps.executeUpdate();
	     } catch (SQLException e) {
	         e.printStackTrace();
	     } finally{
	         util.close();
	     }    
	     out.println("µÇ¼Ç³É¹¦");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
