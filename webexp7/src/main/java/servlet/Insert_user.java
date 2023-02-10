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
 * Servlet implementation class Insert
 */
@WebServlet("/Insert_user")
public class Insert_user extends HttpServlet {
	private DBUtil util = new DBUtil(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert_user() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("Id");
        String password = request.getParameter("Password");
        String department = request.getParameter("Department");
        String work = request.getParameter("Work");
        String sql = "insert into users(id,password,department,work)" +
                " values(?,?,?,?)";

        PreparedStatement ps = util.createStatement(sql);

	     try {
	         ps.setString(1, id);
	         ps.setString(2, password);
	         ps.setString(3, department);
	         ps.setString(4, work);
	         ps.executeUpdate();
	     } catch (SQLException e) {
	         e.printStackTrace();
	     } finally{
	         util.close();
	     }    
	     response.sendRedirect("login.jsp");   
	 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
