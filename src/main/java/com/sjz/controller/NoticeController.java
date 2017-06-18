package com.sjz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjz.entity.Notice;
import com.sjz.service.NoticeService;
import com.sjz.util.PagedResult;

@Controller
public class NoticeController extends BaseController{
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/notice")    
    public String bootStrapTest1(){  
        return "notice/notice_list";  
    }  
 
	@RequestMapping(value="/noticeList.do", method= RequestMethod.POST)  
    @ResponseBody  
    public String list(Integer pageNumber,Integer pageSize ,String title) {  
        logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNumber,pageSize);  
        try {  
        	if("".equals(title.trim())){
        		
        	}else{
        		title="%"+title+"%";
        	}
            PagedResult<Notice> pageResult = noticeService.queryByPage(title, pageNumber,pageSize);  
            return responseSuccess(pageResult);  
        } catch (Exception e) {  
            return responseFail(e.getMessage());  
        }  
    }
	
	@RequestMapping("/notice_toAdd")
	public String toadd(){
		return "notice/notice_add";
	}
	
	@RequestMapping("/noticeSave")
	public String add(Notice notice){
		if(notice.getNotice_id()!=null){
			noticeService.updateNotice(notice);
		}else{
			noticeService.insertNotice(notice);
		}
		return "redirect:notice";
	}
	
	@RequestMapping("/notice_toUpdate")
	public String toupdate(HttpServletRequest req,Integer notice_id){
		Notice notice=noticeService.getNoticeById(notice_id);
		req.setAttribute("notice", notice);
		return "notice/notice_add";
	}
	
	@RequestMapping("/noticeDelete")
	public String noDel(Integer notice_id){
		noticeService.deleteNotice(notice_id);
		return "redirect:notice";
	}
	@RequestMapping("/notice_show")
	public String notice_show(HttpServletRequest req){
		List<Notice> list=noticeService.getNotice();
		req.setAttribute("list", list);
		return "notice/show";
	}
}
