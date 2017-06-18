package com.sjz.entity;

import java.io.Serializable;
import java.util.Date;

public class Notice implements Serializable{
	private Integer notice_id;
	private String title;
	private String content;
	private String time;
	public Integer getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(Integer notice_id) {
		this.notice_id = notice_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Notice [notice_id=" + notice_id + ", title=" + title + ", content=" + content + ", time=" + time + "]";
	}
	
}
