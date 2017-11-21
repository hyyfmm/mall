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
						$("#attr_class_1_select").append(
								"<option value="+json.id+">" + json.flmch1
										+ "</option>");
					});
			});
		});
	
	function get_attr_class_2(class_1_id){
		//加载静态分类数据
		$.getJSON("js/json/class_2_" + class_1_id + ".js",function(data) {
			//先清空上次下拉框中的内容
			$("#attr_class_2_select").empty();
			$("#attr_class_2_select").append("<option>请选择二级分类</option>");
			//将分类数据加载到页面的下拉列表中
			$(data).each(function(i, json) {
				$("#attr_class_2_select").append("<option value='"+json.id+"'>"+json.flmch2+"</option>");
			});
		});
		get_attr_tm(class_1_id);
	}
	
	function get_attr_tm(class_1_id) {
		//加载静态分类数据
		$.getJSON("js/json/tm_class_1_" + class_1_id + ".js", function(data) {
			//先清空上次下拉框中的内容
			$("#attr_tm_select").empty();
			$("#attr_tm_select").append("<option>请选择品牌</option>");
			//将分类数据加载到页面的下拉列表框
			$(data).each(function(i, json) {
				$("#attr_tm_select").append("<option value='" + json.id + "'>" + json.ppmch + "</option>");
			});
		});
	}
	
	function get_attr_list(class_2_id) {
		/* $.post("get_attr_list.do",{class_2_id:class_2_id},function(data){
			$("#attr_list_inner").html(data);
		}); */
		$('#attr_list_inner').datagrid({    
		    url:'get_attr_list_json.do',
		    queryParams:{class_2_id:class_2_id},
		    columns:[[    
		        {field:'id',title:'属性id',width:100},    
		        {field:'shxm_mch',title:'属性名',width:100},    
		        {field:'list_value',title:'属性值',width:300,
		        	formatter: function(value,row,index){
						var list = "";
						$(value).each(function(i,json){
							list=list+" "+json.shxzh+json.shxzh_mch;
						});
		        		return list;
					}		
		        }, 
		        {field:'chjshj',title:'创建时间',width:300,
		        	formatter: function(value,row,index){
						var d = new Date(value);
		        		return d.toLocaleString();
					}	
		        }
		    ]]    
		});
	}
</script>
<title>hanfu商城</title>
</head>
<body>
	<a style="font-size: 14px">选择商品分类:</a>&nbsp;&nbsp;
	<select name="flbh1" id="attr_class_1_select" onchange="get_attr_class_2(this.value)" style="width: 150px">
		<option>请选择一级分类</option>
	</select>&nbsp;&nbsp;
	<select name="flbh2" id="attr_class_2_select" onchange="get_attr_list(this.value)" style="width: 150px">
		<option>请选择二级分类</option>
	</select>&nbsp;&nbsp;
	<select name="pp_id" id="attr_tm_select" style="width: 150px">
		<option>请选择品牌</option>
	</select>
</body>
</html>