package com.sjz.entity;

import java.io.Serializable;

public class Medical implements Serializable{
	
	private Integer medical_id;
	private String mname;
	private String ename;
	/*特性*/
	private String mcharacteristic;
	private String mfunction;
	private String side_effect;
	private String mGrowth_envir;
	private String source;
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getMcharacteristic() {
		return mcharacteristic;
	}
	public void setMcharacteristic(String mcharacteristic) {
		this.mcharacteristic = mcharacteristic;
	}
	public String getMfunction() {
		return mfunction;
	}
	public void setMfunction(String mfunction) {
		this.mfunction = mfunction;
	}
	public String getSide_effect() {
		return side_effect;
	}
	public void setSide_effect(String side_effect) {
		this.side_effect = side_effect;
	}
	public String getmGrowth_envir() {
		return mGrowth_envir;
	}
	public void setmGrowth_envir(String mGrowth_envir) {
		this.mGrowth_envir = mGrowth_envir;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public Integer getMedical_id() {
		return medical_id;
	}
	public void setMedical_id(Integer medical_id) {
		this.medical_id = medical_id;
	}
	@Override
	public String toString() {
		return "Medical [medical_id=" + medical_id + ", mname=" + mname + ", ename=" + ename + ", mcharacteristic="
				+ mcharacteristic + ", mfunction=" + mfunction + ", side_effect=" + side_effect + ", mGrowth_envir="
				+ mGrowth_envir + ", source=" + source + "]";
	}
	
	
}
