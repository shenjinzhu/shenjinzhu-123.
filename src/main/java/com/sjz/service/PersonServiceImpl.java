package com.sjz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.sjz.dao.NumberFDao;
import com.sjz.dao.PersonDao;
import com.sjz.entity.Person;
import com.sjz.util.BeanUtil;
import com.sjz.util.PagedResult;

@Service
public class PersonServiceImpl implements PersonService {

	@Autowired
	private PersonDao personDao;
	@Autowired
	private NumberFDao numberDao;
	@Override
	public PagedResult<Person> queryByPage(String userName, Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null?1:pageNo;  
	    pageSize = pageSize == null?10:pageSize;  
	    PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。  
	    return BeanUtil.toPagedResult(personDao.selectPersonByUsername(userName));
	}
	@Override
	public String register(Person person) {
		Integer nub=numberDao.selectNumberf().getNumberf();
		numberDao.updateNumberf(nub+1);
		Integer personId=nub+1;
		//设置id
		person.setPersonId(personId);
		personDao.addPerson(person);
		return personId+"";
	}
	@Override
	public Person login(Integer personId,String password) {
		Person person=null;
		try{
			person=personDao.selectPersonById(personId);
			person.setPersonId(personId);
			if(password.trim()!=null){
				if(password.equals(person.getPassWord())){
					//验证密码通过,设置登录码
					int po=(int)(Math.random()*100);
					person.setPo(po);
					personDao.updatePo(person);
					return person;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Integer selPo(Integer personId) {
		return personDao.selectPersonById(personId).getPo();
	}
	@Override
	public Person getPersonByName(String username) {
		Person p=personDao.selectByNameForadd(username);
		return p;
	}
	@Override
	public boolean upDatepwd(Integer personId, String answer, String passWord) {
		Person p=personDao.selectPersonById(personId);
		if(answer.equals(p.getAnswer())){
			p.setPersonId(personId);
			p.setPassWord(passWord);
			personDao.updatePersonPassword(p);
			return true;
		}
		return false;
	}
	@Override
	public void upDatePwdNoqst(Integer personId, String password) {
		Person p=new Person();
		p.setPersonId(personId);
		p.setPassWord(password);
		personDao.updatePersonPassword(p);
	}
	@Override
	public Person getPersonById(Integer personId) {
		return personDao.selectPersonById(personId);
	}
	@Override
	public void downPerson(Integer personId) {
		Person p=new Person();
		p.setPersonId(personId);
		p.setState(0);
		personDao.updatePerson(p);
	}
	@Override
	public void upPerson(Integer personId) {
		Person p=new Person();
		p.setPersonId(personId);
		p.setState(1);
		personDao.updatePerson(p);
	}
	@Override
	public void updatePerson(Person p) {
		personDao.updatePerson(p);
	}

}
