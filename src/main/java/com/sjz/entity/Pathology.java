package com.sjz.entity;

import java.io.Serializable;

public class Pathology implements Serializable{
	private Integer pathology_id;
	private String p_name;
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	private String sysmptom;
	private String pintroduce;
	private String medical_use;
	private String matters_Needing_Attention;
	public Integer getPathology_id() {
		return pathology_id;
	}
	public void setPathology_id(Integer pathology_id) {
		this.pathology_id = pathology_id;
	}
	public String getSysmptom() {
		return sysmptom;
	}
	public void setSysmptom(String sysmptom) {
		this.sysmptom = sysmptom;
	}
	public String getPintroduce() {
		return pintroduce;
	}
	public void setPintroduce(String pintroduce) {
		this.pintroduce = pintroduce;
	}
	public String getMedical_use() {
		return medical_use;
	}
	public void setMedical_use(String medical_use) {
		this.medical_use = medical_use;
	}
	public String getMatters_Needing_Attention() {
		return matters_Needing_Attention;
	}
	public void setMatters_Needing_Attention(String matters_Needing_Attention) {
		this.matters_Needing_Attention = matters_Needing_Attention;
	}
	@Override
	public String toString() {
		return "Pathology [pathology_id=" + pathology_id + ", p_name=" + p_name + ", sysmptom=" + sysmptom
				+ ", pintroduce=" + pintroduce + ", medical_use=" + medical_use + ", matters_Needing_Attention="
				+ matters_Needing_Attention + "]";
	}
	
}
