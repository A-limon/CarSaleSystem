<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>客户信息管理</title>
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
				<h2>客户信息管理</h2>
				<div class="span4">
					<s:a href="add.jsp" id="addbutton">增加新客户</s:a>
				</div>
				<table class="table table-striped" >
					<tr>
						<td><strong>ID</strong></td>
						<td><strong>姓名</strong></td>					
						<td><strong>性别</strong></td>
						<td><strong>年龄</strong></td>
						<td><strong>电话</strong></td>
						<td><strong>邮箱</strong></td>
						<td><strong>发动机号</strong></td>
						<td><strong>购买日期</strong></td>
						<td><strong>购买车型</strong></td>
						<td><strong>操作</strong></td>
					</tr>
					<s:iterator value="client" id="id">
						<tr>
							<td><s:property value="#id.clientid"/></td>
							<td><s:property value="#id.clientname"/> </td>
							<td><s:property value="#id.clientsex"/> </td>
							<td><s:property value="#id.clientage"/> </td>
							<td><s:property value="#id.clientphone"/> </td>
							<td><s:property value="#id.clientmail"/> </td>
							<td><s:property value="#id.sell.engineid"/> </td>
							<td><s:property value="#id.sell.selldate"/> </td>
							<td><s:property value="#id.sell.car.carname"/> </td>
							<td>
							<s:url id="edit" action="edit">
							   <s:param name="param"><s:property value="#id.clientid"/></s:param>
							</s:url>
							
							<s:url id="delete" action="delete">
							   <s:param name="param"><s:property value="#id.clientid"/></s:param>
							</s:url>
							<s:a href="%{edit}"><i class="icon-pencil"></i>修改</s:a>
							
							<s:a href="%{delete}"><i
									class="icon-remove"></i>删除</s:a>
							</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
	</div>
	<s:include value="../index/bottom.jsp"></s:include>
	<script type="text/javascript" src="<s:url value="/js/jquery-1.8.2.min.js"/>">
	</script>
	<script type="text/javascript" src="<s:url value="/js/bootstrap.min.js"/>">	
	</script>
	<script>
		$(".kehu").addClass("active");//选中的添加acrive
		$("#addbutton").addClass("btn btn-primary");
		$(".table a").addClass("btn");
		$("#form").addClass("form-search");
		$("#form input").addClass("input-medium search-query");
	</script>	
</body>
</html>
