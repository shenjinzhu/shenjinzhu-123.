package com.sjz.entity;

import java.io.Serializable;

public class Mesg implements Serializable{
	
	private String msg;
	private String title;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "Mesg [msg=" + msg + ", title=" + title + "]";
	}
	

}
