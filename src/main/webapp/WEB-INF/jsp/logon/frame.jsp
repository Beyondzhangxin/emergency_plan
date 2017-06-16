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
	<title>应急预案管理系统</title>
	<link rel="stylesheet" type="text/css" href="../css/currency.css">
	<link rel="stylesheet" type="text/css" href="../css/project.css">
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/all.js"></script>
	<script type="text/javascript" src="../js/pagination.js"></script>
</head>
<body>
  <div class="headbox">
        <img class="logo_pt" src="../images/logo.png" alt="logo"/>
        <div class="link_box">
            <a class="nav_link" href="">首页</a>
            <a class="nav_link nav_link_center" href="">系统中心</a>
            <a class="nav_link nav_link_user" href="javascript:void(0)">个人中心</a>
        </div>
        <div class="title_sys">应急预案管理系统</div>
        <div class="navbox">
        	<c:set var="defaultUrl"/>
         	<c:forEach var="navigation" items="${navList}" >
				<c:choose >
					<c:when test="${empty navigation.children}">
					<c:set var="dataHref">../${navigation.funcid}/${navigation.action}.do</c:set>       	
	            </c:when>
	            <c:otherwise>
	            	<c:set var="dataHref" >../logon/subframe.do?parentId=${navigation.id}</c:set>   
	            </c:otherwise>
	            </c:choose>
	            <c:if test="${empty defaultUrl}">
	            	<c:set var="defaultUrl" value="${dataHref}"/>
	            </c:if>
	            <a class="nav_item" onClick="javascript:openUrl('${dataHref}','mainbox')">${navigation.text}</a>
   			</c:forEach>
   			
        </div>   
        <br class="clearfix"/>
    </div>
    <br class="clearfix"/>
    <div style="width:100%;height:100%" id="mainbox">
    	
    </div>
    <script type="text/javascript">openUrl('${defaultUrl}','mainbox');</script>
</body>
</html>
