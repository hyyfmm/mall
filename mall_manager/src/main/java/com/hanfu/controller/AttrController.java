package com.hanfu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hanfu.bean.MODEL_OBJECT_T_MALL_ATTR;
import com.hanfu.bean.OBJECT_T_MALL_ATTR;
import com.hanfu.service.AttrServiceImp;

@Controller
public class AttrController {
	
	@Autowired
	AttrServiceImp attrServiceImp;
	
	@RequestMapping("get_attr_list")
	public String get_attr_list(int class_2_id, ModelMap map) {
		//根据二级分类查询属性列表
		List<OBJECT_T_MALL_ATTR> list_attr = attrServiceImp.get_attr_list_by_class_2(class_2_id);
		map.put("list_attr", list_attr);
		
		return "attr/manager_attr_list_inner";
	}
	
	@RequestMapping("get_attr_list_json")
	@ResponseBody
	public List<OBJECT_T_MALL_ATTR> get_attr_list_json(int class_2_id, ModelMap map) {

		// 根据二级分类查询属性列表
		List<OBJECT_T_MALL_ATTR> list_attr = attrServiceImp.get_attr_list_by_class_2(class_2_id);

		return list_attr;
	}
	
	@RequestMapping("goto_attr")
	public String goto_attr() {
		return "attr/manager_attr";
	}
	
	@RequestMapping("goto_attr_add")
	public String goto_attr_add(int class_2_id, ModelMap map) {
		String flmch2 = attrServiceImp.get_flmch2_by_attrId(class_2_id);
		map.put("class_2_id", class_2_id);
		map.put("flmch2", flmch2);
		return "attr/manager_attr_add";
	}
	
	@RequestMapping(value="save_attr", method=RequestMethod.POST)
	public String save_attr(int class_2_id, MODEL_OBJECT_T_MALL_ATTR list_attr, RedirectAttributes redirectAttributes) {
		//接收双重集合的表单参数
		//调用保存分类属性的业务
		attrServiceImp.save_attr(list_attr.getList_attr(), class_2_id);
		
		redirectAttributes.addFlashAttribute("url", "goto_attr.do");
		redirectAttributes.addFlashAttribute("title", "添加商品属性");
		//将该商品属性的二级分类名称返回给前端页面显示
		String flmch2 = attrServiceImp.get_flmch2_by_attrId(class_2_id);
		redirectAttributes.addFlashAttribute("success", "添加[" + flmch2 + "]的属性成功");
		
		return "redirect:/index.do";
	}
}
