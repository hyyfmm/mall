package com.hanfu.service;

import java.util.List;

import com.hanfu.bean.OBJECT_T_MALL_ATTR;

public interface AttrServiceInf {

	public List<OBJECT_T_MALL_ATTR> get_attr_list_by_class_2(int class_2_id);

	public void save_attr(List<OBJECT_T_MALL_ATTR> list_attr, int class_2_id);
	
	public String get_flmch2_by_attrId(int id);
}
