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
    <script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../laydate/laydate.js"></script>

</head>

<body>
<!--内容区-->
<div class="mainbox">
    <div class="contentbox">
        <p class="content_head_form">
            <span class="content_title_form">演练计划详细</span>
            <span class="btnbox">
            	<a class="btn2 btn_refresh" href="javascript:history.go(0)">刷新</a>
            	<a class="btn2 btn_save" href="javascript:save()">保存</a>
				<a class="btn2 btn_save" href="javascript:saveAndClose()">保存并关闭</a>
				<a class="btn2 btn_close" href="javascript:window.close()">关闭</a>
            </span>
            <br class="clearfix" />
        </p>
        <form action="save.do" id="frmDetail" name="frmDetail" method="post" enctype="multipart/form-data">
            <input type="hidden" class="txtright" name="drillId" value="${emDrill.drillId}">
            <!--物资详细页-->
            <table class="formtable" border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr>
                    <td width="20%" class="txtright">
                        <b class="must">*</b> 计划名称
                    </td>
                    <td width="30%">
                        <input type="text" class="txtinput" id="drillName" name="drillName" value="${emDrill.drillName }">&nbsp;<span
                            id="drillName_msg" style="color: red"></span>
                    </td>

                    <td width="20%" class="txtright">
                        <b class="must">*</b> 演练类别
                    </td>
                    <td width="30%">
                        <select class="formselect" name="drillType">
                            <jsp:include page="/pub/drillTypeForSelect.do"></jsp:include>
                        </select>
                        <c:if test="${emDrill.drillType!=null}">
                            <script type="text/javascript">selectDefault(frmDetail.drillType, "${emDrill.drillType}")</script>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td width="20%" class="txtright">
                        <b class="must">*</b> 演练方式
                    </td>
                    <td width="30%">
                        <select class="formselect" name="drillMode">
                            <jsp:include page="/pub/drillModeForSelect.do"></jsp:include>
                        </select>
                        <c:if test="${emDrill.drillMode!=null}">
                            <script type="text/javascript">selectDefault(frmDetail.drillMode, "${emDrill.drillMode}")</script>
                        </c:if>
                    </td>

                    <td width="20%" class="txtright">
                        <b class="must">*</b> 开始时间
                    </td>
                    <td width="30%">
                        <input type="text" class="txtinput" id="startTime" name="startTime"
                               value="<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${emDrill.startTime}"/>">&nbsp;<span
                            id="startTime_msg" style="color: red"></span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" class="txtright">
                        <b class="must">*</b> 结束时间
                    </td>
                    <td width="30%">
                        <input type="text" class="txtinput" id="endTime" name="endTime"
                               value="<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${emDrill.endTime}"/>">&nbsp;<span
                            id="endTime_msg" style="color: red"></span>
                    </td>

                    <td width="20%" class="txtright">
                        <b class="must">*</b>演练地点
                    </td>
                    <td width="30%">
                        <input type="text" class="txtinput" id="drillAddr" name="drillAddr"
                               value="${emDrill.drillAddr }">&nbsp;<span
                            id="drillAddr_msg" style="color: red"></span>
                    </td>
                </tr>
                <tr>
                    <td width="20%" class="txtright">
                        <b class="must">*</b><br>演<br>练<br>内<br>容
                    </td>
                    <td width="60%" colspan="3" style="padding-right:13.5%">
                        <textarea id="editor" datatype="*" nullmsg="请填写文章内容" style="width:100%;" class="drillContent"
                                  name="drillContent"></textarea> &nbsp;<span
                            id="drillContent_msg" style="color: red"></span>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</div>
<script>
    var ue = UE.getEditor('editor');
    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function (action) {
        var drillId = $(".drillId").val();
        if (action == 'uploadimage') {
            //图片上传
            return 'http://localhost:8080/em/pub/uploadImage.do?libraryCode=1009&standardId=' + drillId;
        }
        if (action == 'uploadfile') {
            //附件上传
            return 'http://localhost:8080/em/pub/uploadfile.do?libraryCode=1009&standardId=' + drillId;
        } else {
            return this._bkGetActionUrl.call(this, action);
        }
    }

    laydate({
        elem: '#startTime',
        format: 'YYYY/MM/DD hh:mm:ss',
        min: laydate.now(),
        max: '2099-06-16 23:59:59',
        istime: true,
        istoday: true,
        festival: true
    });
    laydate({
        elem: '#endTime',
        format: 'YYYY/MM/DD hh:mm:ss',
        min: laydate.now(),
        max: '2099-06-16 23:59:59',
        istime: true,
        istoday: true,
        festival: true
    });

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
                    if (data.drillName)
                        $("#drillName_msg").html(data.drillName);
                    if (data.startTime)
                        $("#startTime_msg").html(data.startTime);
                    if (data.endTime)
                        $("#endTime_msg").html(data.endTime);
                    if (data.drillAddr)
                        $("#drillAddr_msg").html(data.drillAddr);
                    if (data.drillContent)
                        $("#drillContent_msg").html(data.drillContent);
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
                    if (data.drillName)
                        $("#drillName_msg").html(data.drillName);
                    if (data.startTime)
                        $("#startTime_msg").html(data.startTime);
                    if (data.endTime)
                        $("#endTime_msg").html(data.endTime);
                    if (data.drillAddr)
                        $("#drillAddr_msg").html(data.drillAddr);
                    if (data.drillContent)
                        $("#drillContent_msg").html(data.drillContent);
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
</body>
</html>
