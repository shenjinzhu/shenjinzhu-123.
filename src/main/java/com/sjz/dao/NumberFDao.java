package com.sjz.dao;

import org.apache.ibatis.annotations.Param;

import com.sjz.entity.NumberF;

public interface NumberFDao {
	NumberF selectNumberf();
	
	void updateNumberf(@Param("numberf") Integer numberf);
}
