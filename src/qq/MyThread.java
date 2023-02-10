package qq;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class MyThread extends Thread {
	private DatagramSocket s;

	// 构造方法
	public MyThread(DatagramSocket socket) {
		this.s = socket;
	}

	public static final Object bytesToObject(byte[] bytes) throws IOException, ClassNotFoundException {
		ByteArrayInputStream in = new ByteArrayInputStream(bytes);
		ObjectInputStream oi = new ObjectInputStream(in);
		Object o = oi.readObject();
		oi.close();
		return o;
	}

	public void run() {
		while (true) {
			// 不停的读取从服务器发来的消息
			try {
				byte[] data = new byte[1024];
				DatagramPacket packet = new DatagramPacket(data, data.length);
				System.out.println("服务器端已经启动，等待客户端发送数据");
				s.receive(packet);
				Message m = (Message) bytesToObject(data);

				if (m.getMesType().equals("3")) {
					// 聊天信息
					// 从服务器获得的消息显示到相应的聊天界面
					Chat qqChat = new Chat(m.getGetter(), m.getSender());
					qqChat.showMessage(m);
				} else if (m.getMesType().equals("2")) {// 传输文件
					Chat qqChat = new Chat(m.getGetter(), m.getSender());
					File file = new File("File/" + m.getFile().getName());
					FileInputStream fis = new FileInputStream(m.getFile());
					FileOutputStream fos = new FileOutputStream(file);
					try {
						byte[] buf = new byte[1024];
						// 记录实际读取到的字节
						int n = 0;
						// 循环读取
						while ((n = fis.read(buf)) != -1) {
							// 输出到指定文件
							fos.write(buf);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					m.setContent(m.getFile().getName() + " 接收成功");
					qqChat.showMessage(m);
				} else if (m.getMesType().equals("1")) {
					// 上线通知
					Chat qqChat = new Chat(m.getGetter(), m.getSender());
					qqChat.showMessage(m);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
