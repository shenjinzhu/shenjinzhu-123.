package com.sjz.service;

import java.util.List;

import com.sjz.entity.Person;
import com.sjz.util.PagedResult;

public interface PersonService {
	PagedResult<Person> queryByPage(String username,Integer pageNo,Integer pageSize);
	
	String register(Person person);
	
	Person login(Integer personId,String password);
	
	Integer selPo(Integer personId);
	
	Person getPersonByName(String username);
	//有问题的修改
	boolean upDatepwd(Integer personId,String answer,String passWord);
	void upDatePwdNoqst(Integer personId,String password);
	//根据id得到person
	Person getPersonById(Integer personId);
	//用户下线
	void downPerson(Integer personId);
	//用户上线
	void upPerson(Integer personId);
	
	void updatePerson(Person p);
}
