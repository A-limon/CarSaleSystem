<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>错误-BMW汽车销售系统</title>
<link rel="stylesheet" href="<s:url value="/css/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.res.css"/>" />
<link rel="stylesheet" href="<s:url value="/css/base.css"/>" />
</head>
<body>
	<div class="alert alert-error">
		<h2>oops,出错了~</h2>
	</div>
	<div class="span10">
		<s:a href="../index/index.jsp">返回首页</s:a>
	</div>
</body>
<script type="text/javascript"
	src="<s:url value="/js/jquery-1.8.2.min.js"/>">
	
</script>
<script type="text/javascript"
	src="<s:url value="/js/bootstrap.min.js"/>">
	
</script>
</html>
