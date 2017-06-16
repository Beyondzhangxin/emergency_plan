<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ 
	page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%
	int total = (Integer)request.getAttribute("total");
	String rowStr = request.getParameter("rows");
	int rows = 10;
	
	if(rowStr!=null) rows = Integer.parseInt(rowStr);
	int endPage = 0;
	if(total%rows==0)
		endPage = total/rows;
	else
		endPage = total/rows+1;
	request.setAttribute("endPage",endPage);
	int pageNum = 1;
	if(request.getParameterMap().containsKey("page")){
		 pageNum = Integer.parseInt(request.getParameter("page"));
	}
	int startPage = 1;
	if(pageNum>=10){
		startPage = 10;
	}
	
	if(endPage>startPage+10){
		endPage = startPage+10;
	}
	 request.setAttribute("startPage",startPage);
	 request.setAttribute("pageNum",pageNum);
%>

总计<span>${total }</span>条 &nbsp;每页
<input type="text" class="shuzhi rows" style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/\D/g,'')" 
	onafterpaste="this.value=this.value.replace(/\D/g,'')" 
 	value='<c:out value="${param.rows}" default="10"></c:out>'>条
<input type="button" class="lastpage" value="上一页"
<c:if test="${pageNum==1}"> disabled </c:if>
onclick="prevPage()"/>


<c:forEach var="pageNo" begin="${startPage}" step="1" end="${endPage}">
<c:choose>
<c:when test="${pageNum==pageNo}">
<input type="button" class="thepage1" value="${pageNo}"/>
</c:when>
<c:otherwise>
<input type="button" class="thepage" value="${pageNo}"  onclick="goPageByNo(${pageNo})"/>
</c:otherwise>
</c:choose>
</c:forEach>
<input type="button" class="lastpage" value="下一页"
<c:if test="${pageNum==endPage}"> disabled </c:if>
	onclick="nextPage()"/>

跳转到第 
<input type="text" class="shuzhi page"  style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/\D/g,'')" 
	onafterpaste="this.value=this.value.replace(/\D/g,'')" 
 	value="<c:out value="${param.page}" default="1"></c:out>">页
<input type="button" class="btn_changepage" value="确定" onclick="goPage()">