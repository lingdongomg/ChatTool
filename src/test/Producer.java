package test;

import java.util.concurrent.Semaphore;

public class Producer implements Runnable {
	private BufferedArea buffer = null;
	public Semaphore semaphore = null;

	public Producer(Semaphore semaphore, BufferedArea buffer) {
		this.semaphore = semaphore;
		this.buffer = buffer;
	}

	public void run() {
		while (true) {
			try {
				this.semaphore.acquire();
				buffer.push("zhangsan,male");
				buffer.push("lisi,female");
				this.semaphore.release();
				Thread.sleep(1000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
