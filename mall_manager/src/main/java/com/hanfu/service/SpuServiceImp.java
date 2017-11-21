package com.hanfu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanfu.bean.T_MALL_PRODUCT;
import com.hanfu.mapper.SpuMapper;

@Service
public class SpuServiceImp implements SpuServiceInf {

	@Autowired
	SpuMapper spuMapper;
	
	@Override
	public void save_spu(T_MALL_PRODUCT spu, List<String> list_image_name) {
		//保存spu信息，生成id
		spu.setShp_tp(list_image_name.get(0));
		spuMapper.insert_spu(spu);

		//根据spuid批量保存图片集合
		spuMapper.insert_spu_image(spu, list_image_name);
		
	}

	@Override
	public List<T_MALL_PRODUCT> get_spu_test() {
		List<T_MALL_PRODUCT> list_spu = spuMapper.select_spu_test();
		return list_spu;
	}

	//通过二级分类的id获取二级分类的分类名称
	@Override
	public String get_flmch2_by_spuId(int id) {
		String flmch2 = spuMapper.select_flmch2_by_spuId(id);
		return flmch2;
	}
	
}
