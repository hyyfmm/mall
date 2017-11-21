package com.hanfu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hanfu.bean.T_MALL_PRODUCT;
import com.hanfu.bean.T_MALL_SKU;

public interface SkuMapper {

	List<T_MALL_PRODUCT> select_sku_get_spu(@Param("class_1_id") int class_1_id, @Param("class_2_id") int class_2_id,
			@Param("pp_id") int pp_id);

	void insert_sku(T_MALL_SKU sku);

	void insert_sku_av(Map<Object, Object> map);

}
