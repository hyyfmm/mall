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
	<jsp:include page="../sale_header.jsp"></jsp:include>
	<hr>
	<jsp:include page="sale_search_area.jsp"></jsp:include>
	<hr>
	分类检索<br>
	<jsp:include page="sale_search_attr_list.jsp"></jsp:include>
	<hr>
	<div id="sale_search_sku_list">
		<jsp:include page="sale_search_sku_list.jsp"></jsp:include>
	</div>
</body>
</html>