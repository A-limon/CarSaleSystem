<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>车型管理-BMW汽车销售系统</title>
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

				<h2>品牌车型管理</h2>
				<s:a href="add.jsp" id="addbutton">增加新车型</s:a>
				<table class="table table-striped" width="100%">
					<tr>
						<strong><td>编号</td></strong>
						<strong><td>照片</td></strong>
						<strong><td>车名</td></strong>
						<strong><td>售价</td></strong>
						<strong><td>库存</td></strong>
						<strong><td>颜色</td></strong>
						<strong><td>发动机</td></strong>
						<strong><td>操作</td></strong>
					</tr>
					<s:iterator value="car" id="id">
						<tr>
						<td><s:property value="#id.carid"/></td>
						<td><img src="<s:property value="#id.carpic"/>" width="120" height="90"
								class="img-rounded"></td>
						<td><s:property value="#id.carname"/></td>
						<td><s:property value="#id.price"/></td>
						<td><s:property value="#id.stock"/>辆</td>
						<td><s:property value="#id.color"/></td>
						<td><s:property value="#id.engine"/></td>
						<td>
						<s:url id="edit" action="edit">
							   <s:param name="param"><s:property value="#id.carid"/></s:param>
							</s:url>							
							<s:url id="delete" action="delete">
							   <s:param name="param"><s:property value="#id.carid"/></s:param>
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
		$(".pinpai").addClass("active");//选中的添加acrive
		$("#addbutton").addClass("btn btn-primary");
		$(".table a").addClass("btn");
		$("#form").addClass("form-search");
	</script>	
</body>
</html>