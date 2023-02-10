package test;

import java.util.concurrent.Semaphore;

public class TheMain {
	private static BufferedArea buffer = new BufferedArea();
	private static Semaphore semaphore = new Semaphore(1);

	public static void main(String[] args) {
		Producer p = new Producer(semaphore, buffer);
		Comsumer c = new Comsumer(buffer);
		for (int i = 1; i < 10; i++) {
			Thread t = new Thread(p);
			t.start();
		}
		for (int j = 1; j < 4; j++) {
			Thread t = new Thread(c);
			t.start();
		}
	}

}
