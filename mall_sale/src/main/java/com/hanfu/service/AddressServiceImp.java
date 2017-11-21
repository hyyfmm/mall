package com.hanfu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanfu.bean.T_MALL_ADDRESS;
import com.hanfu.bean.T_MALL_USER_ACCOUNT;
import com.hanfu.mapper.AddressMapper;

@Service
public class AddressServiceImp implements AddressServiceInf {

	@Autowired
	AddressMapper addressMapper;
	
	// 业务层的bean

	@Override
	public void add_address(T_MALL_ADDRESS address) {
		addressMapper.insert_address(address);

	}

	@Override
	public List<T_MALL_ADDRESS> get_addresses_by_user_id(T_MALL_USER_ACCOUNT user) {
		List<T_MALL_ADDRESS> select_addresses_by_user_id = addressMapper.select_addresses_by_user_id(user);
		return select_addresses_by_user_id;
	}

	@Override
	public T_MALL_ADDRESS get_addresses_by_id(int address_id) {
		T_MALL_ADDRESS select_addresses_by_id = addressMapper.select_addresses_by_id(address_id);
		return select_addresses_by_id;
	}
}
