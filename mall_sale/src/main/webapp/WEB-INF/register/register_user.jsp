<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function sendEmail() {
		var email = $("#email").val();
		$.getJSON("sendEmail.do", {"email": email}, function(data) {
			if(data) {
				alert("发送成功!");
			}
		});
	}
</script>
<title>hanfu商城</title>
</head>
<body>
	<form action="register_user.do">
		<h1 align="center">用户注册页面</h1><br><br>
		<h3 align="center">
			用户名称:&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="yh_mch" /><br><br>
			用户昵称:&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="yh_nch" /><br><br>
			用户密码:&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="yh_mm" /><br><br>
			用户姓名:&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="yh_xm" /><br><br>
			手机号码:&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="yh_shjh" /><br><br>
			用户邮箱:&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="email" type="text" name="yh_yx" />
			<input type="button" value="发送邮箱验证码" onclick="sendEmail()" /><br><br>
			<input type="submit" value="提交">
		</h3>
	</form>
</body>
</html>