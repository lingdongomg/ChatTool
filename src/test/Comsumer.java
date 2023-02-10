package test;

public class Comsumer implements Runnable {
	private BufferedArea buffer = null;

	public Comsumer(BufferedArea buffer) {
		this.buffer = buffer;
	}

	public void run() {
		while (true) {
			try {
				if (BufferedArea.count == 0) {

				} else {
					buffer.poll();
					Thread.sleep(100);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
