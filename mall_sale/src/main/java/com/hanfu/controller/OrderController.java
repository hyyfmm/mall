package com.hanfu.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hanfu.bean.OBJECT_T_MALL_FLOW;
import com.hanfu.bean.OBJECT_T_MALL_ORDER;
import com.hanfu.bean.T_MALL_ADDRESS;
import com.hanfu.bean.T_MALL_ORDER_INFO;
import com.hanfu.bean.T_MALL_SHOPPINGCAR;
import com.hanfu.bean.T_MALL_USER_ACCOUNT;
import com.hanfu.exception.OverSaleException;
import com.hanfu.service.AddressServiceImp;
import com.hanfu.service.OrderServiceImp;
import com.hanfu.service.ShoppingCartServiceImp;

@Controller
@SessionAttributes("order")
public class OrderController {
	
	@Autowired
	AddressServiceImp addressServiceImp;
	
	@Autowired
	OrderServiceImp orderServiceImp;
	
	@Autowired
	ShoppingCartServiceImp shoppingCartServiceImp;

	@RequestMapping("goto_order")
	public String goto_order(BigDecimal sum, HttpSession session, ModelMap map) {
		//先获取用户信息
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		//获取一下用户上得地址信息
		List<T_MALL_ADDRESS> list_address = addressServiceImp.get_addresses_by_user_id(user);
		//从session中获取购物车信息
		List<T_MALL_SHOPPINGCAR> list_cart = (List<T_MALL_SHOPPINGCAR>) session.getAttribute("list_cart_session");
		
		// 拆分订单
		OBJECT_T_MALL_ORDER order = new OBJECT_T_MALL_ORDER();
		order.setZje(sum);
		order.setYh_id(user.getId());
		order.setJdh(1);
		List<OBJECT_T_MALL_FLOW> list_flow = new ArrayList<OBJECT_T_MALL_FLOW>();
		
		// 拆单规则，按库存地址拆单
		Set<String> kcdz_set = new HashSet<String>();
		for (int i = 0; i < list_cart.size(); i++) {
			kcdz_set.add(list_cart.get(i).getKcdz());
		}
		
		Iterator<String> iterator = kcdz_set.iterator();
		while (iterator.hasNext()) {
			String kcdz = iterator.next();
			OBJECT_T_MALL_FLOW flow = new OBJECT_T_MALL_FLOW();
			flow.setPsfsh("hanfu快递");
			flow.setYh_id(user.getId());
			flow.setMqdd("商品未出库");
			List<T_MALL_ORDER_INFO> list_info = new ArrayList<T_MALL_ORDER_INFO>();
			for (int i = 0; i < list_cart.size(); i++) {
				if (list_cart.get(i).getShfxz().equals("1") && list_cart.get(i).getKcdz().equals(kcdz)) {
					T_MALL_ORDER_INFO info = new T_MALL_ORDER_INFO();
					info.setGwch_id(list_cart.get(i).getId());
					info.setShp_tp(list_cart.get(i).getShp_tp());
					info.setSku_id(list_cart.get(i).getSku_id());
					info.setSku_jg(list_cart.get(i).getSku_jg());
					info.setSku_kcdz(list_cart.get(i).getKcdz());
					info.setSku_mch(list_cart.get(i).getSku_mch());
					info.setSku_shl(list_cart.get(i).getTjshl());
					list_info.add(info);
				}
			}
			flow.setList_info(list_info);
			list_flow.add(flow);
		}

		order.setList_flow(list_flow);
		map.put("list_address", list_address);
		map.put("order", order);
		return "order/sale_order_confirm";
	}
	
	@RequestMapping("check_order")
	public String check_order(HttpSession session, BigDecimal sum, int address_id,
			@ModelAttribute("order") OBJECT_T_MALL_ORDER order) {
		//获取用户信息
		T_MALL_USER_ACCOUNT user = (T_MALL_USER_ACCOUNT) session.getAttribute("user");
		
		//收货地址信息
		T_MALL_ADDRESS address = addressServiceImp.get_addresses_by_id(address_id);
		
		orderServiceImp.save_order(sum, address, order);
		
		//同步session
		session.setAttribute("list_cart_session", shoppingCartServiceImp.get_list_cart_by_user(user));
		
		return "redirect:/goto_pay.do";
	}
	
	@RequestMapping("goto_pay")
	public String goto_pay(@ModelAttribute("order") OBJECT_T_MALL_ORDER order, BigDecimal sum, HttpSession session,
			HttpServletRequest request, ModelMap map) {

		return "order/sale_order_pay";
	}
	
	@RequestMapping("pay_order")
	public String pay_order(@ModelAttribute("order") OBJECT_T_MALL_ORDER order, BigDecimal sum, HttpSession session,
			HttpServletRequest request, ModelMap map) {

		// 支付减库存的业务
		try {
			orderServiceImp.pay_order(order);
		} catch (OverSaleException e) {

			if (e.getMessage().equals("over sale")) {
				return "redirect:/pay_order_over_sale.do";
			}
		}

		return "redirect:/pay_order_success.do";
	}

	@RequestMapping("pay_order_success")
	public String pay_order_success(@ModelAttribute("order") OBJECT_T_MALL_ORDER order, BigDecimal sum,
			HttpSession session, HttpServletRequest request, ModelMap map) {

		return "order/sale_pay_order_success";
	}

	@RequestMapping("pay_order_over_sale")
	public String pay_order_over_sale(@ModelAttribute("order") OBJECT_T_MALL_ORDER order, BigDecimal sum,
			HttpSession session, HttpServletRequest request, ModelMap map) {

		return "order/sale_pay_order_over_sale";
	}
}
