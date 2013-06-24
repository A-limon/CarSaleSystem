<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>添加销售记录</title>
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
		 <h2>添加销售记录</h2>
<s:form id="form" action="add" method="post" namespace="/sell">
  <div class="control-group">
    <label class="control-label" for="engineid">发动机号</label>
    <div class="controls">
     <s:textfield name="sellinfo.engineid" id="engineid"></s:textfield>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="carid">车辆ID</label>
    <div class="controls">
      <s:textfield name="carinfo.carid" id="carid"></s:textfield>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="userid">销售人员ID</label>
    <div class="controls">
      <s:textfield name="employeeinfo.userid" id="userid"></s:textfield>
    </div>
  </div>
  
  <div class="control-group">
    <label class="control-label" for="selldate">销售日期</label>
    <div class="controls">
      <s:textfield name="sellinfo.selldate" id="selldate"></s:textfield>
      <p>请按照mm/dd/yyyy的格式输入日期</p>
    </div>
  </div>
  
  <div class="control-group">
    <div class="controls">
      <button type="submit" class="btn btn-primary">添加</button>
      <s:a href="list.action" id="cancle">取消</s:a>
    </div>
  </div>
</s:form>

    </div>
  </div>
</div>
<s:include value="../index/bottom.jsp"></s:include>
	<script type="text/javascript" src="<s:url value="/js/jquery-1.8.2.min.js"/>">
	</script>
	<script type="text/javascript" src="<s:url value="/js/moment.min.js"/>">
	</script>
	<script type="text/javascript" src="<s:url value="/js/bootstrap.min.js"/>">	
	</script>
	<script type="text/javascript" src="<s:url value="/js/jquery.validate.min.js"/>">	
	</script>
	<script type="text/javascript" src="<s:url value="/js/messages_zh.js"/>">	
	</script>
	<script>
	$(document).ready(function(){
		$(".xiaoshou").addClass("active");//选中的添加acrive
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
				$("#engineid").rules("add", { 
					minlength: 7,
				    maxlength:7,
				    digits: true,  
				    required: true,
				    remote: "checkengineid.action",
				    messages: {
				         required:"请输入发动机号",
				         minlength:"发动机号是7位数字",
				         maxlength:"发动机号是7位数字",
				         digits:"发动机号是整数",
				         remote:"该发动机号在销售记录中已被使用"
				      		}
				});					
				$("#carid").rules("add", { 
					minlength: 1,              
				    digits: true,  
				    required: true,
				    remote: "checkcarid.action",
				    messages: {
			           required:"请输入车型号",
			           minlength:"车型号是1位以上的数字",
			           digits:"车型号是整数",
			           remote:"没有此车型号，请查证"
			      	}
				});
				$("#userid").rules("add", { 
					minlength: 1,              
				    digits: true,  
				    required: true,
				    remote: "checkuserid.action",
				    messages: {
			           required:"请输入销售人员代号",
			           minlength:"销售人员代号是1位以上的数字",
			           digits:"销售人员代号是整数",
			           remote:"没有此销售人员代号，请查证"
			      	}
				});
				$("#selldate").rules("add", { 
					australianDate: true,
				    required: true
				});				
				}); 
	</script>
</body>
</html>
