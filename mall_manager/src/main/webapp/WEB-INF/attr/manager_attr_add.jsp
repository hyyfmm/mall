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
	function b(){}
</script>
<title>hanfu商城</title>
</head>
<body class="easyui-layout">
	当前商品:&nbsp;&nbsp;${flmch2}<br>
	<hr>
	<form action="save_attr.do" method="post">
		<div data-options="fit:true">  
			<div data-options="region:'center'" > 
				<input type="hidden" name="class_2_id" value="${class_2_id}" />
				<table border="1">
					<tr><td>属性名：<input type="text" name="list_attr[0].shxm_mch" /></td><td></td><td>添加值</td></tr>
					<tr><td>属性值：<input type="text" name="list_attr[0].list_value[0].shxzh" /></td><td>单位：<input type="text" name="list_attr[0].list_value[0].shxzh_mch" /></td><td>删除</td></tr>
					<tr><td>属性值：<input type="text" name="list_attr[0].list_value[1].shxzh" /></td><td>单位：<input type="text" name="list_attr[0].list_value[1].shxzh_mch" /></td><td>删除</td></tr>
				</table>
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="提交">
            </div>   
		</div>
	</form>
</body>
</html>