package com.sjz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sjz.entity.Notice;

public interface NoticeDao {
	List<Notice> selectNoticeByTitle(@Param("title")String title);
	
	Notice selectNoticeById(@Param("notice_id")Integer notice_id);
	
	void addNotice(Notice notice);
	
	void updateNotice(Notice notice);
	
	void deleteNotice(@Param("notice_id")Integer notice_id);
}
