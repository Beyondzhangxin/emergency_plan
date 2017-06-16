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
        <th>计划名称</th>
        <th>演练类别</th>
        <th>演练方式</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th>演练地点</th>
        <th>填报时间</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="index" value="0"></c:set>
    <c:forEach var="emDrill" items="${drillList}">
        <c:set var="index" value="${index+1}"></c:set>
        <tr>
            <td><input type="checkbox" name="drillId" value="${emDrill.drillId}"></td>
            <td>${index}</td>
            <td><a class="link_wz" href="../em_drill/detail.do?drillId=${emDrill.drillId}"
                   target="_blank">${emDrill.drillName}</a></td>
            <td>${emDrill.typeName}</td>
            <td>${emDrill.modeName}</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${emDrill.startTime}"></fmt:formatDate></td>
            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${emDrill.endTime}"></fmt:formatDate></td>
            <td>${emDrill.drillAddr}</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${emDrill.createTime}"></fmt:formatDate></td>
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