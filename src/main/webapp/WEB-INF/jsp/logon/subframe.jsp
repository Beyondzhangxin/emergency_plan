<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ 
	page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>

<p class="content_tab_box">
<c:set var="defaultUrl"/>
<c:set var="tabStyle" value="content_tab1"/>
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
<a class="content_tab ${tabStyle}" onClick="javascript:openUrl('${dataHref}','contentbox');tabSelected(this);">${navigation.text}</a>
<c:if test="${not empty tabStyle}">
     <c:set var="tabStyle"/>
</c:if>	
</c:forEach>
<script type="text/javascript">openUrl('${defaultUrl}','contentbox');</script>
</p>
<div class="contentbox" id="contentbox" style="width:100%;height:100%">
</div>

