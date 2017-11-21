package com.hanfu.service;

import java.util.List;

import com.hanfu.bean.T_MALL_PRODUCT;

public interface SpuServiceInf {
	public void save_spu(T_MALL_PRODUCT spu, List<String> list_image_name);

	public List<T_MALL_PRODUCT> get_spu_test();
	
	public String get_flmch2_by_spuId(int id);
}
