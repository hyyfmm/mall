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
		//加载一次添加分类属性页面时，根据上一次操作的参数加载选项卡项目（tabs）
		var title = "${title}";
		var url = "${url}"
		if(title != ""){
			attr_add(title, url);
		}
	});
	
	function attr_add(title, url) {
		var result = $('#addattr').tabs('exists', title);
		if(result) {
			$('#addattr').tabs("select", title);
		} else {
			var class_2_id = $("#attr_class_2_select option:selected").val();
			//window.open("goto_attr_add.do?class_2_id="+class_2_id);
			$.post(url, {class_2_id:class_2_id}, function(data) {
				$('#addattr').tabs('add', {
					title:title,    
				    content:data,    
				    closable:true,    
				    tools:[{    
				        iconCls:'icon-mini-refresh',    
				        handler:function(){    
				            alert('refresh');    
				        }    
				    }]
				});
			});
		}
	}
</script>
<title>hanfu商城</title>
</head>
<body class="easyui-layout">
	<jsp:include page="manager_class_select.jsp"></jsp:include>
	
	<br><br><hr>
	<a style="font-size: 14px">分类属性列表:</a>
	<div id="attr_list_inner" class="easyui-datagrid"></div>
	<br><hr>
	<a  href="javascript:attr_add('添加分类属性', 'goto_attr_add.do');" style="color:yellow; font-size: 14px">添加分类属性</a>
	<br><br>
	<div id="addattr" class="easyui-tabs"></div>
	
</body>
</html>