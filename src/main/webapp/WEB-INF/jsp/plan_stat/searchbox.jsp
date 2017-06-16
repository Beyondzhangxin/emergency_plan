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
    <span class="search_name">预案名称</span>
    <input type="text" class="txtinput planName" name="planName">
</div>
<div class="search_item">
    <span class="search_name">预案类别</span>
    <select  name="planType"  class="formselect" >
    <option value="">--请选择--</option>
    <jsp:include page="/pub/planTypeForSelect.do"></jsp:include>
    </select>
</div>
<div class="search_item">
    <span class="search_name">适用领域</span>
    <select  name="usageScope"  class="formselect">
    <option value="">--请选择--</option>
    <jsp:include page="/pub/planUsageForSelect.do"></jsp:include>
    </select>
</div>

<br class="clearfix"/>
<div style="text-align:center;">
    <input type="button" class="btn btn_emPlans"  value="搜索" onclick="pageList(1,10)">
</div>
