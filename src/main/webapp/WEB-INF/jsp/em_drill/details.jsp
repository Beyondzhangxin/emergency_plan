<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ 
	page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<html xmlns="http://www.w3.org/1999/xhtml">  
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>应急预案管理系统</title>
<link href="../css/project.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/all.js"></script>
</head>

<body>
<!--内容区-->
<div class="mainbox">
	<div class="contentbox">
        <p class="content_head_form">
            <span class="content_title_form">演练计划详细</span>
            <span class="btnbox">
            	<a class="btn2 btn_refresh" href="javascript:history.go(0)">刷新</a>
                <a class="btn2 btn_close" href="javascript:window.close()">关闭</a>
            </span>
            <br class="clearfix"/>
        </p>
      
       
        <div class="mainbox">
	
        <!--物资详细页-->
        <table class="formtable" border="0" cellpadding="0" cellspacing="0" width="95%">
            <tr>
                <td width="20%" class="txtright">
                    计划名称
                </td>
                <td width="30%">
                   ${emDrill.drillName}
                </td>
                
                <td width="20%" class="txtright">
                    演练类别
                </td>
                <td width="30%">
                    ${emDrill.typeName}
                </td>
            </tr>
            <tr>
                <td width="20%" class="txtright">
                    演练方式
                </td>
                <td width="30%">
                   ${emDrill.modeName}
                </td>
                
                <td width="20%" class="txtright">
                    开始时间
                </td>
                <td width="30%">
                	<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${emDrill.startTime}"/>
                </td>
            </tr>
            <tr>
                <td width="20%" class="txtright">
                    结束时间
                </td>
                <td width="30%">
                    <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${emDrill.endTime}"/>
                </td>
                
                <td width="20%" class="txtright">
                    演练地点
                </td>
                <td width="30%">
                	${emDrill.drillAddr}
                </td>
            </tr>
            <tr>
                <td width="20%" class="txtright">
                    演练内容
                </td>
                <td width="30%">
                   ${emDrill.drillContent}
                </td>
                
                <td width="20%" class="txtright">
                    
                </td>
                <td width="30%">
                	
                </td>
            </tr>
        </table>
    </div>
</div>
    </div>
</div>

</body>
</html>
