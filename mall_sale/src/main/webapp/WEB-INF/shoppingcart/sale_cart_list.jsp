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
	function cart_item_check(sku_id,checked,tjshl,sku_jg){
		var shfxz = "0";
		if(tjshl > 0 || tjshl == -1) {
			if(checked) {
				shfxz = "1";
			}
			
			// 异步更新购物车列表
			$.post("item_check.do",{shfxz:shfxz,sku_id:sku_id,tjshl:tjshl,sku_jg:sku_jg},function(data){
				$("#cart_list_inner").html(data);
			});
		}
	}
</script>
<title>hanfu商城</title>
</head>
<body>
	<div id="cart_list_inner">
		<jsp:include page="sale_cart_list_inner.jsp"></jsp:include>
	</div>
</body>
</html>