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
            <span class="content_title_form">应急预案详细</span>
            <span class="btnbox">
            	<a class="btn2 btn_refresh" href="javascript:history.go(0)">刷新</a>
                <a class="btn2 btn_close" href="javascript:window.close()">关闭</a>
            </span>
            <br class="clearfix"/>
        </p>
      
       
        <table class="formtable" border="0" cellpadding="0" cellspacing="0" width="95%">
            <tr>
                <td width="20%" class="txtright">
                    预案名称
                </td>
                <td width="30%">
                    ${emplan.planName }
                </td>
                
                <td width="20%" class="txtright">
                 预案类型
                </td>
                <td width="30%">
                     ${emplan.planTypeName }
                </td>
            </tr>
            <tr>
                <td width="20%" class="txtright">
                    适用领域
                </td>
                <td width="30%">
                    ${emplan.planUsageName }
                </td>
                
                <td width="20%" class="txtright">
                    预案内容
                </td>
                <td width="30%">
                	<a href="download.do?planId=${emplan.planId}" class="link_tbdw">${emplan.fileName}</a>
                </td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>
