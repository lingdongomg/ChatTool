package qq;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Friends extends JFrame implements ActionListener, MouseListener {
	JPanel jp1, jp2;
	JLabel jl;
	JLabel[] jl2; // 标记好友信息
	String id;

	// 构造方法
	public Friends(final String id) {
		this.id = id;
		jl = new JLabel("我的好友");
		jp1 = new JPanel(new BorderLayout()); // 边框布局管理器
		jp2 = new JPanel(new GridLayout(5, 1)); // 网格布局管理器
		jl2 = new JLabel[5]; // 初始化好友

		String[] name = { "张三", "李四", "王五", "赵六", "孙七" };
		for (int i = 0; i < jl2.length; i++) {
			ImageIcon image = new ImageIcon("images/" + i + ".jpeg");
			image.setImage(image.getImage().getScaledInstance(100, 100, Image.SCALE_DEFAULT));
			jl2[i] = new JLabel(name[i], image, JLabel.LEFT);
			jl2[i].addMouseListener(this);
			// jphy2初始化5个好友
			jp2.add(jl2[i]);
		}
		jp1.add(jl, "North");
		jp1.add(jp2, "Center");

		// 加入JFrame
		add(jp1);

		// 设置窗体
		setTitle("QQ_" + id);
		setIconImage(new ImageIcon("images/qq.png").getImage());
		setSize(250, 600);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		// 相应用户点的事件
		if (e.getClickCount() == 1) {
			// 得到该好友的编号
			String friend = ((JLabel) e.getSource()).getText();
			Chat qqChat = new Chat(id, friend);
		}
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		JLabel jl = (JLabel) e.getSource();
		jl.setForeground(Color.red);
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		JLabel jl = (JLabel) e.getSource();
		jl.setForeground(Color.black);
	}
}
