package com.hanfu.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.xml.resolver.helpers.PublicId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanfu.bean.T_MALL_SHOPPINGCAR;
import com.hanfu.bean.T_MALL_USER_ACCOUNT;
import com.hanfu.service.ShoppingCartServiceImp;
import com.hanfu.util.MyJsonUtil;

@Controller
public class ShoppingCartController {
	
	@Autowired
	ShoppingCartServiceImp shoppingCartServiceImp;
	
	@RequestMapping("add_cart")
	public String add_cart(@CookieValue(value="list_cart_cookie", required=false) String list_cart_cookie, 
			HttpServletResponse response, HttpSession session, T_MALL_SHOPPINGCAR shoppingcart) {
		//先从session中获取user对象   下面可以对用户是否登录进行判断
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		
		//用于存放购物车的信息
		List<T_MALL_SHOPPINGCAR> list_cart = new ArrayList<>();
		//购物车添加代码
		
		//分为两种情况
		if(user == null) {
			//先判断一下cookie是否为空
			if(list_cart_cookie == null || list_cart_cookie == "") {
				//添加cookie   全部放入一个list集合中
				list_cart.add(shoppingcart);
			} else {
				list_cart = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
				//判断是否已经存在该购物车信息，如果存在为false，否则为true
				boolean exists_cart = if_new_cart(list_cart, shoppingcart);
				if(exists_cart) {
					//购物车中已经有信息，但是没有这条，则添加
					list_cart.add(shoppingcart);
				} else {
					//如果有要添加的信息    则更新
					for (int i = 0; i < list_cart.size(); i++) {
						if(list_cart.get(i).getSku_id() == shoppingcart.getSku_id()) {
							list_cart.get(i).setTjshl(list_cart.get(i).getTjshl() + 1);
							list_cart.get(i).setHj(list_cart.get(i).getSku_jg() * list_cart.get(i).getTjshl());
						}
					}
				}
			}
			//添加cookie
			Cookie cookie = new Cookie("list_cart_cookie", MyJsonUtil.list_to_json(list_cart));
			cookie.setMaxAge(60*60);
			response.addCookie(cookie);
		} else {
			//用户已经登录，将要添加的信息更新数据库，然后在同步session
			list_cart = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
			
			//分两步进行， 判断db是否为空
			if(list_cart == null || list_cart.size() == 0) {
				//往db中添加数据
				shoppingCartServiceImp.add_cart(shoppingcart);
				//同步session
				list_cart.add(shoppingcart);
			} else {
				//db中有数据  ,如果为真，表示没有相同数据
				boolean exists_cart = if_new_cart(list_cart, shoppingcart);
				if(exists_cart) {
					//往db中添加数据
					shoppingCartServiceImp.add_cart(shoppingcart);
					//同步session
					list_cart.add(shoppingcart);
				} else {
					//for循环，更新db，然后同步session
					for (int i = 0; i < list_cart.size(); i++) {
						if(list_cart.get(i).getSku_id() == shoppingcart.getSku_id()) {
							list_cart.get(i).setTjshl(list_cart.get(i).getTjshl() + 1);
							list_cart.get(i).setHj(list_cart.get(i).getTjshl() * list_cart.get(i).getSku_jg());
							shoppingCartServiceImp.update_cart(list_cart.get(i));
						}
					}
				}
			}
		}
		
		return "redirect:/add_cart_success.do";
	}
	
	@RequestMapping("add_cart_success")
	public String add_cart_success() {
		return "shoppingcart/sale_cart_success";
	}
	
	//判断将要添加的购物车信息在以往的购物车集合中是否包含
	private boolean if_new_cart(List<T_MALL_SHOPPINGCAR> list_cart, T_MALL_SHOPPINGCAR cart) {
		boolean flag = true;
		for (int i = 0; i < list_cart.size(); i++) {
			if(cart.getSku_id() == list_cart.get(i).getSku_id()) {
				flag = false;
			}
		}
		return flag;
	}
	
	//迷你购物车，当鼠标放到购物车上，动态的显示购物车中的信息
	@RequestMapping("miniCart")
	public String miniCart(ModelMap map, HttpSession session,
			@CookieValue(value="list_cart_cookie", required=false) String list_cart_cookie) {
		T_MALL_USER_ACCOUNT user_ACCOUNT = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		List<T_MALL_SHOPPINGCAR> list_cart = new ArrayList<>();
		
		//分两步，判断用户是否登录
		if(user_ACCOUNT == null) {
			//用户未登录，从cookie中获取数据
			list_cart = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
		} else {
			//用户登录， 从session中获取数据
			list_cart = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
		}
		map.put("list_cart", list_cart);
		return "shoppingcart/sale_miniCart_list";
	}
	
	//点击购物车时，去往购物车的页面
	@RequestMapping("goto_cart_list")
	public String goto_cart_list(ModelMap map, HttpSession session,
			@CookieValue(value="list_cart_cookie", required=false) String list_cart_cookie) {
		//先从session中获取用户信息
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		List<T_MALL_SHOPPINGCAR> list_cart = new ArrayList<>();
		
		//去往购物车页面，分为两步，当用户未登录，从cookie中获取，用户登录的时候，从session中获取
		if(user == null) {
			list_cart = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
			if(list_cart == null || list_cart.size() == 0) {
				return "shoppingcart/sale_null_cart";
			}
		} else {
			list_cart = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
			if(list_cart == null || list_cart.size() == 0) {
				return "shoppingcart/sale_null_cart";
			}
		}
		map.put("list_cart", list_cart);
		map.put("sum", cart_sum(list_cart));
		return "shoppingcart/sale_cart_list";
	}
	
	//将用户购物车中的商品合计金额信息返回给页面
	private BigDecimal cart_sum(List<T_MALL_SHOPPINGCAR> list_cart) {
		BigDecimal sum = new BigDecimal("0");
		for (int i = 0; i < list_cart.size(); i++) {
			if(list_cart.get(i).getShfxz().equals("1")) {
				sum = sum.add(new BigDecimal("" + list_cart.get(i).getHj()));
			}
		}
		return sum;
	}
	
	//更新购物车列表
	@RequestMapping("item_check")
	public String item_check(ModelMap map, HttpServletResponse response,
			HttpSession session, String shfxz, int sku_id, int tjshl, double sku_jg,
			@CookieValue(value="list_cart_cookie", required=false) String list_cart_cookie) {
		//先从session中获取用户信息
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		List<T_MALL_SHOPPINGCAR> list_cart = new ArrayList<>();
		
		//更新购物车信息
		T_MALL_SHOPPINGCAR cart = new T_MALL_SHOPPINGCAR();
		cart.setSku_id(sku_id);
		if(tjshl == -1) {
			//更新选中状态
			cart.setShfxz(shfxz);
		} else {
			//更新数量
			cart.setTjshl(tjshl);
			cart.setHj(tjshl * sku_jg);
		}
		
		if(user == null) {
			list_cart = MyJsonUtil.json_to_list(list_cart_cookie, T_MALL_SHOPPINGCAR.class);
			//用户没登录时，更新cookie
			for (int i = 0; i < list_cart.size(); i++) {
				if(list_cart.get(i).getSku_id() == sku_id) {
					if(tjshl == -1) {
						list_cart.get(i).setShfxz(shfxz);
					} else {
						list_cart.get(i).setTjshl(tjshl);
						list_cart.get(i).setHj(tjshl * sku_jg);
					}
				}
			}
			// 覆盖cookie
			Cookie cookie = new Cookie("list_cart_cookie", MyJsonUtil.list_to_json(list_cart));
			cookie.setMaxAge(60 * 60);
			response.addCookie(cookie);
		} else {
			// 用户已经登陆，更新数据库和session
			shoppingCartServiceImp.update_cart(cart);
			list_cart = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
			// 更新session
			for (int i = 0; i < list_cart.size(); i++) {
				if (list_cart.get(i).getSku_id() == sku_id) {
					if (tjshl == -1) {
						list_cart.get(i).setShfxz(shfxz);
					} else {
						list_cart.get(i).setTjshl(tjshl);
						list_cart.get(i).setHj(tjshl * sku_jg);
					}
				}
			}
		}

		map.put("list_cart", list_cart);
		map.put("sum", cart_sum(list_cart));
		return "shoppingcart/sale_cart_list_inner";
	}
}
