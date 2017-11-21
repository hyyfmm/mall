package com.hanfu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanfu.bean.OBJECT_T_MALL_ATTR;
import com.hanfu.mapper.AttrMapper;

@Service
public class AttrServiceImp implements AttrServiceInf {

	@Autowired
	AttrMapper attrMapper;

	public List<OBJECT_T_MALL_ATTR> get_attr_list_by_class_2(int class_2_id) {
		List<OBJECT_T_MALL_ATTR> list_attr = attrMapper.select_attr_list_by_class_2(class_2_id);
		return list_attr;
	}

	public void save_attr(List<OBJECT_T_MALL_ATTR> list_attr, int class_2_id) {
		for (int i = 0; i < list_attr.size(); i++) {
			attrMapper.insert_attr(class_2_id, list_attr.get(i));

			attrMapper.insert_values(list_attr.get(i).getId(), list_attr.get(i).getList_value());
		}
	}
	
	//通过二级分类的id获取二级分类的分类名称
	public String get_flmch2_by_attrId(int id) {
		String flmch2 = attrMapper.select_flmch2_by_attrId(id);
		return flmch2;
	}

}
