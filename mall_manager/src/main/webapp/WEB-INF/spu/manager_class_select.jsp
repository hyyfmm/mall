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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function() {
		// 异步请求静态的分类数据
		$.getJSON("js/json/class_1.js", function(data) {
			$(data).each(
					function(i, json) {
						// 将数据通过js函数加载到
						// a.append(b);b.appendTo(a);
						// b.append(a);a.appendTo(b);
						$("#spu_class_1_select").append(
								"<option value="+json.id+">" + json.flmch1
										+ "</option>");
					});
			});
		});
	
	function spu_get_class_2(class_1_id){
		//加载静态分类数据
		$.getJSON("js/json/class_2_" + class_1_id + ".js",function(data) {
			//先清空上次下拉框中的内容
			$("#spu_class_2_select").empty();
			$("#spu_class_2_select").append("<option>请选择二级分类</option>");
			//将分类数据加载到页面的下拉列表中
			$(data).each(function(i, json) {
				$("#spu_class_2_select").append("<option value='"+json.id+"'>"+json.flmch2+"</option>");
			});
		});
		spu_get_tm(class_1_id);
	}
	
	function spu_get_tm(class_1_id) {
		//加载静态分类数据
		$.getJSON("js/json/tm_class_1_" + class_1_id + ".js", function(data) {
			//先清空上次下拉框中的内容
			$("#spu_tm_select").empty();
			$("#spu_tm_select").append("<option>请选择品牌</option>");
			//将分类数据加载到页面的下拉列表框
			$(data).each(function(i, json) {
				$("#spu_tm_select").append("<option value='" + json.id + "'>" + json.ppmch + "</option>");
			});
		});
	}
</script>
<title>hanfu商城</title>
</head>
<body>
	选择商品分类:&nbsp;&nbsp;
	<select name="flbh1" id="spu_class_1_select" onchange="spu_get_class_2(this.value)" style="width: 150px">
		<option>请选择一级分类</option>
	</select>&nbsp;&nbsp;
	<select name="flbh2" id="spu_class_2_select" style="width: 150px">
		<option>请选择二级分类</option>
	</select>&nbsp;&nbsp;
	<select name="pp_id" id="spu_tm_select" style="width: 150px">
		<option>请选择品牌</option>
	</select>
</body>
</html>