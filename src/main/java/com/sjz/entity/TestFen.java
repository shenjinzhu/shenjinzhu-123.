package com.sjz.entity;

import java.io.Serializable;

public class TestFen implements Serializable{
	private Integer id;
	private String loginid;
	private String pwd;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "TestFen [id=" + id + ", loginid=" + loginid + ", pwd=" + pwd + "]";
	}
	
}
