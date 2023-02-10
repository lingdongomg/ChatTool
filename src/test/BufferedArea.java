package test;

public class BufferedArea {
	private String[] total;
	public static int count = 0;

	public BufferedArea() {
		this.total = new String[1000];
	}

	// 缓冲区放入
	public void push(String x) {
		System.out.println("生产者放入：" + x);
		total[count] = x;
		count++;
	}

	// 缓冲区取出
	public String poll() {
		count--;
		String x = total[count];
		System.out.println("消费者取出：" + x);
		total[count] = null;
		return x;
	}
}
