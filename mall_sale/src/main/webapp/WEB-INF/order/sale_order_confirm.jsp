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
	function select_address(address_id,shjr){
		$("#check_order_div").html("收货地址：<input type='hidden' value='"+address_id+"' name='address_id'>"+shjr);
	}
</script>
<title>hanfu商城</title>
</head>
<body>
	订单确认页<br>
	<c:forEach items="${list_address}" var="address">
		<input type="radio" onclick="select_address(${address.id},'${address.shjr}${address.yh_dz}')" name="a" />${address.yh_dz} ${address.shjr}  ${address.lxfsh} 
	</c:forEach>
	<hr>
	
	${order.jdh} ￥：${order.zje}<br>
	<c:forEach items="${order.list_flow}" var="flow">
		${flow.psfsh}:<br>${flow.mqdd}
		<div style="border:red 1px solid;">
			<c:forEach items="${flow.list_info}" var="info">
				<img src="${info.shp_tp}" width="70px"/>
				${info.sku_mch} ${info.sku_jg}<br>
			</c:forEach>
		</div>
	</c:forEach>
	<form action="check_order.do" method="post">
		订单金额：${order.zje} 
		<div id="check_order_div" style="width:500px;height:50px;border:1px red solid">
			
		</div>
		<input type="text" name="sum" value="${order.zje}" />
		<input type="submit" value="提交订单" />
	</form>
</body>
</html>