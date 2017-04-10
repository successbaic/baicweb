$(document).ready(function() {
	if (0 != sign) {
		$("input").each(function() {
			$(this).attr("disabled", "true");
		});
	}
});

function doSub1() {
	if(!checkFormData()) {
		return;
	}		
	$("#form1").submit();
}
/**
 * 表单数据校验
 */
function checkFormData() {
/*	var warn = "";
	if(!$("#name").val()) {
		warn = warn + "姓名不能为空，";
	}
	if(!$("#personType").val()) {
		warn = warn + "人员类型布不能为空，";
	}
	if(warn) {
		alert("表单数据校验未通过"+warn+"请确认数据无误后进行保存");
		return false;
	}else{
		return true;
	}*/
	
	// 输入框校验
	if(!funCheckInForm($("#form1")[0])) {
		return false;
	} else {
		return true;
	}
}