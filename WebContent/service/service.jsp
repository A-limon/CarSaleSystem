<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>维修保养预约管理</title>
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
				<h2>维修保养预约管理</h2>
				<div class="span4">
					<s:a href="add.jsp" id="addbutton">增加新预约</s:a>
				</div>
				<table class="table table-striped">
					<tr>
						<td><strong>预约号</strong></td>
						<td><strong>预约时间</strong></td>
						<td><strong>客户ID</strong></td>
						<td><strong>客户姓名</strong></td>
						<td><strong>状态</strong></td>
						<td><strong>操作</strong></td>
					</tr>
					<s:iterator value="service" id="id">
						<tr>
							<td><s:property value="#id.serid" /></td>
							<td><s:property value="#id.serdate" /></td>
							<td><s:property value="#id.client.clientid" /></td>
							<td><s:property value="#id.client.clientname" /></td>
							<td><s:property value="#id.serstate" /></td>
							<td><s:url id="edit" action="edit">
									<s:param name="param">
										<s:property value="#id.serid" />
									</s:param>
								</s:url> <s:a href="%{edit}">
									<i class="icon-pencil"></i>修改</s:a></td>
						</tr>
					</s:iterator>

				</table>

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
	<script>
		$(".weixiu").addClass("active");//选中的添加acrive
		$("#addbutton").addClass("btn btn-primary");
		$(".table a").addClass("btn");
		$("#form").addClass("form-search");
	</script>
</body>
</html>
