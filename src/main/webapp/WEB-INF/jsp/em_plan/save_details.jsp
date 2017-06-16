<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <script>
        function save() {
            formData = new FormData($("#frmDetail")[0]);

            $.ajax({
                url: "save.do",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                dataType: "json",
                success: function (data) {
                    if (data.status == "0000000")
                        alert("保存成功");
                    else if (data.status == "DTVY001") {
                        if (data.planName)
                            $("#planName_msg").html(data.planName);
                        if (data.fileContent)
                            $("#fileContent_msg").html(data.fileContent);
                    } else
                        alert(data.message);
                },
                error: function (data) {
                    alert(data.status + " : " + data.statusText + " : " + data.responseText);
                }
            });
        }

        function saveAndClose() {
            formData = new FormData($("#frmDetail")[0]);
            $.ajax({
                url: "save.do",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                dataType: "json",
                success: function (data) {
                    if (data.status == "0000000") {
                        alert("保存成功");
                        window.close();
                    }
                    else if (data.status == "DTVY001") {
                        if (data.planName)
                            $("#planName_msg").html(data.planName);
                        if (data.fileContent)
                            $("#fileContent_msg").html(data.fileContent);
                    }
                    else
                        alert(data.message);
                },
                error: function (data) {
                    alert(data.status + " : " + data.statusText + " : " + data.responseText);
                }
            });
        }
    </script>
</head>

<body>
<!--内容区-->
<div class="mainbox">
    <div class="contentbox">
        <p class="content_head_form">
            <span class="content_title_form">应急预案详细</span>
            <span class="btnbox">
            	<a class="btn2 btn_refresh" href="javascript:history.go(0)">刷新</a>
            	<a class="btn2 btn_save" href="javascript:save()">保存</a>
				<a class="btn2 btn_save" href="javascript:saveAndClose()">保存并关闭</a>
				<a class="btn2 btn_close" href="javascript:window.close()">关闭</a>
            </span>
            <br class="clearfix" />
        </p>

        <form action="save.do" id="frmDetail" name="frmDetail" method="post" enctype="multipart/form-data">
            <input type="hidden" class="txtright" name="planId" value="${emplan.planId }">
            <table class="formtable" border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr>
                    <td width="20%" class="txtright">
                        <b class="must">*</b> 预案名称
                    </td>
                    <td width="30%">
                        <input type="text" class="txtinput" id="planName" name="planName" value="${emplan.planName }">&nbsp;<span
                            id="planName_msg" style="color: red"></span>
                    </td>

                    <td width="20%" class="txtright">
                        <b class="must">*</b> 预案类型
                    </td>
                    <td width="30%">
                        <select name="planType" id="planType" class="formselect">
                            <jsp:include page="/pub/planTypeForSelect.do"></jsp:include>
                        </select>
                        <c:if test="${emplan.planType!=null}">
                            <script type="text/javascript">selectDefault(frmDetail.planType, "${emplan.planType}")</script>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td width="20%" class="txtright">
                        <b class="must">*</b>  适用领域
                    </td>
                    <td width="30%">
                        <select name="usageScope" id="usageScope" class="formselect">
                            <jsp:include page="/pub/planUsageForSelect.do"></jsp:include>
                        </select>
                        <c:if test="${emplan.usageScope!=null}">
                            <script type="text/javascript">selectDefault(frmDetail.usageScope, "${emplan.usageScope}")</script>
                        </c:if>
                    </td>
                    <td width="20%" class="txtright">
                        <b class="must">*</b>  预案内容
                    </td>
                    <td width="30%">
                        <input type="file" name="fileContent" id="fileContent" value="${emplan.fileName}">&nbsp;<span
                            id="fileContent_msg" style="color: red"></span><a href="download.do?planId=${emplan.planId}"
                                                                              class="link_tbdw">${emplan.fileName}</a>
                    </td>
                </tr>
            </table>
        </form>

    </div>
</div>

</body>
</html>
