package com.hanfu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanfu.test.SendEmail;

@Controller
public class SendEmailController {

	@RequestMapping("sendEmail")
	@ResponseBody
	public boolean sendEmail(String email) {
		SendEmail sendEmail = new SendEmail();
		// 设置发件人地址、收件人地址和邮件标题
		sendEmail.setAddress("xjbvsxjb@163.com", email);
		boolean result = sendEmail.send("恭喜注册成功，您的激活码是61");
		
		return result;
	}
}
