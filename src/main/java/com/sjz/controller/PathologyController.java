package com.sjz.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjz.entity.Doctor;
import com.sjz.entity.Pathology;
import com.sjz.service.PathologyService;
import com.sjz.util.PagedResult;

@Controller
public class PathologyController extends BaseController{
	@Autowired
	private PathologyService pathologyService;
	
	@RequestMapping("/pathology")    
    public String bootStrapTest1(){  
        return "pathology/pathology_list";  
    }  
 
	@RequestMapping(value="/pathologyList.do", method= RequestMethod.POST)  
    @ResponseBody  
    public String list(Integer pageNumber,Integer pageSize ,String sysmptom) {  
        logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNumber,pageSize);  
        try {  
        	sysmptom="%"+sysmptom+"%";
            PagedResult<Pathology> pageResult =pathologyService.queryByPage(sysmptom, pageNumber,pageSize);  
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  
    }  
	
	@RequestMapping("/pathology_toAdd")
	public String toadd(){
		return "pathology/pathology_add";
	}
	@RequestMapping("/pathologySave")
	public String save(Pathology pathology){
		if(pathology.getPathology_id()!=null){
			pathologyService.update(pathology);
		}else{
			pathologyService.add(pathology);
		}
		return "redirect:pathology";
	}
	@RequestMapping("/pathology_toUpdate")
	public String update(HttpServletRequest req,Integer pathology_id){
		Pathology pathology=pathologyService.getPathology(pathology_id);
		req.setAttribute("pathology", pathology);
		return "pathology/pathology_add";
	}
	
	@RequestMapping("/pathology_delete")
	public String del(Integer pathology_id){
		pathologyService.delete(pathology_id);
		return "redirect:pathology";
	}
	
	@RequestMapping("/pathology_show")
	public String show_p(HttpServletRequest req,Integer pathology_id){
		Pathology pathology=pathologyService.getPathology(pathology_id);
		req.setAttribute("pathology", pathology);
		return "main/pathology_s";
	}
}
