package com.hanfu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hanfu.bean.MODEL_SKU_ATTR_VALUE;
import com.hanfu.bean.OBJECT_T_MALL_ATTR;
import com.hanfu.bean.T_MALL_PRODUCT;
import com.hanfu.bean.T_MALL_SKU;
import com.hanfu.bean.T_MALL_SKU_ATTR_VALUE;
import com.hanfu.service.AttrServiceImp;
import com.hanfu.service.SkuServiceImp;

@Controller
public class SkuController {
	
	@Autowired
	SkuServiceImp skuServiceImp;
	
	@Autowired
	AttrServiceImp attrServiceImp;
	
	@RequestMapping("goto_sku")
	public String goto_sku() {
		return "sku/manager_sku";
	}
	
	@RequestMapping("sku_get_attr")
	public String sku_get_attr(int class_2_id, ModelMap map) {
		List<OBJECT_T_MALL_ATTR> list_attr = attrServiceImp.get_attr_list_by_class_2(class_2_id);
		
		map.put("list_attr", list_attr);
		return "sku/manager_sku_attr_inner";
	}
	
	@RequestMapping("sku_get_spu")
	@ResponseBody
	public List<T_MALL_PRODUCT> sku_get_spu(int class_2_id, int class_1_id, int pp_id) {

		List<T_MALL_PRODUCT> list_spu = skuServiceImp.sku_get_spu(class_2_id, class_1_id, pp_id);

		return list_spu;
	}
	
	@RequestMapping("save_sku")
	public String save_sku(MODEL_SKU_ATTR_VALUE list_attr_value, T_MALL_SKU sku, RedirectAttributes redirectAttributes) {
		
		List<T_MALL_SKU_ATTR_VALUE> attr_values = list_attr_value.getList_attr_value();
		//排除一些没有选属性的对象,放在一个新的list集合中传递
		List<T_MALL_SKU_ATTR_VALUE> new_attr_values = new ArrayList<>();
		
		for (T_MALL_SKU_ATTR_VALUE attr_value : attr_values) {
			if(attr_value.getShxm_id() != 0 && attr_value.getShxzh_id() != 0) {
				new_attr_values.add(attr_value);
			}
		}
		if(new_attr_values.size() > 0) {
			skuServiceImp.save_sku(new_attr_values, sku);
		}
		redirectAttributes.addFlashAttribute("url", "goto_sku.do");
		redirectAttributes.addFlashAttribute("title", "添加sku信息");
		redirectAttributes.addFlashAttribute("success", "发布库存信息成功");
		return "redirect:/index.do";
	}
}
