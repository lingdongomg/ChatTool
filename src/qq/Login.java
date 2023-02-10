package qq;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class Login extends JFrame {
	private DBUtil util = new DBUtil();
	JPanel jp1, jp2, jp3;
	JLabel jl1, jl2;
	JButton jb1;
	JTextField jtf;
	JPasswordField jpf;

	public Login() {
		jp1 = new JPanel();
		jp2 = new JPanel();
		jp3 = new JPanel();

		jl1 = new JLabel("用户名");
		jl2 = new JLabel("密  码");
		jb1 = new JButton("登录");

		jtf = new JTextField(20);
		jpf = new JPasswordField(20);

		jb1.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				int right = 0;
				String id = jtf.getText();
				String password = new String(jpf.getPassword());
				String sql = "select * from qquser where id=? and password=?";
				PreparedStatement ps = util.createStatement(sql);
				ResultSet rs = null;
				try {
					ps.setString(1, id);
					ps.setString(2, password);
					rs = ps.executeQuery();
					while (rs.next()) {
						right = 1;
						System.out.println("登录成功");
					}
				} catch (SQLException e1) {
					e1.printStackTrace();
				} finally {
					util.close(rs);
				}

				if (right == 1) {
					try {
						Friends qqlist = new Friends(jtf.getText());
						Server server = new Server();
						int port = getport(id);
//						server.inform(port);
						server.server(port);

					} catch (Exception e1) {
						e1.printStackTrace();
					}
					dispose();
				} else {
					System.out.println("用户名或密码错误");
				}
			}
		});

		setLayout(new GridLayout(3, 1));

		jp1.add(jl1);
		jp1.add(jtf);
		jp2.add(jl2);
		jp2.add(jpf);
		jp3.add(jb1);

		add(jp1);
		add(jp2);
		add(jp3);

		setTitle("登录界面");
		setSize(300, 150);
		setLocationRelativeTo(null);
		setIconImage(new ImageIcon("images/qq.png").getImage());
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}

	public int getport(String friendId) {
		int port = 0;
		if (friendId.equals("张三")) {
			port = 9000;
		} else if (friendId.equals("李四")) {
			port = 9001;
		} else if (friendId.equals("王五")) {
			port = 9002;
		} else if (friendId.equals("赵六")) {
			port = 9003;
		} else if (friendId.equals("孙七")) {
			port = 9004;
		}
		return port;
	}

	public static void main(String[] args) {
		Login login = new Login();
	}
}
