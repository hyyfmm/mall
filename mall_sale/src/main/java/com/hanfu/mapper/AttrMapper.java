package com.hanfu.mapper;

import java.util.List;

import com.hanfu.bean.OBJECT_T_MALL_ATTR;

public interface AttrMapper {
	
	List<OBJECT_T_MALL_ATTR> select_attr_list_by_class_2(int class_2_id);
}
