package com.hanfu.test;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;
import com.hanfu.bean.T_MALL_CLASS_1;
import com.hanfu.factory.MySqlSessionFactory;
import com.hanfu.mapper.ClassMapper;

public class TestJson {
	public static void main(String[] args) {
		SqlSessionFactory myFactory = MySqlSessionFactory.getMyFactory();
		ClassMapper mapper = myFactory.openSession().getMapper(ClassMapper.class);
		List<T_MALL_CLASS_1> select_class_1 = mapper.select_class_1();
		Gson gson = new Gson();
		String json = gson.toJson(select_class_1);
		
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(new File("d:/js/class_1.js"));
			fos.write(json.getBytes("utf-8"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(json);
	}
}
