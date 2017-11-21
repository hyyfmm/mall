package com.hanfu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanfu.bean.MODEL_SKU_ATTR_VALUE;
import com.hanfu.bean.OBJECT_T_MALL_ATTR;
import com.hanfu.bean.OBJECT_T_MALL_CLASS_SKU;
import com.hanfu.bean.OBJECT_T_MALL_DETAIL_SKU;
import com.hanfu.bean.OBJECT_T_MALL_SKU_CLASS;
import com.hanfu.bean.T_MALL_SKU;
import com.hanfu.service.AttrServiceImp;
import com.hanfu.service.SearchServiceImp;

@Controller
public class SearchController {
	
	@Autowired
	AttrServiceImp attrServiceImp;
	
	@Autowired
	SearchServiceImp searchServiceImp;
	
	@RequestMapping("goto_search_class")
	public String goto_search_class(int class_2_id, String class_2_name, ModelMap map){
		//根据二级分类id获取属性信息
		List<OBJECT_T_MALL_ATTR> list_attr = attrServiceImp.get_attr_list_by_class_2(class_2_id);
		//根据二级分类id获取库存信息
		List<OBJECT_T_MALL_SKU_CLASS> list_sku = searchServiceImp.goto_search_class(class_2_id);
		
		map.put("class_2_id", class_2_id);
		map.put("class_2_name", class_2_name);
		map.put("list_attr", list_attr);
		map.put("list_sku", list_sku);
		
		return "search/sale_search";
	}
	
	@RequestMapping("search_by_attr")
	public String search_by_attr(String order, int class_2_id, MODEL_SKU_ATTR_VALUE list_attr_value, ModelMap map) {
		List<OBJECT_T_MALL_CLASS_SKU> list_sku = 
				searchServiceImp.search_by_attr(order, class_2_id, list_attr_value.getList_attr_value());
		
		map.put("list_sku", list_sku);
		return "search/sale_search_sku_list";
	}
	
	@RequestMapping("goto_sku_detail")
	public String goto_sku_detail(int sku_id, int spu_id, ModelMap map) {
		
		//调用商品的详情信息
		//当点击该商品的链接时，获取该商品的spu信息，sku信息，图片信息，属性规格信息
		OBJECT_T_MALL_DETAIL_SKU sku_detail = searchServiceImp.get_sku_detail(sku_id, spu_id);
		//获取一个spu_id下不同的库存信息
		List<T_MALL_SKU> sku_info = searchServiceImp.get_list_sku_by_spu_id(spu_id);
		
		map.put("sku_detail", sku_detail);
		map.put("sku_info", sku_info);
		return "search/sale_search_detail";
	}
}
