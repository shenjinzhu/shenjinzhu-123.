package com.sjz.service;


import java.util.List;

import com.sjz.entity.Notice;
import com.sjz.util.PagedResult;

public interface NoticeService {
	PagedResult<Notice> queryByPage(String title,Integer pageNo,Integer pageSize);
	
	boolean insertNotice(Notice notice);
	
	boolean updateNotice(Notice notice);
	
	void deleteNotice(Integer notice_id);
	
	Notice getNoticeById(Integer notice_id);
	//获取所有信息
	List<Notice> getNotice();
}
