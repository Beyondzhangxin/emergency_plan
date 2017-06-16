<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ 
	page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>

<p class="content_head_form">
    <span class="content_title_form">应急预案统计</span>
        <span class="btnbox">
            
            <a class="btn2 btn_refresh" href="javascript:openUrl('../plan_stat/table.do','tablebox')">刷新</a>
        </span>
    <br class="clearfix"/>
</p>
<!--搜索栏-->
<form action="../em_plan/table.do" name="frmSearch" id="frmSearch" method="post">
		<input type="hidden" name="rows" value="<c:out value="${param.rows}" default="10"/>">
        <input type="hidden" name="page" value="<c:out value="${param.page}" default="1"/>">
</form>

<!--表格数据-->
<div class="tablebox" id="tablebox">
     <jsp:include page="/plan_stat/table.do"></jsp:include>
</div>
