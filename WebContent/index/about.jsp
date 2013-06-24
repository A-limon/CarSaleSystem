<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>关于-BMW汽车销售系统</title>
<link rel="stylesheet" href="<s:url value="/css/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.res.css"/>" />
<link rel="stylesheet" href="<s:url value="/css/base.css"/>" />
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a> <a class="brand" href="#">BMW汽车销售系统</a>
      <div class="nav-collapse collapse">
        <ul class="nav">
          <li class="active"> <a href="../index/index.jsp"><i class="icon-home icon-white"></i>主页</a> </li>
          <li><a href="#dev">开发环境</a></li>
          <li><a href="#server">服务器信息</a></li>
          <li><a href="#sql">数据库信息</a></li>
          <li><a href="#tech">使用的技术</a></li>
          <li><a href="#sys">综合概述</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid" id="main">
  <div class="row-fluid">
       <div class="span12"> 
    <section id="dev">
      <h3>开发环境</h3>
      <ul>
        <li>平台：Windows 7 SP1</li>
        <li>工具：Eclipse for Java EE3.7</li>
        <li>人员：杨健</li>
      </ul>
      </section>
      <section id="server">
      <h3>服务器信息</h3>
      <ul>
        <li>Web容器：Tomcat 7.0</li>
        <li>数据库：MySQL5.5</li>
        <li>环境：Java EE 1.7+JRE1.7</li>
      </ul>
      </section>
      <section id="sql">
      <h3>数据库信息</h3>
      <ul>
        <li>用户名：root</li>
        <li>密码：123</li>
        <li>配置：使用数据连接池连接</li>
      </ul>
      </section>
       <section id="tech">
      <h3>使用的技术</h3>
      <ul>
        <li>HTML5+CSS3+jQuery Bootstrap框架，支持响应式设计，要求使用Chrome等高级浏览器访问</li>
        <li>MySQL5.5 数据库</li>
        <li>Struts2+Spring3+Hibernate3</li>
      </ul>
      </section>
       <section id="sys">
      <h3>综合概述</h3>
      <ul>
        <li>
          <p>宝马4S店汽车销售系统使用SSH开发，主要是为了练习SSH。用于4S店进行汽车销售中涉及到的，库存管理，销售统计，维修预约，客户信息管理等。方便了企业进行信息化管理。</p>
        </li>
        
      </ul>
      </section>
    </div>
  </div>
</div>
	<s:include value="../index/bottom.jsp"></s:include>
	<script type="text/javascript" src="<s:url value="/js/jquery-1.8.2.min.js"/>">
	</script>
	<script type="text/javascript" src="<s:url value="/js/bootstrap.min.js"/>">	
	</script>
</body>
</html>
