<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>完成维修保养预约</title>
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
				<h2>完成维修保养预约</h2>
				<form id="form" action="editsave" method="post">
					<div class="control-group">
						<label class="control-label" for="clientid">客户ID</label>
						<div class="controls">
							<s:textfield name="clientinfo.clientid" id="clientid" readonly="true"></s:textfield>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="serdate">预约日期</label>
						<div class="controls">
							<s:textfield name="serviceinfo.serdate" id="serdate"></s:textfield>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="serstate">维修保养结果</label>
						<div class="controls">
							<s:select list="{'预约','完成'}" name="serviceinfo.serstate"></s:select>
						</div>
					</div>

					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn btn-primary">保存</button>
							<s:a href="list.action" id="cancle">取消</s:a>
						</div>
					</div>
					<s:textfield name="serviceinfo.serid" id="serid" style="display:none"></s:textfield>
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
		$(document).ready(
				function() {
					$(".weixiu").addClass("active");//选中的添加acrive
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
						$.validator.addMethod(
							    "australianDate",
							    function(value, element) {
							        return moment(value, "MM-DD-YYYY").isValid();
							    },
							    "请按照 MM/DD/YYYY 格式输入日期."
							);
							$("#serdate").rules("add", { 
								  required:true,
								  australianDate: true
							});
							$("#serstate").rules("add", { 
								  required:true,
							});
							}); 
	</script>
</body>
</html>
