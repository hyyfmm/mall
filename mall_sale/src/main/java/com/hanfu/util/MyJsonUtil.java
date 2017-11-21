package com.hanfu.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.google.gson.Gson;

import net.sf.json.JSONArray;

public class MyJsonUtil {
	
	//将对象转换为json
	public static<T> String object_to_json(T t) {
		Gson gson = new Gson();
		String json = gson.toJson(t);
		//将json字符串进行utf-8编码
		try {
			json = URLEncoder.encode(json, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return json;
	}
	
	//将json解析为对象
	public static<T> T json_to_object(String json, Class<T> tClass) {
		if(StringUtils.isBlank(json)) {
			return null;
		}
		//先将json字符串进行utf-8解码
		try {
			json = URLDecoder.decode(json, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Gson gson= new Gson();
		T fromJson = gson.fromJson(json, tClass);
		return fromJson;
	}
	
	//将对象集合转换为json
	public static<T> String list_to_json(List<T> tList) {
		Gson gson = new Gson();
		String json = gson.toJson(tList);
		
		//对json字符串进行ut-8编码
		try {
			json = URLEncoder.encode(json, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return json;
	}
	
	//将json字符串转化为对象集合
	public static<T> List<T> json_to_list(String json, Class<T> tClass) {
		if(StringUtils.isBlank(json)) {
			return null;
		}
		//先将json字符串进行utf-8解码
		try {
			json = URLDecoder.decode(json, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		JSONArray fromObject = JSONArray.fromObject(json);
		List<T> list_T = (List<T>) JSONArray.toCollection(fromObject, tClass);
		
		return list_T;
	}
	
}
