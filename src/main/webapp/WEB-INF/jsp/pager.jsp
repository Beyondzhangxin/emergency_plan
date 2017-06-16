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
	int end = 0;
	if(total%rows==0)
		end = total/rows;
	else
		end = total/rows+1;
	request.setAttribute("end",end);
%>
总计<span>${total }</span>条 &nbsp;每页
<input type="text" class="shuzhi rows" style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/\D/g,'')" 
	onafterpaste="this.value=this.value.replace(/\D/g,'')" 
 	value='<c:out value="${param.rows}" default="10"></c:out>'>条
<input type="button" class="lastpage" value="上一页" onclick="prevPage()"/>
<c:forEach var="pageNo" begin="1" step="1" end="${end}">
<input type="button" class="thepage" value="${pageNo}"  onclick="goPageByNo(${pageNo })"/>
</c:forEach>
<input type="button" class="lastpage" value="下一页" onclick="nextPage()"/>
跳转到第 
<input type="text" class="shuzhi page"  style="ime-mode:disabled" onkeyup="this.value=this.value.replace(/\D/g,'')" 
	onafterpaste="this.value=this.value.replace(/\D/g,'')" 
 	value="<c:out value="${param.page}" default="1"></c:out>">页
<input type="button" class="btn_changepage" value="确定" onclick="goPage()">