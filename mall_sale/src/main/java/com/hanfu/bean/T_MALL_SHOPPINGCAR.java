package com.hanfu.bean;

import java.util.Date;

public class T_MALL_SHOPPINGCAR {
	private int id;
	private String sku_mch;  //sku名称
	private double sku_jg;   //sku价格
	private int tjshl;		 //添加数量
	private double hj;		 //合计，主要是对金额的累加
	private int yh_id;		 //用户的id，当用户登录的时候获取
	private int shp_id;		 //商品的id
	private Date chjshj;	 //创建时间，这里默认的时间为当前时间
	private int sku_id;		 //sku的id，可以唯一确定一件商品
	private String shp_tp;	 //商品图片
	private String shfxz;	 //是否选中，可以通过是否选中，从而对hj进行变化
	private String kcdz;	 //库存地址

	public String getKcdz() {
		return kcdz;
	}

	public void setKcdz(String kcdz) {
		this.kcdz = kcdz;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSku_mch() {
		return sku_mch;
	}

	public void setSku_mch(String sku_mch) {
		this.sku_mch = sku_mch;
	}

	public double getSku_jg() {
		return sku_jg;
	}

	public void setSku_jg(double sku_jg) {
		this.sku_jg = sku_jg;
	}

	public int getTjshl() {
		return tjshl;
	}

	public void setTjshl(int tjshl) {
		this.tjshl = tjshl;
	}

	public double getHj() {
		return hj;
	}

	public void setHj(double hj) {
		this.hj = hj;
	}

	public int getYh_id() {
		return yh_id;
	}

	public void setYh_id(int yh_id) {
		this.yh_id = yh_id;
	}

	public int getShp_id() {
		return shp_id;
	}

	public void setShp_id(int shp_id) {
		this.shp_id = shp_id;
	}

	public Date getChjshj() {
		return chjshj;
	}

	public void setChjshj(Date chjshj) {
		this.chjshj = chjshj;
	}

	public int getSku_id() {
		return sku_id;
	}

	public void setSku_id(int sku_id) {
		this.sku_id = sku_id;
	}

	public String getShp_tp() {
		return shp_tp;
	}

	public void setShp_tp(String shp_tp) {
		this.shp_tp = shp_tp;
	}

	public String getShfxz() {
		return shfxz;
	}

	public void setShfxz(String shfxz) {
		this.shfxz = shfxz;
	}

}
