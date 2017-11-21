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
		var yh_mch = getCookieValue("yh_mch");
		$("#yh_mch").html(yh_mch);
	});
	
	function getCookieValue(key) {
		var value = "";
		//对cookie进行处理
		var cookies = document.cookie;
		var cookies= cookies.replace(/\s/,"");
		var cookie_array = cookies.split(";");
		
		for(i=0;i<cookie_array.length;i++){
			var cookie = cookie_array[i];
			var kv_array = cookie.split("=");
			if(kv_array[0]==key){
				value= decodeURIComponent(kv_array[1]);
			}
		}
		return value;
	}
</script>
<title>hanfu商城</title>
</head>
<body>
	<c:if test="${empty user}">
		<span id="yh_mch" style="color: red;">${yh_mch}</span>
		你好,&nbsp;&nbsp;<a href="goto_login.do">请登录</a>&nbsp;&nbsp;
		<a href="goto_register.do" style="color: red;">免费注册</a>
	</c:if>
	<c:if test="${not empty user}">
		欢迎${user.yh_nch}  我的订单
		<a href="goto_out.do">退出</a>
	</c:if>
</body>
</html>