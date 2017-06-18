package com.sjz.serviceTest;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sjz.baseTest.SpringTestCase;
import com.sjz.dao.NumberFDao;

public class NumberCase extends SpringTestCase{
	@Autowired
	private NumberFDao n;
	@Test
	public void te(){
		//System.out.println(n.selectNumberf());
		n.updateNumberf(n.selectNumberf().getNumberf()+1);
	}
}
