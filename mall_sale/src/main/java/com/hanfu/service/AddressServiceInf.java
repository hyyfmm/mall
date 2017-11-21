package com.hanfu.service;

import java.util.List;

import com.hanfu.bean.T_MALL_ADDRESS;
import com.hanfu.bean.T_MALL_USER_ACCOUNT;

public interface AddressServiceInf {

	void add_address(T_MALL_ADDRESS address);

	List<T_MALL_ADDRESS> get_addresses_by_user_id(T_MALL_USER_ACCOUNT user);

	T_MALL_ADDRESS get_addresses_by_id(int address_id);

}
