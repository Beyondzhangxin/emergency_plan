<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ 
	page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>

	<script type="text/javascript">
	 function deleteItems() {
         var flag = false;
         for (i = 0; i < frmList.planId.length; i++) {
             if (frmList.planId[i].checked) {
                 flag = true;
                 break;
             }
         }
         if (flag){
        	 $.ajax({  
        	        url : "../em_plan_gov/delete.do",  
        	        type : "POST",  
        	        data :$("#frmList").serialize(),
        	       
        	        dataType: "json",
        	        success : function(data) 
        	        {  
        	        	if(data.status=="0000000"){
        	        		alert("删除成功");
        	        		pageList(1,10);
        	        	}
        	        	else
        	            	alert(data.message);  
        	        },  
        	        error : function(data) {  
        	        	alert(data.status + " : " + data.statusText + " : " + data.responseText);  
        	        }  
        	   });  
         }
         else
             alert('至少选择一个需要删除的预案。');

     }
	</script>
 <div class="contentbox" id="contentbox">
 <p class="content_head_form">
     <span class="content_title_form">应急预案</span>
         <span class="btnbox">
             <a class="btn2 btn_add" href="../em_plan_gov/detail.do" target="_blank">添加</a>
             <a class="btn2 btn_delete" href="javascript:deleteItems()">删除</a>
             <a class="btn2 btn_refresh" href="javascript:currPage()">刷新</a>
         </span>
     <br class="clearfix"/>
 </p>
 <form action="../em_plan_gov/table.do" name="frmSearch" id="frmSearch" method="post">
 		<input type="hidden" name="rows" value="<c:out value="${param.rows}" default="10"/>">
         <input type="hidden" name="page" value="<c:out value="${param.page}" default="1"/>">
 </form>
 <!--表格数据-->
 <form action="delete.do" method="post" name="frmList"  id="frmList">
 <div class="tablebox" id="tablebox">
     <jsp:include page="/em_plan_gov/table.do"></jsp:include>
  
 </div>
 </form>
</div>
  