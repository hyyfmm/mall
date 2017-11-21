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
	function sku_attr_inner_check(attr_id,check){
		if(check){
			$("#sku_val_"+attr_id).show();
		}else{
			$("#sku_val_"+attr_id).hide();
		}
	}
</script>
<title>hanfu商城</title>
</head>
<body>
	<a style="font-size: 14px">分类属性列表</a><br>
	<c:forEach items="${list_attr}" var="attr" varStatus="index">
		<input type="checkbox" name="list_attr_value[${index.index}].shxm_id"  value="${attr.id}" onclick="sku_attr_inner_check(${attr.id},this.checked)"/>${attr.shxm_mch}
	</c:forEach>
	<hr>
	<c:forEach items="${list_attr}" var="attr" varStatus="index">
		<div id="sku_val_${attr.id}" style="display:none;">
			${attr.shxm_mch}:
			<c:forEach items="${attr.list_value}" var="val">
				<input type="radio" name="list_attr_value[${index.index}].shxzh_id" value="${val.id}"/>${val.shxzh}${val.shxzh_mch}
			</c:forEach>
			<br>
		</div>
	</c:forEach>
	<hr>
	<a style="font-size: 14px">商品库存名称：&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<input name="sku_mch" type="text" /><br><br>
	<a style="font-size: 14px">商品库存数量：&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<input name="kc" type="text" /><br><br>
	<a style="font-size: 14px">商品库存价格：&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<input name="jg" type="text" /><br><br>
	<a style="font-size: 14px">商品库存地址：&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<input name="kcdz" type="text" /><br><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="提交"/>
</body>
</html>