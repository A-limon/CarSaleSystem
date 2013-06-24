<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>登陆-BMW汽车销售系统</title>
<link rel="stylesheet" href="<s:url value="/css/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.res.css"/>" />
<link rel="stylesheet" href="<s:url value="/css/base.css"/>" />
</head>
<body id="login">

<div class="container">
<s:form action="login" namespace="/" id="form">
	  <div class="control-group">
	  	
	    <label class="control-label" for="loginname">登录名</label>
	    <div class="controls">
	     <s:textfield name="employeeinfo.loginname" id="loginname"></s:textfield>
	    </div>
	  </div>
	  <div class="control-group">
	    <label class="control-label" for="inputPassword">密码</label>
	    <div class="controls">
	     <s:password name="employeeinfo.password" id="password"></s:password>
	    </div>
	  </div>
	  <div class="control-group">
	    <div class="controls">
	       <button type="submit" class="btn btn-info" >登陆</button>
	       <p style="color:red">${notlogin}</p>
	    </div>
	  </div>
	</s:form>
	<div class="copyright">copyright© 2013 杨健</div>
</div>

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
							$('#form').addClass("form-horizontal");// 表单格式化
							$('#form').addClass("login");
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
									$("#loginname").rules("add", { 
										 minlength: 2,
									     required: true,
									     messages : {
											required : "请输入账户名",
											minlength : "请输入超过两个字符的账户名",
										}
									});
									$("#password").rules("add", { 
										 minlength: 2,
									     required: true,
									     messages : {
												required : "请输入密码",
												minlength : "请输入超过两个字符的密码",
											}
									});
									}); 
	</script>
</body>
</html>
