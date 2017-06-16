<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ 
	page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>


<div class="search_item">
    <span class="search_name">单位名称</span>
    <input type="text" class="txtinput"  name="companyName">
</div>
<div class="search_item">
    <span class="search_name">计划名称</span>
    <input type="text" class="txtinput"  name="planName">
</div>
<div class="search_item">
    <span class="search_name">演练类别</span>
    <select class="formselect" name="drillType">
        <option value="">--请选择--</option>
        <jsp:include page="/pub/drillTypeForSelect.do"></jsp:include>
    </select>
</div>
<div class="search_item">
    <span class="search_name">演练方式</span>
    <select class="formselect" name="drillMode" >
        <option value="">--请选择--</option>
         <jsp:include page="/pub/drillModeForSelect.do"></jsp:include>
    </select>
</div>
<div class="search_item">
    <span class="search_name">开始时间</span>
    <input type="text" class="txtinput" name="startTime">
</div>
<div class="search_item">
    <span class="search_name">结束时间</span>
    <input type="text" class="txtinput" name="endTime">
</div>


<br class="clearfix"/>
<div style="text-align:center;">
    <input type="button" class="btn btn_emPlans"  value="搜索" onclick="pageList(1,10)">
</div>
