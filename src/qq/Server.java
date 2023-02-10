package qq;

import java.io.IOException;
import java.net.DatagramSocket;

public class Server {
	public void server(int port) throws IOException {
		// TODO Auto-generated method stub
		DatagramSocket socket = new DatagramSocket(port);
		MyThread thread = new MyThread(socket);
		thread.start();
	}
}