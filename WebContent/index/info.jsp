<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>没有权限-BMW汽车销售系统</title>
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
     
      <div class="hero-unit righthello">
        <h2>${user}您好,您没有权限进行此项操作</h2>
        <p>请点击左侧其他目录进行相应操作</p>
      </div>
      
    </div>
  </div>
</div>
<s:include value="../index/bottom.jsp"></s:include>
</body>
<script type="text/javascript"
	src="<s:url value="/js/jquery-1.8.2.min.js"/>">
	
</script>
<script type="text/javascript"
	src="<s:url value="/js/bootstrap.min.js"/>">
	
</script>
<script>
 $(".homepage").addClass("active");//选中的添加acrive
</script>
</html>