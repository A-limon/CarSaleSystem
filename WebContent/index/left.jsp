<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<ul class="nav nav-list bs-docs-sidenav">
        <li class="homepage"><s:a href="../index/index.jsp">销售系统主页<i class="icon-chevron-right"></i> </s:a></li>
        <li class="pinpai"><s:a href="../car/list.action"><i class="icon-chevron-right"></i>品牌车型管理</s:a></li>
        <li class="xiaoshou"><s:a href="../sell/list.action"><i class="icon-chevron-right"></i>汽车销售记录</s:a></li>
        <li class="weixiu"><s:a href="../service/list.action"><i class="icon-chevron-right"></i>维修预约管理</s:a></li>
        <li class="kehu"><s:a href="../client/list.action"><i class="icon-chevron-right"></i>客户资料管理</s:a></li>
        <li class="yuangong"><s:a href="../employee/list.action?pageNumber=1"><i class="icon-chevron-right"></i>员工信息管理</s:a></li>
</ul>