<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ 
	page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<html>
<head>
	<title>应急预案</title>
	<link rel="stylesheet" type="text/css" href="../css/currency.css">
	<link rel="stylesheet" type="text/css" href="../css/project.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/all.js"></script>
	<script type="text/javascript" src="../js/pagination.js"></script>
</head>
<body>

<!--内容区-->
<div class="mainbox">
      <!--数据表格-->
     <div class="contentbox" id="contentbox">
        <p class="content_head_form">
		    <span class="content_title_form">应急预案</span>
		        <span class="btnbox">
		           <a class="btn2 btn_search" href="javascript:searchBoxToggle()">搜索</a>
		           <a class="btn2 btn_refresh" href="javascript:currPage()">刷新</a>
		        </span>
		    <br class="clearfix"/>
		</p>
		<!--搜索栏-->
		<form action="../em_plan/table.do" name="frmSearch" id="frmSearch" method="post">
		<div class="searchbox" >
		    <jsp:include page="searchbox.jsp"></jsp:include>
		</div>
				<input type="hidden" name="companyId" value="<c:out value="${param.companyId}"/>">
				<input type="hidden" name="rows" value="<c:out value="${param.rows}" default="10"/>">
		        <input type="hidden" name="page" value="<c:out value="${param.page}" default="1"/>">
		</form>
		
		<!--表格数据-->
		<div class="tablebox" id="tablebox">
		     <jsp:include page="/em_plan/table.do"></jsp:include>
		</div>
    </div>
</div>
</body>
</html>