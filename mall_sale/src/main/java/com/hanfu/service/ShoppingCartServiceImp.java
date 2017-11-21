package com.hanfu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanfu.bean.T_MALL_SHOPPINGCAR;
import com.hanfu.bean.T_MALL_USER_ACCOUNT;
import com.hanfu.mapper.ShoppingCartMapper;

@Service
public class ShoppingCartServiceImp implements ShoppingCartServiceInf {
	
	@Autowired
	ShoppingCartMapper shoppingCartMapper;

	@Override
	public void add_cart(T_MALL_SHOPPINGCAR cart) {
		shoppingCartMapper.insert_cart(cart);
	}

	@Override
	public void update_cart(T_MALL_SHOPPINGCAR cart) {
		shoppingCartMapper.update_cart(cart);
	}

	@Override
	public List<T_MALL_SHOPPINGCAR> get_list_cart_by_user(T_MALL_USER_ACCOUNT user) {
		List<T_MALL_SHOPPINGCAR> list_cart = shoppingCartMapper.select_list_cart_by_user_id(user);
		return list_cart;
	}
	
}
