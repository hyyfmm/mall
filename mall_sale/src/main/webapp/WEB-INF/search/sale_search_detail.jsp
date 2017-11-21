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
	function b(){}
</script>
<title>hanfu商城</title>
</head>
<body>
	商品详情页
	<hr>
	<img alt="" src="upload/images/${sku_detail.spu.shp_tp}">
	<hr>
	${sku_detail.sku_mch}<br>
	${sku_detail.jg}
	<hr>
	<c:forEach items="${sku_info}" var="sku">
		<a href="goto_sku_detail.do?sku_id=${sku.id}&spu_id=${sku.shp_id}" >${sku.sku_mch}</a><br>
	</c:forEach>
	<hr>
	${sku_detail.spu.shp_msh}<br>
	<hr>
	<form action="add_cart.do" method="post">
		<input type="hidden" name="sku_mch" value="${sku_detail.sku_mch}">
		<input type="hidden" name="sku_jg" value="${sku_detail.jg}">
		<input type="hidden" name="tjshl" value="1">
		<input type="hidden" name="hj" value="${sku_detail.jg}">
		<input type="hidden" name="shp_id" value="${sku_detail.shp_id}">
		<input type="hidden" name="sku_id" value="${sku_detail.id}">
		<input type="hidden" name="shp_tp" value="upload/images/${sku_detail.spu.shp_tp}">
		<input type="hidden" name="shfxz" value="1">
		<input type="hidden" name="kcdz" value="${sku_detail.kcdz}">
		<c:if test="${not empty user }">
			<input type="hidden" name="yh_id" value="${user.id}">
		</c:if>
		<input type="submit" value="添加购物车" />
	</form>
	<hr>
	<c:forEach items="${sku_detail.list_image}" var="image">
		<img alt="" src="upload/images/${image.url}">
	</c:forEach>
	<hr>
	<c:forEach items="${sku_detail.list_av_name}" var="av_name">
		${av_name.shxm_mch}${av_name.shxzh_mch}<br>
	</c:forEach>
</body>
</html>