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
	function image_click(index){
		// 触发file对象的点击事件
		$("#file_"+index).click();
	
	}
	
	function image_show(index){
		var file = $("#file_"+index)[0].files[0];
		var url = window.URL.createObjectURL(file);
		$("#img_"+index).attr("src",url);
		
		// 如果用户点击的是添加的图片，新增加一个添加按钮，否则不添加
		var file_length = $("#spu_img :file").length;// 1 
		if(index == (file_length -1)){
			$("#limit").html(4 - index);
			if(index < 4) {
				add_image(index);
			}
		} 
	}
	
	function add_image(index){
		var a = '<div id="spu_img_div_'+(index+1)+'" style="margin-left:10px;border:1px solid #333;width:80px;height:80px;float:left;">';
		var b = '<img id = "img_'+(index+1)+'" style="cursor:pointer" src="image/upload_hover.png" width="80px" height="80px" onclick="image_click('+(index+1)+')"/>';
		var c =	'<input id="file_'+(index+1)+'"  type="file" name="files" style="display:none;" onChange="image_show('+(index+1)+')" />';
		var d = '</div>';
		$("#spu_img").append(a+b+c+d);
	}
	
	function checkform(){
		var shp_mch = $("#shp_mch").val();
		if(shp_mch == "") {
			alert("名称必须填");
			return false;
		}
		$("#spuform").submit();
	}
</script>
<title>hanfu商城</title>
</head>
<body class="easyui-layout">
	<form id="spuform" action="save_spu.do" method="post" enctype="multipart/form-data">
		<div data-options="fit:true">   
            <div data-options="region:'north',collapsed:true" style="width:800px; height: 40px">
            	<jsp:include page="manager_class_select.jsp"></jsp:include>
            </div>   
            <div id="callback" data-options="region:'center'" >
            	商品名称:&nbsp;&nbsp;
            	<input name="shp_mch" id="shp_mch" type="text" size="57px"/><br><br>
				商品描述:&nbsp;&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<textarea name="shp_msh" rows="5" cols="42"></textarea><br><br>
				上传图片:&nbsp;&nbsp;<a>总共可上传5张图片,还可以上传<span id="limit">5</span>张</a><br/><br/>
				<div id="spu_img">
					<div id="spu_img_div_0" style="border:1px solid #333;width:80px;height:80px;float:left;">
						<img id = "img_0" style="cursor:pointer" src="image/upload_hover.png" width="80px" height="80px" onclick="image_click(0)"/>
						<input id="file_0"  type="file" name="files" style="display:none;" onChange="image_show(0)" /><br>
					</div>
				</div>
				<br/><br/><br/><br/><br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="提交" onclick="checkform()"/>
            </div>   
        </div> 
	</form>
</body>
</html>