package com.sjz.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjz.entity.Person;
import com.sjz.service.PersonService;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
@Controller
public class MainController extends BaseController{
	@Autowired
	private PersonService ps;
	@RequestMapping("/admin")
	public String getIndex(){
		return "index";
	}
	@RequestMapping("/")
	public String home1(){
		return "test";
	}
	@RequestMapping("/ad")
	public String home(){
		return "menu/adminLogin";
	}
	@RequestMapping("toM")
	public String toM(){
		return "main";
	}
	@RequestMapping("home")
	public String tohome(){
		return "menu/Home";
	}
	@RequestMapping("/main_web")
	public String showmain(HttpServletRequest req){
		Integer id=null;
		Cookie[] cookies = req.getCookies();//这样便可以获取一个cookie数组
		for(Cookie cookie : cookies){
		  if(cookie.getName().equalsIgnoreCase("personId")){
			  id=Integer.valueOf(cookie.getValue());
		  }
		}
		if(id!=null){
			Person p=ps.getPersonById(id);
			p.setPersonId(id);
			req.setAttribute("p", p);
		}
		return "main";
	}

	@RequestMapping("/per_menu")
	public String per(){
		return "menu/person_menu";
	}
	@RequestMapping("/doctor_menu")
	public String doc(){
		return "menu/doctor_menu";
	}
	@RequestMapping("/doctor_toBemenu")
	public String docs(){
		return "doctor/doc_toBeMa";
	}
	@RequestMapping("/med_menu")
	public String med(){
		return "menu/medical_menu";
	}
	@RequestMapping("/pat_menu")
	public String pat(){
		return "menu/pathology_menu";
	}
	@RequestMapping("/not_menu")
	public String notice(){
		return "menu/notice_menu";
	}
	@RequestMapping("/adminLogin")
	public String adLo(HttpServletRequest req,String user,String pwd){
		if("admin".equals(user.trim())){
			if("123456".equals(pwd.trim())){
				return "menu/Home";
			}
		}
		req.getSession().setAttribute("adminUser", user);
		req.setAttribute("pwd", pwd);
		req.setAttribute("miss", "用户名或密码错误");
		return "menu/adminLogin";
	}
	@RequestMapping("/webS")
	public String webs(){
		return "webs";
	}
	//药物检索页
	@RequestMapping("medical_show_l")
	public String showmedical(){
		return "main/medical_show";
	}
	//病症检索页
	@RequestMapping("/pathology_show_l")
	public String showpath(){
		return "main/pathology_show";
	}
	//主页45
	@RequestMapping("/getMore")
	public String getMore(){
		return "main/getMore";
	}
	//新闻
	@RequestMapping("/news")
	public String news(){
		return "main/news";
	}
	//常见病症
	@RequestMapping("/commonP")
	public String commonP(){
		return "main/commonP";
	}
	@RequestMapping("/excel")
	public void excel(HttpServletResponse res,HttpServletRequest req) throws IOException{
		FileInputStream os=new FileInputStream("src/main/file/gp.xlsx"); 
		res.setHeader("Content-type", "text/html;charset=UTF-8");  
	    OutputStream out=res.getOutputStream();  
	    //out.write(data.getBytes());  
	    byte[] arr=new byte[os.available()];
	    out.write(arr);  
	    out.close();
	}
}
