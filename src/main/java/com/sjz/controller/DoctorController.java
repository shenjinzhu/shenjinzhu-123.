package com.sjz.controller;

import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjz.entity.Doctor;
import com.sjz.entity.Mesg;
import com.sjz.service.DoctorService;
import com.sjz.util.PagedResult;

import net.sf.json.JSONArray;

@Controller
public class DoctorController extends BaseController{
	@Autowired
	private DoctorService doctorService;
	
	@RequestMapping("/doctor")    
    public String bootStrapTest1(){  
        return "doctor/doctor_list";  
    }  
 
	@RequestMapping(value="/doctorList.do", method= RequestMethod.POST)  
    @ResponseBody  
    public String list(Integer pageNumber,Integer pageSize ,String name) {  
        logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNumber,pageSize);  
        try {  
        	String now="2";
        	if(name.equals("")){
        		name=null;
        	}else{
        		name="%"+name+"%";
        	}
            PagedResult<Doctor> pageResult = doctorService.queryByPage(name,now, pageNumber,pageSize);  
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  
    }  
	
	@RequestMapping(value="/doctor_verification ", method= RequestMethod.POST)  
    @ResponseBody  
    public String list_verification(Integer pageNumber,Integer pageSize ,String name) {  
        logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNumber,pageSize);  
        try { 
        	//now=2表示已经通过审核，1表示需要审核
        	String now="1";
            PagedResult<Doctor> pageResult = doctorService.queryByPage(name,now, pageNumber,pageSize);  
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  
    }  
	@RequestMapping("/doc_be")
	public String dd(){
		return "doctor/doc_tobe";
	}
	@RequestMapping("/doctor_toAdd")
	public String toadd(){
		return "doctor/doctor_add";
	}
	@RequestMapping("/doctorSave")
	public String save(Doctor doctor){
		if(doctor.getDoctor_id()!=null){
			doctorService.updateDoctor(doctor);
		}else{
			doctorService.addDoctor(doctor);
		}
		return "redirect:doctor";
	}
	@RequestMapping("/doctorDelete")
	public String del(Integer doctor_id){
		doctorService.deleteDoctor(doctor_id);
		return "redirect:doctor";
	}
	@RequestMapping("/doctor_toUpdate")
	public String up(HttpServletRequest req,Integer doctor_id){
		Doctor doctor=doctorService.getDoctor(doctor_id);
		req.setAttribute("doctor", doctor);
		return "doctor/doctor_add";
	}
	//显示审核信息
	@RequestMapping("/look_docToBe")
	public String look(HttpServletRequest req,Integer doctor_id){
		Doctor doctor=doctorService.getDoctor(doctor_id);
		req.setAttribute("doctor", doctor);
		return "doctor/doc_look_toBe";
	}
	//申请医生页面
	@RequestMapping("/doc")
	public String toDoc(HttpServletRequest req){
		Integer id=null;
		Cookie[] cookies = req.getCookies();//这样便可以获取一个cookie数组
		for(Cookie cookie : cookies){
		  if(cookie.getName().equalsIgnoreCase("personId")){
			  id=Integer.valueOf(cookie.getValue());
		  }
		}
		if(id!=null){
			req.setAttribute("personId", id);
		}else{
			return "person/login";
		}
		return "doctor/webDoc";
	}
	//申请审核
	@RequestMapping("/doctor_Tobe")
	@ResponseBody
	public String toBe(HttpServletRequest req,Doctor doctor){
		doctorService.one(doctor);
		Mesg mesg=new Mesg();
		mesg.setMsg("提交完成，请耐心等待审核完成");
		mesg.setTitle("fanhu");
		return JSONArray.fromObject(mesg).toString();
	}
	//审核
	@RequestMapping("/shenhe")
	public String toSuccess(Doctor doctor,String resu){
		if(resu.equals("yes")){
			doctorService.two(doctor);
		}else{
			doctorService.fail(doctor.getDoctor_id());
		}
		return "redirect:doc_be";
	}
	//查找在线医生
	@RequestMapping("showOnlineDoctor")
	@ResponseBody
	public String showDoc_onLine(HttpServletRequest req){
		List<Doctor> doc=doctorService.findOnLineDoctor();
		req.setAttribute("doclist", doc);
		return JSONArray.fromObject(doc).toString();
	}
	@RequestMapping("/toMain")
	public String tomain(){
		return "main";
	}
	
}
