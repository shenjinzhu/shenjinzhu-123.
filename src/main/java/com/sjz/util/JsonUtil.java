package com.sjz.util;

import java.io.IOException;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

//用于转换
public class JsonUtil {
	 public static<T> JSONObject objectToJson(T obj) throws JSONException, IOException {
		 JSONObject jsonObject = JSONObject.fromObject(obj);
		 return jsonObject;
	    }
}
