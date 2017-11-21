package com.hanfu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanfu.bean.T_MALL_PRODUCT;

public interface SpuMapper {
	void insert_spu(T_MALL_PRODUCT spu);

	void insert_spu_image(@Param("spu") T_MALL_PRODUCT spu, @Param("list_image_name") List<String> list_image_name);

	List<T_MALL_PRODUCT> select_spu_test();

	String select_flmch2_by_spuId(int id);
}
