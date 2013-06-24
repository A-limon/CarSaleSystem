<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>编辑车型-BMW汽车销售系统</title>
<link rel="stylesheet" href="<s:url value="/css/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.res.css"/>" />
<link rel="stylesheet" href="<s:url value="/css/base.css"/>" />
</head>
<body>
	<s:include value="../index/top.jsp"></s:include>
	<div class="container-fluid" id="main">
		<div class="row-fluid">
			<div class="span2">
				<s:include value="../index/left.jsp"></s:include>
			</div>
			<div class="span10">

				<h2>编辑车型</h2>
				<form id="form" action="editsave" method="post"
					enctype="multipart/form-data">
					<div class="control-group">
						<label class="control-label" for="carname">车型名</label>
						<div class="controls">
							<s:textfield name="carinfo.carname" id="carname"></s:textfield>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="price">售价</label>
						<div class="controls">
							<div class="input-prepend input-append">
								<span class="add-on">￥</span>
								<s:textfield name="carinfo.price" id="price"></s:textfield>
								<span class="add-on">万元起</span>
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="stock">库存</label>
						<div class="controls">
							<div class="input-prepend input-append">
							<s:textfield name="carinfo.stock" id="stock"></s:textfield>
								<span class="add-on">辆</span>
							</div>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="color">颜色</label>
						<div class="controls">
							<select name="carinfo.color" class="span5" id="color">
								<option>雪山白</option>
								<option>宝石青</option>
								<option>米兰诺米色</option>
								<option>太空灰</option>
								<option>泰坦银</option>
								<option>午夜蓝</option>
								<option>蒙特卡罗蓝</option>
								<option>墨尔本红</option>
								<option>黑色</option>
								<option>磨砂棕</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="engine">发动机</label>
						<div class="controls">
							<s:textfield name="carinfo.engine" id="engine"></s:textfield>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="pic">车辆图片</label>
						<div class="controls">
							<s:file id="upload" name="upload" />
							请选择120*90px大小的jpg图片
						</div>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">保存</button>
						<s:a href="list.action" id="cancle">取消</s:a>
					</div>
					<s:textfield name="carinfo.carid" id="carid" style="display: none"></s:textfield>
					<s:textfield name="carinfo.carpic" id="carpic" style="display: none"></s:textfield>
				</form>

			</div>
		</div>
	</div>
	<s:include value="../index/bottom.jsp"></s:include>
	<script type="text/javascript"
		src="<s:url value="/js/jquery-1.8.2.min.js"/>">
		
	</script>
	<script type="text/javascript"
		src="<s:url value="/js/bootstrap.min.js"/>">
		
	</script>
	<script type="text/javascript"
		src="<s:url value="/js/jquery.validate.min.js"/>">
		
	</script>
	<script type="text/javascript"
		src="<s:url value="/js/messages_zh.js"/>">
		
	</script>
	<script>
		$(document)
				.ready(
						function() {

							$(".pinpai").addClass("active");//选中的添加acrive
							$("#cancle").addClass("btn");
							$('#form').addClass("form-horizontal");// 表单格式化
							document.getElementsByTagName("select")[0].value = "${carinfo.color}";
							// 客户端验证
							 $('#form').validate(
									 {
									  highlight: function(element) {
									    $(element).closest('.control-group').removeClass('success').addClass('error');
									  },
									  success: function(element) {
									    element
									    .text('OK!').addClass('valid')
									    .closest('.control-group').removeClass('error').addClass('success');
									  }
									 });
									$("#carname").rules("add", { 
										  required:true,  
										  minlength:2
									});					
									$("#stock").rules("add", { 
										 digits: true,
									      range:[0,50],
									      required: true,
									});
									$("#engine").rules("add", { 
										 minlength: 2,
									      required: true
									});
									$("#color").rules("add", { 
										  required:true,  
									});
									$("#price").rules("add", { 
										number: true,
								    	range:[15,600],
								      required: true 
									});
									}); 
	</script>
</body>
</html>