package com.hanfu.mapper;

import java.util.List;

import com.hanfu.bean.T_MALL_SHOPPINGCAR;
import com.hanfu.bean.T_MALL_USER_ACCOUNT;

public interface ShoppingCartMapper {
	
	//往购物车中插入数据
	void insert_cart(T_MALL_SHOPPINGCAR cart);
	
	//将购物车信息更新
	void update_cart(T_MALL_SHOPPINGCAR cart);
	
	//用户在登录状态，同步session往数据库中查询
	List<T_MALL_SHOPPINGCAR> select_list_cart_by_user_id(T_MALL_USER_ACCOUNT user);
}
