package com.hanfu.service;

import java.util.List;

import com.hanfu.bean.OBJECT_T_MALL_CLASS_SKU;
import com.hanfu.bean.OBJECT_T_MALL_DETAIL_SKU;
import com.hanfu.bean.OBJECT_T_MALL_SKU_CLASS;
import com.hanfu.bean.T_MALL_SKU;
import com.hanfu.bean.T_MALL_SKU_ATTR_VALUE;

public interface SearchServiceInf {
	
	List<OBJECT_T_MALL_SKU_CLASS> goto_search_class(int class_2_id);
	
	List<OBJECT_T_MALL_CLASS_SKU> search_by_attr(String order, int class_2_id,
			List<T_MALL_SKU_ATTR_VALUE> list_attr_value);
	
	OBJECT_T_MALL_DETAIL_SKU get_sku_detail(int sku_id, int spu_id);
	
	List<T_MALL_SKU> get_list_sku_by_spu_id(int spu_id);
}
