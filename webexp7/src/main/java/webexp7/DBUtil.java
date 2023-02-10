package webexp7;
import java.sql.*;
public class DBUtil {
   PreparedStatement ps= null;
   Connection con = null;
   static{
       try {
           Class.forName("com.mysql.cj.jdbc.Driver");
       } catch (ClassNotFoundException e) {
           e.printStackTrace();
       }
   }
   
   public Connection getCon(){
       try {
           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/equipment","root","");
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return con;
   }

   public  PreparedStatement createStatement(String sql){
       try {
           ps =  getCon().prepareStatement(sql);
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return ps;
   }
   
   public void close(){
       if(ps!=null){
           try {
               ps.close();
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }

       if(con!=null){
           try {
               con.close();
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }

   }

   public  void close(ResultSet rs){
       if(rs!=null){
           try {
               rs.close();
           } catch (SQLException e) {
               e.printStackTrace();
           }
       }
       close();
   }
}
