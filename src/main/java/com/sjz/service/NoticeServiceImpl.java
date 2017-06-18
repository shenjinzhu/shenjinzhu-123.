package com.sjz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.sjz.dao.NoticeDao;
import com.sjz.entity.Notice;
import com.sjz.util.BeanUtil;
import com.sjz.util.PagedResult;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public PagedResult<Notice> queryByPage(String title, Integer pageNo, Integer pageSize) {
		pageNo=pageNo==null?1:pageNo;
		pageSize = pageSize == null?10:pageSize; 
		PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。 
		return BeanUtil.toPagedResult(noticeDao.selectNoticeByTitle(title));
	}

	@Override
	public boolean insertNotice(Notice notice) {
		try{
			noticeDao.addNotice(notice);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean updateNotice(Notice notice) {
		try{
			noticeDao.updateNotice(notice);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void deleteNotice(Integer notice_id) {
		noticeDao.deleteNotice(notice_id);
	}

	@Override
	public Notice getNoticeById(Integer notice_id){
		
		return noticeDao.selectNoticeById(notice_id);
	}

	@Override
	public List<Notice> getNotice() {
		return noticeDao.selectNoticeByTitle(null);
	}

}
