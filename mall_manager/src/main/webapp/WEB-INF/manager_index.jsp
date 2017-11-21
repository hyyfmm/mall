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
<link rel="stylesheet" type="text/css" href="js/easyui/themes/black/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

	$(function(){
		//加载首页后，根据上一次的操作的参数加载选项卡项目（tabs）
		var title = "${title}";
		var url = "${url}";
		var success = "${success}";
		var fail = "${fail}";
		if(success != "") {
			alert(success);
		}
		if(fail != "") {
			alert(fail);
		}
		if(url != "") {
			add_tab(title, url);
		}
	});

	function add_tab(title, url){
		var result = $('#opertion').tabs('exists', title);
		if(result) {
			$('#opertion').tabs('select', title);
		} else {
			$.post(url, function(data){
				$('#opertion').tabs('add',{    
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
	<div data-options="region:'north',split:true" style="height:70px">
		<h1 align="center" style="color:red">hanfu商城后台管理系统</h1>
	</div>
	<div data-options="region:'west',split:true" title="商品管理" style="width:180px;">
		<ul class="easyui-tree">
			<li>
				<span><a style="color:white; font-size: 18px">商品内容管理</a></span>
				<ul>
					<li>
						<span><a style="color:white; font-size: 16px">商品spu管理</a></span>
						<ul>
							<li>
								<a href="javascript:add_tab('添加商品信息', 'goto_spu_add.do')" style="color:yellow; font-size: 14px">添加商品信息</a>
							</li>
						</ul>
						<ul>
							<li>
								<a href="javascript:;" style="color:yellow; font-size: 14px">查询商品信息</a>
							</li>
						</ul>
					</li>
					<li>
						<span><a style="color:white; font-size: 16px">商品属性管理</a></span>
						<ul>
							<li>
								<a href="javascript:add_tab('添加商品属性', 'goto_attr.do');" style="color:yellow; font-size:14px">添加商品属性</a>
							</li>
						</ul>
					</li>
					<li>
						<span><a style="color:white; font-size: 16px">商品sku管理</a></span>
						<ul>
							<li>
								<a href="javascript:add_tab('添加sku信息', 'goto_sku.do');" style="color:yellow; font-size:14px">添加sku信息</a>
							</li>
						</ul>
					</li>
				</ul>
			</li>
			<li>
				<span><a style="color:white; font-size: 18px">缓存内容管理</a></span>
				<ul>
					<li><a href="javascript:;" style="color:yellow; font-size:14px">管理1</a></li>
					<li><a href="javascript:;" style="color:yellow; font-size:14px">管理2</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div data-options="region:'center',title:'具体业务',iconCls:'icon-ok'">
		<div id="opertion" class="easyui-tabs"></div>
	</div>
</body>
</html>