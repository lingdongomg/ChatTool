package qq;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class Chat extends JFrame implements ActionListener {

	JTextArea jta; // 多行文本域
	JTextField jtf; // 单行文本框
	JButton jb, jb2;
	JPanel jp;
	JFileChooser fc; // 文件选择器

	private String Id;
	private String friendId;

	public void showMessage(Message m) {
		String info = null;
		if (m.getMesType().equals("2")) {
			info = "文件： " + m.getFile().getName() + " 接受成功\r\n";
		} else if (m.getMesType().equals("1")) {
			info = "系统提示：您的好友" + m.getSender() + "上线了\r\n";
		} else {
			info = m.getSender() + "对" + m.getGetter() + "说：" + m.getContent() + "\r\n";
		}
		jta.append(info);
	}

	public Chat(final String Id, final String friendId) {
		this.Id = Id;
		this.friendId = friendId;
		jta = new JTextArea();
		jtf = new JTextField(20);

		jb = new JButton("发送");
		jb2 = new JButton("文件");
		fc = new JFileChooser();
		jb2.addActionListener(this);
		jp = new JPanel();
		jb.addActionListener(this);

		jp.add(jb2);
		jp.add(jtf);
		jp.add(jb);

		add(jta, "Center");
		add(jp, "South");
		setIconImage(new ImageIcon("images/qq.png").getImage());
		setTitle(Id + "和" + friendId + "聊天");
		setSize(400, 300);
		setLocationRelativeTo(null);
		setVisible(true);
//        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == jb) {// 发送消息
			Message m = new Message();
			m.setSender(this.Id);
			m.setGetter(this.friendId);
			m.setContent(jtf.getText());
			m.setMesType("3");
			String info = m.getSender() + "对" + m.getGetter() + "说：" + m.getContent() + "\r\n";
			jta.append(info);
			jtf.setText("");
			try {
				Client a = new Client();
				a.client(getport(this.friendId), m);
			} catch (NumberFormatException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} else if (e.getSource() == jb2) {// 文件传输功能
			int select = fc.showOpenDialog(null);
			if (select == JFileChooser.APPROVE_OPTION) {// 选择的是否为确认
				File file = fc.getSelectedFile();
				System.out.println("文件" + file.getName() + " 被打开");
				Message m = new Message();
				m.setSender(this.Id);
				m.setGetter(this.friendId);
				m.setMesType("2");
				m.setFile(file);
				String info = m.getSender() + " 给 " + m.getGetter() + "传输文件： " + file.getName() + "\r\n";
				jta.append(info);
				jtf.setText("");
				try {
					Client a = new Client();
					a.client(getport(this.friendId), m);
				} catch (NumberFormatException | IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		}
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
}
