package com.sjz.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjz.entity.Person;
import com.sjz.service.PersonService;
import com.sjz.util.PagedResult;

import net.sf.json.JSONArray;
@Controller
public class PersonController extends BaseController{
	@Autowired
	private PersonService personService;
	
	 @RequestMapping("/person")    
	    public String bootStrapTest1(){  
	        return "person/person_list";  
	    }  
	 
	 @RequestMapping(value="/personList.do", method= RequestMethod.POST)  
	    @ResponseBody  
	    public String list(Integer pageNumber,Integer pageSize ,String username) {  
	        logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNumber,pageSize);  
	        try {  
	            PagedResult<Person> pageResult = personService.queryByPage(username, pageNumber,pageSize);  
	            return responseSuccess(pageResult);  
	        } catch (Exception e) {  
	            return responseFail(e.getMessage());  
	        }  
	    } 
	 
	 @RequestMapping("/toLogin")
	 public String toLogin(HttpServletRequest req,HttpServletResponse res){
		Cookie[] cookies = req.getCookies();
		for(Cookie cookie : cookies){
			 if (cookie.getName().equals("personId"))  
	         {  
	             Cookie cookie1 = new Cookie("personId","");
	             cookie.setMaxAge(0);  
	             res.addCookie(cookie);  
	         }  
		}
		 return "person/login";
	 }
	 
	 @RequestMapping("/toRegister")
	 public String toRegister(){
		 return "person/register";
	 }
	 @RequestMapping("/register")
	 public String zc(HttpServletRequest req,Person person){
		 if(person.getAnswer()!=null){
			 
		 }else{
			 person.setQuestion(null);
		 }
		 String s=personService.register(person);
		 req.setAttribute("Thisid", s);
		 return "person/login";
	 }
	 @RequestMapping("/login")
	 public String login(HttpSession session,HttpServletRequest req,HttpServletResponse res){
		Integer personId=Integer.valueOf(req.getParameter("personId"));
		if(personId!=null){
		String password=req.getParameter("passWord");
		Person p=personService.login(personId, password);
		if(p!=null){
			Cookie id=new Cookie("personId", String.valueOf(p.getPersonId()));
			p.setPersonId(personId);
			res.addCookie(id);
			//req.setAttribute("personId", p.getPersonId());
			//req.getSession().setAttribute("personId", p.getPersonId());
//			req.getSession().setAttribute("userName", p.getUserName());
//			req.getSession().setAttribute("username", p.getUserName());
//			req.getSession().setAttribute("po", p.getPo());
			req.getSession().setAttribute("uid", p.getPersonId());
			req.setAttribute("p", p);
				return "main";
			}
	
		req.setAttribute("personId", personId);
		req.setAttribute("error", "用户名或密码错误");
		return "person/login";
		}else{
			return "main";
		}
	 }
	 @RequestMapping("/getPerson_u")
	 public String getPerson(HttpServletRequest req,Integer personId){
		Person p=personService.getPersonById(personId);
		p.setPersonId(personId);
		req.setAttribute("p", p);
		return "person/person_add";
	 }
	 
	 @RequestMapping("/person_UP")
	 public String person_ups(Person p){
		 if(p!=null){
			 personService.updatePerson(p);;
		 }
		 return "person/person_list";
	 }
	 
	 @RequestMapping("/selectName")
	 @ResponseBody
	 public String selectName(String userName){
		Person p=personService.getPersonByName(userName);
		 return JSONArray.fromObject(p).toString();
	 }
	 
	 @RequestMapping("/getTo")
	 public String getto(String personId,HttpServletRequest req){
		 req.getSession().setAttribute("to", personId);
		 return "talktwo";
	 }
	 
	 @RequestMapping("/updatePwd")
	 public String up(HttpServletRequest req){
		 String question=req.getParameter("question");
		 String answer=req.getParameter("answer");
		 String passWord=req.getParameter("passWord");
		 Integer personId=Integer.valueOf( req.getParameter("personId"));
		 if(question!=null){
			 Boolean b=personService.upDatepwd(personId,answer,passWord);
			 if(b){
				 req.setAttribute("success", "修改成功，重新登录");
				 return "person/login"; 
			 }else{
				 req.setAttribute("error", "修改失败，密保答案错误");
				 return "main";
			 }
		 }else{
			 personService.upDatePwdNoqst(personId,passWord);
			 req.setAttribute("success", "修改成功，重新登录");
		 }
		return "person/login"; 
	 }
	 //填写忘记密码账号
	 @RequestMapping("/forgId")
	 public String forGid(){
		 return "person/scanId";
	 }
	 //忘记密码
	 @RequestMapping("/forget")
	 public String forget(HttpServletRequest req){
		 Integer personId=Integer.valueOf(req.getParameter("personId"));
		 Person p=personService.getPersonById(personId);
		 if(p.getQuestion().equals("")){	 
			 req.setAttribute("success", "该id没有设置密保问题，不能找回密码");
				return "person/login";
		 }
		 req.getSession().setAttribute("personId", personId);
		 req.setAttribute("p", p);
		 return "person/forget"; 
	 }
	 @RequestMapping("/updatePwdbyQ")
	 public String updatePwdByq(HttpServletRequest req){
		 String answer=req.getParameter("answer");
		 String passWord=req.getParameter("passWord");
		 Integer personId=(Integer) req.getSession().getAttribute("personId");
			 Boolean b=personService.upDatepwd(personId,answer,passWord);
			 if(b){
				 req.setAttribute("success", "修改成功，重新登录");
				 return "person/login";
			 }else{
				 req.setAttribute("success", "修改失败，密保答案错误");
				 return "person/login";
			 }
	 }
}
