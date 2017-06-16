<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ 
	page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<table class="datetable" border="0" cellpadding="0" cellspacing="0" width="100%">
<thead>
<tr>
     <th>项目</th>
     <th>安全生产综合预案</th>
     <th>安全生产专项预案</th>
     <th>安全生产现场处置方案</th>
     <th>安全生产其他预案</th>
     <th>环保综合预案</th>
     <th>环保专项预案</th>
     <th>环保生产现场处置方案</th>
     <th>环保其他预案</th>
     <th>合计</th>
</tr>
</thead>
<tbody>
<c:set var="sumSpComp" value="0"></c:set>
<c:set var="sumSpSpec" value="0"></c:set>
<c:set var="sumSpDisp" value="0"></c:set>
<c:set var="sumSpOther" value="0"></c:set>
<c:set var="sumEpComp" value="0"></c:set>
<c:set var="sumEpSpec" value="0"></c:set>
<c:set var="sumEpDisp" value="0"></c:set>
<c:set var="sumEpOther" value="0"></c:set>
<c:forEach var="planStat"  items="${planStatList}">
<tr>
  <th><a href="../plan_stat/showCompanyPlan.do?companyId=${planStat.companyId}" class="link_tbdw" target="_blank">${planStat.companyName}</a></th>
  <td>${planStat.spComp}</td>
  <td>${planStat.spSpec}</td>
  <td>${planStat.spDisp}</td>
  <td>${planStat.spOther}</td>
  <td>${planStat.epComp}</td>
  <td>${planStat.epSpec}</td>
  <td>${planStat.epDisp}</td>
  <td>${planStat.epOther}</td>
  <td>${planStat.spComp+planStat.spSpec+planStat.spDisp+planStat.spOther+planStat.epComp+planStat.epSpec+planStat.epDisp+planStat.epOther}</td>
  </tr>
  	<c:set var="sumSpComp"   value="${sumSpComp  + planStat.spComp }"></c:set>
	<c:set var="sumSpSpec"   value="${sumSpSpec  + planStat.spSpec }"></c:set>
	<c:set var="sumSpDisp"   value="${sumSpDisp  + planStat.spDisp }"></c:set>
	<c:set var="sumSpOther"  value="${sumSpOther + planStat.spOther}"></c:set>
	<c:set var="sumEpComp"   value="${sumEpComp  + planStat.epComp }"></c:set>
	<c:set var="sumEpSpec"   value="${sumEpSpec  + planStat.epSpec }"></c:set>
	<c:set var="sumEpDisp"   value="${sumEpDisp  + planStat.epDisp }"></c:set>
	<c:set var="sumEpOther"  value="${sumEpOther + planStat.epOther}"></c:set>
</c:forEach>
 </tbody>
<tfoot>
<tr>
  <th>合计</th>
  <th>${sumSpComp}</th>
  <th>${sumSpSpec}</th>
  <th>${sumSpDisp}</th>
  <th>${sumSpOther}</th>
  <th>${sumEpComp}</th>
  <th>${sumEpSpec}</th>
  <th>${sumEpDisp}</th>
  <th>${sumEpOther}</th>
  <th>${sumSpComp+sumSpSpec+sumSpDisp+sumSpOther+sumEpComp+sumEpSpec+sumEpDisp+sumEpOther}</th>
</tr>
</tfoot>
</table>