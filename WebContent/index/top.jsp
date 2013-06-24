<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a> <a class="brand" href="#"><s:i18n name="message">
				<s:text name="title"></s:text>
			</s:i18n></a>
			<div class="nav-collapse collapse">
				<ul class="nav">
					<li class="active"><s:a href="../index/index.jsp"><i
							class="icon-home icon-white"></i><s:i18n name="message">
				<s:text name="homepage"></s:text>
			</s:i18n></s:a></li>
					<li><a href="#"><i class="icon-tasks icon-white"></i><s:i18n name="message">
				<s:text name="notice"></s:text>
			</s:i18n></a></li>
				</ul>
				<ul class="nav pull-right">
					<li class="divider-vertical"></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><s:i18n name="message">
				<s:text name="welcome"></s:text>
			</s:i18n>, <s:property value="#session.user" /><b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><s:a href="/CarSaleSystem/logout.action"><i
									class="icon-off"></i><s:i18n name="message">
				<s:text name="logout"></s:text>
			</s:i18n></s:a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</div>

