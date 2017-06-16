<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <th><input type="checkbox" onClick="javascript:selectAll(this)"></th>
        <th>序号</th>
        <th>预案名称</th>
        <th>预案类别</th>
        <th>适用领域</th>
        <th>填报时间</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="index" value="0"></c:set>
    <c:forEach var="emplan" items="${emplanList}">
        <c:set var="index" value="${index+1}"></c:set>
        <tr>
            <td><input type="checkbox" name="planId" value="${emplan.planId}"></td>
            <td>${index}</td>
            <td><a class="link_wz" href="../em_plan/detail.do?planId=${emplan.planId}"
                   target="_blank">${emplan.planName}</a></td>
            <td>${emplan.planTypeName}</td>
            <td>${emplan.planUsageName}</td>
            <td><fmt:formatDate value="${emplan.reportingTime}" pattern="yyyy-MM-dd" /></td>
            <td>${emplan.companyName}</td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="9" class="tiaoye_td" style="line-height:34px; background:#f0f4fa;">
            <jsp:include page="../pub/pager.jsp"></jsp:include>
        </td>
    </tr>
    </tfoot>
</table>