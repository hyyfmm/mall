package com.hanfu.mapper;

import com.hanfu.bean.T_MALL_USER_ACCOUNT;

public interface LoginMapper {
	T_MALL_USER_ACCOUNT select_user(T_MALL_USER_ACCOUNT user);
}
