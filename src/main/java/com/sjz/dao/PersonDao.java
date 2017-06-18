package com.sjz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sjz.entity.Person;

public interface PersonDao {
	List<Person> selectPersonByUsername(@Param("userName")String userName);
	
	void addPerson(Person person);
	
	Person selectPersonById(@Param("personId")Integer personId);
	
	void deleteById(@Param("personId")Integer personId);
	
	void updatePerson(Person person);
	
	void updatePersonPassword(Person person);
	
	void updatePo(Person person);
	//根据昵称得到实体
	Person selectByNameForadd(@Param("userName")String userName);
	
}
