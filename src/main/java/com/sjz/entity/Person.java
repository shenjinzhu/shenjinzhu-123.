package com.sjz.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 用户表
 * @author Administrator
 *
 */
public class Person implements Serializable{
	/*内码*/			
	private Integer personId;
	private String userName;
	private String passWord;
	private Integer age;
	private String sex;
	private String email;
	/*身份 0:单位  1：医生  2：普通用户*/
	private Integer iden;
	private Integer state;
	private String lastLogin;
	private Integer po;
	private Integer now;
	private String question;
	private String answer;
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Integer getNow() {
		return now;
	}
	public void setNow(Integer now) {
		this.now = now;
	}
	public Integer getPersonId() {
		return personId;
	}
	public void setPersonId(Integer personId) {
		this.personId = personId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getIden() {
		return iden;
	}
	public void setIden(Integer iden) {
		this.iden = iden;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public Integer getPo() {
		return po;
	}
	public void setPo(Integer po) {
		this.po = po;
	}
	@Override
	public String toString() {
		return "Person [personId=" + personId + ", userName=" + userName + ", passWord=" + passWord + ", age=" + age
				+ ", sex=" + sex + ", email=" + email + ", iden=" + iden + ", state=" + state + ", lastLogin="
				+ lastLogin + ", po=" + po + ", now=" + now + ", question=" + question + ", answer=" + answer + "]";
	}
	
}