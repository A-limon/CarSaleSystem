<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<footer class="footer">
	<div class="container">
		<p>
			<s:i18n name="message">
				<s:text name="copyright"></s:text>
			</s:i18n>
			.
			<s:a href="../index/about.jsp">
				<s:i18n name="message">
					<s:text name="dev"></s:text>
				</s:i18n>
			</s:a>
			.YangJian
		</p>
	</div>
</footer>