package com.hanfu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanfu.bean.T_MALL_PRODUCT;
import com.hanfu.bean.T_MALL_SKU;
import com.hanfu.bean.T_MALL_SKU_ATTR_VALUE;
import com.hanfu.mapper.SkuMapper;

@Service
public class SkuServiceImp implements SkuServiceInf {

	@Autowired
	SkuMapper skuMapper;

	@Override
	public List<T_MALL_PRODUCT> sku_get_spu(int class_2_id, int class_1_id, int pp_id) {
		return skuMapper.select_sku_get_spu(class_1_id, class_2_id, pp_id);
	}

	@Override
	public void save_sku(List<T_MALL_SKU_ATTR_VALUE> list_sku_av, T_MALL_SKU sku) {

		skuMapper.insert_sku(sku);

		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("list_sku_av", list_sku_av);
		map.put("sku_id", sku.getId());
		map.put("spu_id", sku.getShp_id());
		skuMapper.insert_sku_av(map);
	}

}
