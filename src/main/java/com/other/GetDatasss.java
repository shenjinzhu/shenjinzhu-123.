package com.other;

import java.io.IOException;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;

import com.sjz.dao.MedicalDao;
import com.sjz.entity.Medical;
import com.sjz.service.MedicalService;

public class GetDatasss {
	
	@Autowired
	private MedicalDao mss;
	
	public void s(List<String> ll) throws IOException, XPathExpressionException, ParserConfigurationException{
		List<String> ls=ll;
		for(String s:ls){
		String url=s;
		Document doc = Jsoup.connect(url).timeout(5000).get();
		//String title = doc.title();
		//System.out.println(title+"ss");
		Elements link = doc.select("h1");
		Elements link2 = doc.select("li");
		String title=null;
		for(Element l:link)
		{
			if(l.ownText().length()>5){
				title=l.ownText();
			}
		}
		String ename=null;
		String function=null;
		String source=null;
		String biaohao=null;
		String like=null;
		for(int i=0;i<link2.size();i++)
		{
			if(i==9){
				ename=link2.get(i).ownText();
			}
			if(i==14){
				function=link2.get(i).ownText();
			}
			if(i==13){
				source=link2.get(i).ownText();
			}
			if(i==8){
				biaohao=link2.get(i).ownText();
			}
			if(i==12){
				like=link2.get(i).ownText();
			}
			System.out.println(i+":"+link2.get(i).ownText());
			
		}
		System.out.println(title);
		Medical m=new Medical();
		System.out.println(title+ename+function+source+biaohao+like);
		m.setEname(title);
		m.setMname(ename);
		m.setMfunction(function);
		m.setSource(source);
		m.setSide_effect(biaohao);
		m.setMcharacteristic(like);
		mss.save(m);
		}
		
	}
	public static void main(String[] args) throws IOException, XPathExpressionException, ParserConfigurationException {
		GetDatasss s=new GetDatasss();
		JsoupAndXpath x=new JsoupAndXpath();
		s.s(x.te());
	}

}
