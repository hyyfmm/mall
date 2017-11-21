package com.hanfu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hanfu.bean.T_MALL_PRODUCT;
import com.hanfu.service.SpuServiceInf;
import com.hanfu.util.MyUploadUtil;

@Controller
public class SpuController {
	
	@Autowired
	SpuServiceInf spuServiceImp;
	
	//跳转到商品管理页面
	@RequestMapping("goto_spu")
	public String goto_spu() {
		return "spu/manager_spu";
	}
	
	//添加商品信息页面
	@RequestMapping("goto_spu_add")
	public String goto_spu_add(String success, ModelMap map) {
		map.put("success", success);
		return "spu/manager_spu_add";
	}
	
	@RequestMapping(value="save_spu", method=RequestMethod.POST)
	public String save_spu(T_MALL_PRODUCT spu, @RequestParam("files") MultipartFile[] files, RedirectAttributes redirectAttributes) {
		//上传图片， 生成图片信息
		List<String> list_img_name = MyUploadUtil.upload_image(files);
		
		//保存spu信息和图片信息
		spuServiceImp.save_spu(spu, list_img_name);
		
		//ModelAndView mv = new ModelAndView("redirect:/index.do");
		//mv.addObject("url", "goto_spu_add.do");
		//mv.addObject("title", "添加商品信息");
		//使用addFlashAttribute()方法之后，参数不会显示在url地址中
		redirectAttributes.addFlashAttribute("url", "goto_spu_add.do");
		redirectAttributes.addFlashAttribute("title", "添加商品信息");
		
		//将该商品属性的二级分类名称返回给前端页面显示
		String flmch2 = spuServiceImp.get_flmch2_by_spuId(spu.getFlbh2());
		redirectAttributes.addFlashAttribute("success", "添加[" + flmch2 + "]商品成功");
		
		return "redirect:/index.do";
	}
}
