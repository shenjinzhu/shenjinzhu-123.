package com.sjz.entity;

import java.io.Serializable;

public class Nutrition implements Serializable{
	private Integer nutrition_id;
	private String nuname;
	private String function;
	private String practice;
	private String introduce;
	public Integer getNutrition_id() {
		return nutrition_id;
	}
	public void setNutrition_id(Integer nutrition_id) {
		this.nutrition_id = nutrition_id;
	}
	public String getNuname() {
		return nuname;
	}
	public void setNuname(String nuname) {
		this.nuname = nuname;
	}
	public String getFunction() {
		return function;
	}
	public void setFunction(String function) {
		this.function = function;
	}
	public String getPractice() {
		return practice;
	}
	public void setPractice(String practice) {
		this.practice = practice;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	@Override
	public String toString() {
		return "Nutrition [nutrition_id=" + nutrition_id + ", nuname=" + nuname + ", function=" + function
				+ ", practice=" + practice + ", introduce=" + introduce + "]";
	}
	
}
