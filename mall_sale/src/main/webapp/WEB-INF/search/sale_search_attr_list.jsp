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
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function class_search_up(attr_id, val_id, param_name) {
		//增加属性参数
		var attr_title = "<span id='search_shxmch_"+attr_id+"' style='cursor: pointer;'>";
		var attr_shx = "<input type='text' name='attr_param' value='{\"shxm_id\":"+attr_id+",\"shxzh_id\":"+val_id+"}'/>";
		var attr_shxmch = "<a href='javascript:class_search_down(" + attr_id + ");'>" + param_name + "</a></span>";
		$("#class_search_attr_param").append(attr_title + attr_shx + attr_shxmch);
		$("#class_search_attr_" + attr_id).hide();
		
		//ajax异步检索
		class_search_by_attr();	
	}
	
	function class_search_down(attr_id) {
		//减少属性参数
		$("#class_search_attr_" + attr_id).show();
		$("#search_shxmch_" + attr_id).remove();
		
		//ajax异步检索
		class_search_by_attr();	
	}
	
	function class_search_by_attr() {
		//获取存储的参数
		var param = "class_2_id="+${class_2_id}+"&order="+$("#class_search_order").val();
		$("#class_search_attr_param input[name='attr_param']").each(function(i,json){
			var object = jQuery.parseJSON(json.value);
			param = param +"&list_attr_value["+i+"].shxm_id="+object.shxm_id+"&list_attr_value["+i+"].shxzh_id="+object.shxzh_id;
		});
		
		//ajax异步检索
		var url = "search_by_attr.do";
		$.ajax({
			url:url,
			data:param,
			success:function(data){
 				$("#sale_search_sku_list").html(data);
 			}
		});
	}
	
	function class_search_order(new_order) {
		//改变排序参数，当用户点击一次时，下一次点击的时候，转换排序，升序变降序，降序变升序
		var old_order = $("#class_search_order").val();
		if(new_order == old_order) {
			new_order = new_order + " desc ";
		}
		$("#class_search_order").val(new_order);
		class_search_by_attr();
	}
</script>
<title>hanfu商城</title>
</head>
<body>
	${class_2_id}${class_2_name}<br>
	<div id="class_search_attr_param"></div>
	<input id="class_search_order" type="hidden" value=" order by jg " />
	<hr>
	<c:forEach items="${list_attr}" var="attr">
		<div id="class_search_attr_${attr.id}">
			${attr.shxm_mch}:
			<c:forEach items="${attr.list_value}" var="val">
				<a href="javascript:class_search_up(${attr.id}, ${val.id}, '${attr.shxm_mch}:${val.shxzh}${val.shxzh_mch}');">${val.shxzh}${val.shxzh_mch}</a>
			</c:forEach>
			<br>
		</div>
	</c:forEach>
	<hr>
	<a href="javascript:class_search_order(' order by sku_xl ');">销量</a>  
	<a href="javascript:class_search_order(' order by jg ');">价格 </a> 
	<a href="javascript:class_search_order(' order by plsh ');">评论数 </a> 
	<a href="javascript:class_search_order(' order by sku.chjshj ');">上架时间</a> 
</body>
</html>