package com.hanfu.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hanfu.bean.OBJECT_T_MALL_CLASS_SKU;
import com.hanfu.bean.OBJECT_T_MALL_DETAIL_SKU;
import com.hanfu.bean.OBJECT_T_MALL_SKU_CLASS;
import com.hanfu.bean.T_MALL_SKU;

public interface SearchMapper {
	
	List<OBJECT_T_MALL_SKU_CLASS> select_search_class(int class_2_id);
	
	//根据属性查询库存信息
	List<OBJECT_T_MALL_CLASS_SKU> select_by_attr(Map<Object, Object> map);
	
	//获取商品信息，图片信息，属性规格信息
	OBJECT_T_MALL_DETAIL_SKU select_sku_detail(HashMap<Object, Object> hashMap);
	
	//获得库存信息
	List<T_MALL_SKU> select_list_sku_by_spu_id(int spu_id);
}
