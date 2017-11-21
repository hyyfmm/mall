<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){
		//加载一级分类的列表
		$.getJSON("js/json/class_1.js", function(data){
			$(data).each(function(i, json){
				$("#sku_class_1_select").append("<option value=" + json.id + ">" + json.flmch1 + "</option>");
			});
		})
	});
	
	function sku_get_class_2(class_1_id) {
		//加载二级分类的列表选项
		$.getJSON("js/json/class_2_" + class_1_id + ".js", function(data){
			$("#sku_class_2_select").empty();
			$("#sku_class_2_select").append("<option>请选择二级分类</option>");
			$(data).each(function(i,json){
				$("#sku_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
			})
		})
		sku_tm_select(class_1_id);
	}
	
	function sku_tm_select(class_1_id) {
		//加载二级分类的列表选项
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js", function(data){
			$("#sku_tm_select").empty();
			$("#sku_tm_select").append("<option>请选择品牌</option>");
			$(data).each(function(i, json) {
				$("#sku_tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>");
			})
		})
	}
	
	function sku_get_attr_by_class(class_2_id){
		$.post("sku_get_attr.do", {class_2_id:class_2_id}, function(data){
			$("#attr_attr_list_inner").html(data);
		})
	}
	
	function sku_get_spu(){
		var class_1_id = $("#sku_class_1_select").val();
		var class_2_id = $("#sku_class_2_select").val();
		var tm_id = $("#sku_tm_select").val();
		
		$.post("sku_get_spu.do",{class_1_id:class_1_id,class_2_id:class_2_id,pp_id:tm_id}, function(data){
			$("#sku_spu_select").empty();
			$("#sku_spu_select").append("<option>请选择商品</option>");
			$(data).each(function(i, json){
				$("#sku_spu_select").append("<option value="+json.id+">"+json.shp_mch+"</option>");
			})
		})
	}
</script>
<title>hanfu商城</title>
</head>
<body>
	<h3>发布库存信息</h3><br>
	<form action="save_sku.do" method="post">
		<a style="font-size: 14px">选择商品的分类:</a>&nbsp;&nbsp;
		<select name="flbh1" id="sku_class_1_select" onchange="sku_get_class_2(this.value)" style="width: 150px">
			<option>请选择一级分类</option>
		</select>&nbsp;&nbsp;
		
		<select name="flbh2" id="sku_class_2_select" onchange="sku_get_attr_by_class(this.value)" style="width: 150px">
			<option>请选择二级分类</option>
		</select>&nbsp;&nbsp;
		
		<select name="pp_id" id="sku_tm_select" onchange="sku_get_spu()" style="width: 150px">
			<option>请选择品牌</option>
		</select>&nbsp;&nbsp;
		
		<select name="shp_id" id="sku_spu_select" style="width: 150px">
			<option>请选择商品</option>
		</select>&nbsp;&nbsp;
		
		<div id="attr_attr_list_inner"></div>
	</form>
</body>
</html>