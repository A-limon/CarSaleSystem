<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>添加客户</title>
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
				<h2>添加新客户</h2>
				<form id="form" action="add" method="post">
					<div class="control-group">
						<label class="control-label" for="clientname">姓名</label>
						<div class="controls">
							<s:textfield name="clientinfo.clientname" id="clientname"></s:textfield>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="engineid">发动机编号</label>
						<div class="controls">
							<s:textfield name="sellinfo.engineid" id="engineid"></s:textfield>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="sex">性别</label>
						<div class="controls">
							<label class="radio">
								  <input type="radio" name="clientinfo.clientsex" id="sex" value="男" checked>
								  男
								</label>
								<label class="radio">
								  <input type="radio" name="clientinfo.clientsex" id="sex" value="女">
								 女
							</label>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="age">年龄</label>
						<div class="controls">
							<s:textfield name="clientinfo.clientage" id="age" min="18" max="100"></s:textfield>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="phone">电话</label>
						<div class="controls">
							<s:textfield name="clientinfo.clientphone" id="phone" ></s:textfield>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="email">邮箱</label>
						<div class="controls">
							<s:textfield name="clientinfo.clientmail" id="email" ></s:textfield>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn btn-primary">添加</button>
							<s:a href="list.action" id="cancle">取消</s:a>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>

	<s:include value="../index/bottom.jsp"></s:include>
	<script type="text/javascript" src="<s:url value="/js/jquery-1.8.2.min.js"/>">
	</script>
	<script type="text/javascript" src="<s:url value="/js/bootstrap.min.js"/>">	
	</script>
	<script type="text/javascript" src="<s:url value="/js/jquery.validate.min.js"/>">	
	</script>
	<script type="text/javascript" src="<s:url value="/js/messages_zh.js"/>">	
	</script>
	<script>
	$(document).ready(function(){
		$(".kehu").addClass("active");//选中的添加acrive
		$("#cancle").addClass("btn");
		$('#form').addClass("form-horizontal");// 表单格式化
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
				$("#clientname").rules("add", { 
					  required:true,  
					  minlength:2
				});
				$("#engineid").rules("add", { 
					required: true,
					minlength:7,
					minlength: 7,
				    digits: true,  
				    remote: "check.action",
					messages: {
						required:"请输入发动机号",
		                minlength:"发动机号是7位数字",
		                maxlength:"发动机号是7位数字",
		                digits:"发动机号是整数",
		                remote:"该发动机号在销售记录中没有找到,或已被使用"
					    }
				});
				$("#phone").rules("add", { 
					minlength: 11,
				      digits: true,
				      required: true
				});
				$("#email").rules("add", { 
					email: true,  
			    	required: true
				});
				$("#age").rules("add", { 
					 digits: true,   
				      range:[18,120],    
				      required: true 
				});
				$("#sex").rules("add", { 
					  required:true,  
				});
				}); 
	</script>
</body>
</html>
