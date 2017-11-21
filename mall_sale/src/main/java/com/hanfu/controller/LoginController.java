package com.hanfu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanfu.bean.T_MALL_SHOPPINGCAR;
import com.hanfu.bean.T_MALL_USER_ACCOUNT;
import com.hanfu.mapper.LoginMapper;
import com.hanfu.service.ShoppingCartServiceImp;
import com.hanfu.util.MyJsonUtil;

@Controller
public class LoginController {

	@Autowired
	LoginMapper loginMapper;
	
	@Autowired
	ShoppingCartServiceImp shoppingCartServiceImp;

	@RequestMapping("goto_login")
	public String goto_login() {
		return "sale_login";
	}

	@RequestMapping("login")
	public String login(@CookieValue(value = "list_cart_cookie", required = false) String list_cart_cookie, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session,
			T_MALL_USER_ACCOUNT user) {
		T_MALL_USER_ACCOUNT select_user = loginMapper.select_user(user);

		if (select_user == null) {
			// 用户名或者密码错误
			return "redirect:/login.do";
		} else {
			// 将用户对象放入session域中
			session.setAttribute("user", select_user);

			//将用户名称放入cookie中，主要是让用户下一次登陆网页的时候，能将用户名显示在页面
			Cookie cookie = null;
			try {
				cookie = new Cookie("yh_mch", 
						URLEncoder.encode(select_user.getYh_mch(), "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			cookie.setMaxAge(60 * 60);
			response.addCookie(cookie);
			
			List<T_MALL_SHOPPINGCAR> list_cart_db = shoppingCartServiceImp.get_list_cart_by_user(select_user);
			// 同步cookie和db中的购物车数据
			merge_cart(list_cart_cookie, response, session, list_cart_db);
		}

		return "redirect:/index.do";
	}
	
	@RequestMapping("goto_out")
	public String goto_out(HttpSession session) {
		//注销session
		session.invalidate();
		return "redirect:/goto_login.do";
	}
	
	private void merge_cart(String list_cart_cookie, HttpServletResponse response, HttpSession session,
			List<T_MALL_SHOPPINGCAR> list_cart_db) {
		List<T_MALL_SHOPPINGCAR> list_cart = new ArrayList<T_MALL_SHOPPINGCAR>();
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");

		if (list_cart_db == null || list_cart_db.size() == 0) {
			// 判断cookie
			if (StringUtils.isBlank(list_cart_cookie)) {
				// 结束
			} else {
				// 循环将cookie中的数据，插入db
				list_cart = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
				for (int i = 0; i < list_cart.size(); i++) {
					list_cart.get(i).setYh_id(user.getId());
					shoppingCartServiceImp.add_cart(list_cart.get(i));
				}
			}
		} else {
			// 判断cookie
			if (StringUtils.isBlank(list_cart_cookie)) {
				// 结束
			} else {
				list_cart = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
				// 循环cookie和db的购物车集合，判断是插入还是更新
				for (int i = 0; i < list_cart.size(); i++) {
					boolean b = if_new_cart(list_cart_db, list_cart.get(i));

					if (b) {
						list_cart.get(i).setYh_id(user.getId());
						shoppingCartServiceImp.add_cart(list_cart.get(i));
					} else {
						for (int j = 0; j < list_cart_db.size(); j++) {
							if (list_cart.get(i).getSku_id() == list_cart_db.get(j).getSku_id()) {
								list_cart_db.get(j)
										.setTjshl(list_cart_db.get(j).getTjshl() + list_cart.get(i).getTjshl());
								list_cart_db.get(j)
										.setHj(list_cart_db.get(j).getSku_jg() * list_cart_db.get(j).getTjshl());
								shoppingCartServiceImp.update_cart(list_cart_db.get(j));
							}
						}
					}
				}
			}
		}

		// 同步session，查询用户的购物车集合
		session.setAttribute("list_cart_session", shoppingCartServiceImp.get_list_cart_by_user(user));
		// 删除cookie
		response.addCookie(new Cookie("list_cart_cookie", ""));
	}

	private boolean if_new_cart(List<T_MALL_SHOPPINGCAR> list_cart_db, T_MALL_SHOPPINGCAR t_MALL_SHOPPINGCAR) {
		boolean b = true;

		for (int i = 0; i < list_cart_db.size(); i++) {
			if (list_cart_db.get(i).getSku_id() == t_MALL_SHOPPINGCAR.getSku_id()) {
				b = false;
			}
		}
		return b;
	}
}
