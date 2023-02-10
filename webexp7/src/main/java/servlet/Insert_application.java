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
 * Servlet implementation class Insert_application
 */
@WebServlet("/Insert_application")
public class Insert_application extends HttpServlet {
	private DBUtil util = new DBUtil(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert_application() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = utf-8");
		PrintWriter out = response.getWriter();
    	String sort = request.getParameter("Sort");
        String name = request.getParameter("Name");
        String deviceid = request.getParameter("Deviceid");
        String size = request.getParameter("Size");
        String number = request.getParameter("Number");
        String planuse = request.getParameter("Planuse");
        String explains = request.getParameter("Explains");
        String academy = request.getParameter("Academy");
        
        String sql = "insert into application(sort,name,deviceid,size,number,planuse,explains,academy,applicationstate)" +
                " values(?,?,?,?,?,?,?,?,?)";

        PreparedStatement ps = util.createStatement(sql);

	     try {
	         ps.setString(1, sort);
	         ps.setString(2, name);
	         ps.setString(3, deviceid);
	         ps.setString(4, size);
	         ps.setString(5, number);
	         ps.setString(6, planuse);
	         ps.setString(7, explains);
	         ps.setString(8, academy);
	         ps.setString(9, "Œ¥…Û∫À");
	         ps.executeUpdate();
	     } catch (SQLException e) {
	         e.printStackTrace();
	     } finally{
	         util.close();
	     }    
	     out.println("…Í«Î≥…π¶");
	 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
