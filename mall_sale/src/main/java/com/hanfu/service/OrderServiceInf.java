package com.hanfu.service;

import java.math.BigDecimal;

import com.hanfu.bean.OBJECT_T_MALL_ORDER;
import com.hanfu.bean.T_MALL_ADDRESS;
import com.hanfu.exception.OverSaleException;

public interface OrderServiceInf {
	
	public void save_order(BigDecimal sum, T_MALL_ADDRESS address, OBJECT_T_MALL_ORDER order);

	public void pay_order(OBJECT_T_MALL_ORDER order) throws OverSaleException;
}
