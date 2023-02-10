package qq;

import java.io.File;
import java.io.Serializable;

public class Message implements Serializable {

	private String mesType; // 消息种类(1表示上线提醒，2表示传输文件，3表示发送消息)

	private String sender; // 发送者

	private String getter; // 接收者

	private String content; // 内容

	private File file;

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getGetter() {
		return getter;
	}

	public void setGetter(String getter) {
		this.getter = getter;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMesType() {
		return mesType;
	}

	public void setMesType(String mesType) {
		this.mesType = mesType;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
}
