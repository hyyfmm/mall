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
		$.getJSON("js/json/class_1.js", function(data){
			//用js循环json的分类集合
			$(data).each(function(i, json){
				//将分类集合的内容生成<option>对象加载到下拉框中
				//<li onmousemove="" value=""></li>   当时就因为这个没去掉，搞了一小时
				$("#class_1_ul").append("<li onmouseover = 'get_class_2(this.value)' value = " + json.id + ">" + json.flmch1 + "</li>");
			});
		});
	});
	
	function get_class_2(class_1_id) {
		$.getJSON("js/json/class_2_" + class_1_id + ".js", function(data){
			//用js循环json的分类集合
			$("#class_2_ul").empty();
			$(data).each(function(i, json){
				//将分类集合的内容生成<option>对象加载到下拉框中
				$("#class_2_ul").append("<li value = " + json.id + "><a href='goto_search_class.do?class_2_id=" + json.id + "&class_2_name=" + json.flmch2 + "' target = '_blank' >" + json.flmch2 + "</a></li>");
			});
		});
	}
</script>
<title>hanfu商城</title>
</head>
<body>
	<ul id="class_1_ul" style="float: left;"></ul>
	<ul id="class_2_ul" style="float: left;"></ul>
</body>
</html>