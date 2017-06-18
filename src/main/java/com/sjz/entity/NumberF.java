package com.sjz.entity;

import java.io.Serializable;

public class NumberF implements Serializable{
	private Integer nub_id;
	private Integer numberf;
	public Integer getNub_id() {
		return nub_id;
	}
	public void setNub_id(Integer nub_id) {
		this.nub_id = nub_id;
	}
	public Integer getNumberf() {
		return numberf;
	}
	public void setNumber(Integer numberf) {
		this.numberf = numberf;
	}
	@Override
	public String toString() {
		return "Number [nub_id=" + nub_id + ", numberf=" + numberf + "]";
	}
	
	
}
