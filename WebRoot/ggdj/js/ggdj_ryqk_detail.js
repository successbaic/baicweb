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
 * ������У��
 */
function checkFormData() {
/*	var warn = "";
	if(!$("#name").val()) {
		warn = warn + "��������Ϊ�գ�";
	}
	if(!$("#personType").val()) {
		warn = warn + "��Ա���Ͳ�����Ϊ�գ�";
	}
	if(warn) {
		alert("������У��δͨ��"+warn+"��ȷ�������������б���");
		return false;
	}else{
		return true;
	}*/
	
	// �����У��
	if(!funCheckInForm($("#form1")[0])) {
		return false;
	} else {
		return true;
	}
}