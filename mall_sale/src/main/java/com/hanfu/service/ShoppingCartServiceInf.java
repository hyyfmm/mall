package com.hanfu.service;

import java.util.List;

import com.hanfu.bean.T_MALL_SHOPPINGCAR;
import com.hanfu.bean.T_MALL_USER_ACCOUNT;

public interface ShoppingCartServiceInf {
	
	void add_cart(T_MALL_SHOPPINGCAR cart);

	void update_cart(T_MALL_SHOPPINGCAR cart);
	
	//当用户在登录的时候同步session时使
	List<T_MALL_SHOPPINGCAR> get_list_cart_by_user(T_MALL_USER_ACCOUNT user);
}
