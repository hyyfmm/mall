package com.hanfu.service;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanfu.bean.OBJECT_T_MALL_CLASS_SKU;
import com.hanfu.bean.OBJECT_T_MALL_DETAIL_SKU;
import com.hanfu.bean.OBJECT_T_MALL_SKU_CLASS;
import com.hanfu.bean.T_MALL_SKU;
import com.hanfu.bean.T_MALL_SKU_ATTR_VALUE;
import com.hanfu.mapper.SearchMapper;

@Service
public class SearchServiceImp implements SearchServiceInf {
	
	@Autowired
	SearchMapper searchMapper;

	@Override
	public List<OBJECT_T_MALL_SKU_CLASS> goto_search_class(int class_2_id) {
		List<OBJECT_T_MALL_SKU_CLASS> list_sku = searchMapper.select_search_class(class_2_id);
		return list_sku;
	}

	@Override
	public List<OBJECT_T_MALL_CLASS_SKU> search_by_attr(String order, int class_2_id,
			List<T_MALL_SKU_ATTR_VALUE> list_attr_value) {
		StringBuffer sql_sb = new StringBuffer();

		// 根据分类属性参数动态拼接sql语句
		if (list_attr_value == null || list_attr_value.size() == 0) {

		} else {
			sql_sb.append(" and sku.id in ");
			sql_sb.append(" ( ");
			sql_sb.append(" select sku_0.sku_id from ");
			for (int i = 0; i < list_attr_value.size(); i++) {
				sql_sb.append(" (select sku_id from t_mall_sku_attr_value where shxm_id = "
						+ list_attr_value.get(i).getShxm_id() + " and shxzh_id = "
						+ list_attr_value.get(i).getShxzh_id() + ") sku_" + i + " ");

				if (i < list_attr_value.size() - 1) {
					sql_sb.append(" , ");
				}
			}
			if (list_attr_value.size() > 1) {
				sql_sb.append(" where ");
				for (int j = 0; j < list_attr_value.size(); j++) {

					if (j < list_attr_value.size() - 1) {
						sql_sb.append(" sku_" + j + ".sku_id=sku_" + (j + 1) + ".sku_id");
					}

					if (list_attr_value.size() > 2 && j < list_attr_value.size() - 2) {
						sql_sb.append(" and ");
					}
				}
			}

			sql_sb.append(" ) ");
		}

		System.err.println(sql_sb.toString());
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("class_2_id", class_2_id);
		hashMap.put("sql", sql_sb.toString());

		if (StringUtils.isNotBlank(order)) {
			hashMap.put("order", order);
		}

		List<OBJECT_T_MALL_CLASS_SKU> list_sku = searchMapper.select_by_attr(hashMap);
		return list_sku;
	}

	@Override
	public OBJECT_T_MALL_DETAIL_SKU get_sku_detail(int sku_id, int spu_id) {
		HashMap<Object, Object> sku_detail_map = new HashMap<>();
		sku_detail_map.put("sku_id", sku_id);
		sku_detail_map.put("spu_id", spu_id);
		OBJECT_T_MALL_DETAIL_SKU select_sku_detail = searchMapper.select_sku_detail(sku_detail_map);
		return select_sku_detail;
	}

	@Override
	public List<T_MALL_SKU> get_list_sku_by_spu_id(int spu_id) {
		List<T_MALL_SKU> list_sku_info = searchMapper.select_list_sku_by_spu_id(spu_id);
		return list_sku_info;
	}

}
