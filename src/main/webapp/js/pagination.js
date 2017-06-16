function pageList(pageNum,rows) {
	frmSearch.page.value    = pageNum;
    frmSearch.rows.value    = rows;
    $("#tablebox").html("正在加载数据，请稍候......")
    $.ajax({  
        url : frmSearch.action,  
        type : "POST",  
        data :$('#frmSearch').serialize(),
        dataType:"html",
        success : function(data) 
        {  
           $("#tablebox").html(data);
        },  
        error : function(data) {  
        	$("#tablebox").html(data);
        }  
   });  
    
}

function goPage(url) {
	pageList($('.page').val(),$('.rows').val());
	
}

function goPageByNo(pageNo) {
	pageList(pageNo,$('.rows').val());
}

function nextPage() {
	pageList(parseInt($('.page').val()) +1, $('.rows').val());
}


function currPage() 
{
	pageList(parseInt($('.page').val()), $('.rows').val());
}

function prevPage() {
	pageList(parseInt($('.page').val()) -1, $('.rows').val());
}