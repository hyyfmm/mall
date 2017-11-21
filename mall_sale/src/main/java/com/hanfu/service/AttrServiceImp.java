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

	@Override
	public List<OBJECT_T_MALL_ATTR> get_attr_list_by_class_2(int class_2_id) {
		List<OBJECT_T_MALL_ATTR> list_attr = attrMapper.select_attr_list_by_class_2(class_2_id);
		return list_attr;
	}

}
