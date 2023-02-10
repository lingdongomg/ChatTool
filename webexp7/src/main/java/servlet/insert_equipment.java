package servlet;

import java.io.IOException;
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
 * Servlet implementation class insert_equipment
 */
@WebServlet("/insert_equipment")
public class insert_equipment extends HttpServlet {
	DBUtil util = new DBUtil(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert_equipment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String sql="select * from application where applicationstate ='ÒÑÉóºË'";
	    PreparedStatement ps = util.createStatement(sql);
	    try {
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				String applicationid = rs.getString("applicationid");
				String sort = rs.getString("sort");
				String name = rs.getString("name");
				String deviceid = rs.getString("deviceid");
				String size = rs.getString("size");
				String number = rs.getString("number");
				String planuse = rs.getString("planuse");
				String academy = rs.getString("academy");
				String sql1 = "insert into equipments(sort,name,deviceid,size,number,devicestate,planuse,academy) values(?,?,?,?,?,?,?,?)";
				PreparedStatement ps1 = util.createStatement(sql1);
				 ps1.setString(1, sort);
				 ps1.setString(2, name);
				 ps1.setString(3, deviceid);
				 ps1.setString(4, size);
				 ps1.setString(5, number);
				 ps1.setString(6, "Î´¹ºÂò");
				 ps1.setString(7, planuse);
				 ps1.setString(8, academy);
				 ps1.executeUpdate();
				 String sql2 = "delete from application where applicationid=" + applicationid;
				 PreparedStatement ps2 = util.createStatement(sql2);
				 ps2.executeUpdate();
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    response.sendRedirect("examine.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
