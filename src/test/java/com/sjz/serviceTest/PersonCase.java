package com.sjz.serviceTest;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sjz.baseTest.SpringTestCase;
import com.sjz.dao.PersonDao;
import com.sjz.entity.Person;
import com.sjz.entity.TestFen;
import com.sjz.service.PersonService;
import com.sjz.util.PagedResult;

public class PersonCase extends SpringTestCase{
	@Autowired
	private PersonService personService;
	
Logger logger = Logger.getLogger(PersonCase.class);
	
	@Autowired
	private PersonDao personDao;
	
	@Test
	public void s(){
		List<Person> l=personDao.selectPersonByUsername(null);
		for(Person ls:l){
			System.out.println(ls);
		}
	}
	
	@Test  
	public void queryByPage(){  
	     PagedResult<Person>  pagedResult = personService.queryByPage(null,1,10);//null表示查全部    
	     logger.debug("查找结果" + pagedResult);  
	}  
	@Test
	public void sss(){
		//System.out.println(personDao.selectPersonById(2));
		Person p=new Person();
		p.setPersonId(1231);
		p.setAge(22);
		p.setEmail("asdasd");
		p.setPassWord("asdas");
		p.setSex("男");
		p.setUserName("asdas");
		personDao.addPerson(p);
	}
	@Test
	public void testl(){
		Person p=new Person();
		p.setPersonId(5);
		p.setPo(25);
		personDao.updatePo(p);
		Person per=personDao.selectPersonById(5);
		System.out.println(per);
	}

	@Test
	public  void testLogin(){
		Integer personId=1231;
		String password="asdas";
		Person p=personService.login(personId, password);
		System.out.println(p);
	}
	//修改申请状况
	@Test
	public void tes(){
		Person p=new Person();
		p.setNow(1);
		p.setUserName("ilo");
		p.setPersonId(12345);
		p.setSex("M");
		p.setAge(12);
		personDao.updatePerson(p);
		
	}
	@Test
	public void testidtoperson(){
		Person p=new Person();
		p=personDao.selectByNameForadd("ilo");
//		Person p=personDao.selectPersonById(12345);
//		System.out.println(p);
	}
	@Test //测试修改密码
	public void tessss(){
		personService.upDatepwd(123470, "qweqwe", "1234");
	}
	@Test//测试根据id找
	public void testsById(){
		Person p=personService.getPersonById(12345);
		System.out.println(p);
	}
}
