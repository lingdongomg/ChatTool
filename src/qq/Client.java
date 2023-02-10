package qq;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class Client {
	public void client(int port, Message message) throws IOException {
		// TODO Auto-generated method stub
		InetAddress address = InetAddress.getByName("127.0.0.1");
		DatagramSocket socket = new DatagramSocket();
		byte[] data = objectToBytes(message);// 将接收到的数据变成字节数组
		DatagramPacket packet = new DatagramPacket(data, data.length, address, port);
		socket.send(packet);
		socket.close();
	}

	public static final byte[] objectToBytes(Serializable s) throws IOException {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ObjectOutputStream ot = new ObjectOutputStream(out);
		ot.writeObject(s);
		ot.flush();
		ot.close();
		return out.toByteArray();
	}

}