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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private DBUtil util = new DBUtil(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
        String id = request.getParameter("Id");
        String password = request.getParameter("Password");
        
        String sql="select * from users where id=? and password=?";

        PreparedStatement ps = util.createStatement(sql);
        ResultSet rs = null;
        int result = 0;
        String work = "";
        try {
            ps.setString(1, id);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while(rs.next()){
               work = rs.getString("work");
               System.out.println(work);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            util.close(rs);
        }
       //4.������Ӧ���󣬸�����֤�������ͬ��Դ�ļ���ַд�뵽��Ӧͷ�����������
     
    	if(work.equals("�쵼")) {
        response.sendRedirect("index.jsp");
        }
    	else if(work.equals("ʵ���Ҹ�����")) {
            response.sendRedirect("index1.jsp");
            }
    	else if(work.equals("ʵ���豸�ɹ���")) {
            response.sendRedirect("index2.jsp");
            }
    	else if(work.equals("ʵ����ʹ����")) {
            response.sendRedirect("index3.jsp");
            
        }else{
           out.println("������������������");
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
