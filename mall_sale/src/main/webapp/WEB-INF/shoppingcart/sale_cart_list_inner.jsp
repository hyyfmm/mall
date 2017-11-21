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
	
</script>
<title>hanfu商城</title>
</head>
<body>
	<c:forEach items="${list_cart}" var="cart">
		${cart.sku_id}<br>
		<input type="checkbox" ${cart.shfxz=="1"?"checked":""} onclick="cart_item_check(${cart.sku_id},this.checked,-1,${cart.sku_jg})" />
		<img alt="" src="${cart.shp_tp}" width="50px">
		${cart.sku_mch}
		<a href="javascript:cart_item_check(${cart.sku_id},this.checked,${cart.tjshl-1},${cart.sku_jg});">-</a>
		<input type="text" size="3" value="${cart.tjshl}"/>
		<a href="javascript:cart_item_check(${cart.sku_id},this.checked,${cart.tjshl+1},${cart.sku_jg});">+</a>
		${cart.hj} 删除
		<br>
	</c:forEach>
	<hr>
	总金额:${sum}
	<form action="goto_order.do" method="post">
		<input type="text" name="sum" value="${sum}" />
		<input type="submit" value="结算" />
	</form>
</body>
</html>