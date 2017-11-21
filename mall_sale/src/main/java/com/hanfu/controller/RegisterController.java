package com.hanfu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanfu.bean.T_MALL_USER_ACCOUNT;
import com.hanfu.mapper.RegisterMapper;

@Controller
public class RegisterController {
	
	@Autowired
	RegisterMapper registerMapper;
	
	@RequestMapping("goto_register")
	public String goto_register() {
		return "register/register_user";
	}
	
	@RequestMapping("register_user")
	public String register_user(T_MALL_USER_ACCOUNT user) {
		registerMapper.register_user(user);
		return "redirect:/index.do";
	}
}
