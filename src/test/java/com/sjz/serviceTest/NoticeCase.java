package com.sjz.serviceTest;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sjz.baseTest.SpringTestCase;
import com.sjz.dao.NoticeDao;
import com.sjz.entity.Notice;
import com.sjz.service.NoticeService;

public class NoticeCase extends SpringTestCase{
	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private NoticeService noticeService;
	@Test
	public void t(){
		List<Notice> ls=noticeDao.selectNoticeByTitle(null);
		for(Notice l:ls){
			System.out.println(l);
		}
	//	noticeService.queryByPage(null, 1, 10);
		
	}
	
	@Test
	public void add(){
		Notice n=new Notice();
		n.setTitle("测试案例1");
		n.setContent("asd按时打算打算阿萨德阿萨德按时");
		n.setTime("2017-02-01");
		noticeDao.addNotice(n);
	}
	@Test
	public void update(){
		Notice n=new Notice();
		n.setNotice_id(2);
		n.setContent("修改后的内容");
		noticeDao.updateNotice(n);
	}
	
	@Test
	public void findById(){
		Notice n=noticeDao.selectNoticeById(1);
		System.out.println(n);
	}
	@Test
	public void getAll(){
		List<Notice> list=noticeService.getNotice();
		for(Notice l:list){
			System.out.println(l);
		}
	}
}
