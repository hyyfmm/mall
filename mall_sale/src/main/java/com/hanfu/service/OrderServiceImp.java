package com.hanfu.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanfu.bean.OBJECT_T_MALL_FLOW;
import com.hanfu.bean.OBJECT_T_MALL_ORDER;
import com.hanfu.bean.T_MALL_ADDRESS;
import com.hanfu.bean.T_MALL_ORDER_INFO;
import com.hanfu.exception.OverSaleException;
import com.hanfu.mapper.OrderMapper;
import com.hanfu.util.MyDataUtil;

@Service
public class OrderServiceImp implements OrderServiceInf {

	@Autowired
	OrderMapper orderMapper;
	
	@Override
	public void save_order(BigDecimal sum, T_MALL_ADDRESS address, OBJECT_T_MALL_ORDER order) {
		// 保存订单表，返回主键
		// shhr
		// zje
		// jdh
		// yh_id
		// dzh_id
		// dzh_mch
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("order", order);
		map.put("address", address);
		orderMapper.insert_order(map);

		List<OBJECT_T_MALL_FLOW> list_flow = order.getList_flow();
		for (int i = 0; i < list_flow.size(); i++) {
			// 保存物流表 ,返回主键
			// psfsh
			// psshj
			// yh_id
			// dd_id
			// mqdd
			// mdd
			list_flow.get(i).setDd_id(order.getId());
			Map<Object, Object> map1 = new HashMap<Object, Object>();
			map1.put("dd_id", order.getId());
			map1.put("flow", list_flow.get(i));
			orderMapper.insert_flow(map1);

			// 保存订单信息表
			// 物流id-flow_id
			List<T_MALL_ORDER_INFO> list_info = list_flow.get(i).getList_info();
			Map<Object, Object> map2 = new HashMap<Object, Object>();
			map2.put("flow_id", list_flow.get(i).getId());
			map2.put("list_info", list_info);
			orderMapper.insert_infos(map2);

			// 把已经生成订单的商品信息从购物车中删除
			List<Integer> list_gwc_id = new ArrayList<Integer>();
			for (int j = 0; j < list_info.size(); j++) {
				int gwch_id = list_info.get(j).getGwch_id();
				list_gwc_id.add(gwch_id);
			}
			orderMapper.delete_shoppingCart(list_gwc_id);
		}
	}

	@Override
	public void pay_order(OBJECT_T_MALL_ORDER order) throws OverSaleException {

		// 修改订单状态
		// 进度号、预计送达时间
		order.setJdh(2);
		order.setYjsdshj(MyDataUtil.getMyDate(3));
		orderMapper.update_order(order);

		// 修改物流信息
		// psshj
		// psmsh
		// mqdd
		// mdd
		// ywy
		// lxfsh
		List<OBJECT_T_MALL_FLOW> list_flow = order.getList_flow();

		for (int i = 0; i < list_flow.size(); i++) {
			// 修改库存信息
			List<T_MALL_ORDER_INFO> list_info = list_flow.get(i).getList_info();
			for (int j = 0; j < list_info.size(); j++) {
				// 查询库存剩余数量
				long kc = get_kc(list_info.get(j).getSku_id());
				if (kc >= list_info.get(j).getSku_shl()) {
					// 修改库存数量
					orderMapper.update_kc(list_info.get(j));
				} else {
					// 事务回滚，返回订单失败通知，购买数量大于库存
					throw new OverSaleException("over sale");
				}
			}
			list_flow.get(i).setPsshj(MyDataUtil.getMyDate(1));
			list_flow.get(i).setPsmsh("商品准备发货");
			list_flow.get(i).setMqdd("商品已出库");
			list_flow.get(i).setMdd(order.getDzh_mch());
			list_flow.get(i).setYwy("老佟");
			list_flow.get(i).setLxfsh("123123123123");
			orderMapper.update_flow(list_flow.get(i));
		}
	}
	
	private long get_kc(int sku_id) {
		long select_kc = orderMapper.select_kc_for_update(sku_id);
		return select_kc;
	}

}
