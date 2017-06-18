package com.other;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.DomSerializer;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.TagNode;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.sjz.service.MedicalService;

public class JsoupAndXpath {

	@Autowired
	private MedicalService ms;
		
	public static List<String> te() throws XPathExpressionException, ParserConfigurationException
	{
		String url = "http://www.iyouyao.com/med-13-1.html";
	    String exp = "//div[@class='product_text']/h2/a/@href";
	    String html = null;
	    List<String> l= new ArrayList<String>();
	    try {
	        Connection connect = Jsoup.connect(url);
	        html = connect.get().body().html();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    //xpath和jsoup联合使用
	    HtmlCleaner hc = new HtmlCleaner();
	    TagNode tn = hc.clean(html);
	    
	    Document dom = new DomSerializer(new CleanerProperties()).createDOM(tn);
	    XPath xPath = XPathFactory.newInstance().newXPath();
	    Object result;
	    String url1="";
	    //结果集
	    result = xPath.evaluate(exp, dom, XPathConstants.NODESET);
	    if (result instanceof NodeList) {
	        NodeList nodeList = (NodeList) result;
	        for (int i = 0; i < nodeList.getLength(); i++) {
	            Node node = nodeList.item(i);
	            if(node.getTextContent().indexOf("")!=-1){ 
	            	//System.out.println(node.getNodeValue() == null ? node.getTextContent() : node.getNodeValue());
	            	
	            	url1="http://www.iyouyao.com"+node.getTextContent();
	            	l.add(url1);
	            	
	            }
	        }
	    }
		return l;
		
	}
	public static void main(String[] args) throws Exception {
		String url = "http://www.iyouyao.com/med-13-1.html";
	    String exp = "//div[@class='product_text']/h2/a/@href";

	    String html = null;
	    try {
	        Connection connect = Jsoup.connect(url);
	        html = connect.get().body().html();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    //xpath和jsoup联合使用
	    HtmlCleaner hc = new HtmlCleaner();
	    TagNode tn = hc.clean(html);
	    
	    Document dom = new DomSerializer(new CleanerProperties()).createDOM(tn);
	    XPath xPath = XPathFactory.newInstance().newXPath();
	    Object result;
	    //结果集
	    result = xPath.evaluate(exp, dom, XPathConstants.NODESET);
	    if (result instanceof NodeList) {
	        NodeList nodeList = (NodeList) result;
	        for (int i = 0; i < nodeList.getLength(); i++) {
	            Node node = nodeList.item(i);
	            if(node.getTextContent().indexOf("")!=-1){ 
	            	//System.out.println(node.getNodeValue() == null ? node.getTextContent() : node.getNodeValue());
	            	
	            	String url1="http://www.iyouyao.com"+node.getTextContent();
	            	
	            }
	        }
	    }

	    
	}
	
}
