package com.sjz.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjz.entity.Medical;
import com.sjz.service.MedicalService;
import com.sjz.util.PagedResult;

@Controller
public class MedicalController extends BaseController{
	@Autowired
	private MedicalService medicalService;
	
	@RequestMapping("/medical")    
    public String bootStrapTest1(){  
        return "medical/medical_list";  
    }  
 
	@RequestMapping(value="/medicalList.do", method= RequestMethod.POST)  
    @ResponseBody  
    public String list(Integer pageNumber,Integer pageSize ,String mname) {  
        logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNumber,pageSize);  
        try {  
        	if(mname.trim().equals("")){
        		
        	}else{
        		mname="%"+mname+"%";
        	}
            PagedResult<Medical> pageResult = medicalService.queryByPage(mname, pageNumber,pageSize);  
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  
    }  
	@RequestMapping("/add")
	public String toAdd(){
		return "medical/medical_add";
	}
	
	@RequestMapping("/save")
	public String save(Medical medical){
		Integer id=medical.getMedical_id();
		if(id!=null){
			//有id证明是修改的
			medicalService.updateMedical(medical);
		}else{
			//没有id是新增
			medicalService.save(medical);
		}
		return "redirect:medical";
	}

	@RequestMapping("/update")
	public String toupdate(HttpServletRequest req,Integer medical_id){
		Medical medical=medicalService.queryById(medical_id);
		req.setAttribute("medical", medical);
		return "medical/medical_add";	
	}
	
	@RequestMapping("/delete")
	public String delete(Integer medical_id){
		medicalService.deleteMedical(medical_id);
		return "redirect:medical";
	}
}
