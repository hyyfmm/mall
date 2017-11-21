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
	检索内容列表页<br>
	<c:forEach items="${list_sku}" var="sku">
		<div style="border:red 1px solid;width:200px;height:250px;float:left;margin-left:10px;margin-top:10px">
			<img alt="" width="100%" height="50%" src="upload/images/${sku.spu.shp_tp}">
			<br>
			<a href="goto_sku_detail.do?sku_id=${sku.id}&spu_id=${sku.spu.id}" target="_blank">${sku.sku_mch}</a>
			<br>
			${sku.jg}
		</div>
	</c:forEach>
</body>
</html>