function subForm1(){
	// 输入框校验
	if(funCheckInForm($("#form1")[0])) {
		$("#form1").submit();
	}
}

$(document).ready(function() {
	if (0 != sign) {
		$("input").each(function() {
			$(this).attr("disabled", "true");
		});
		$("select").each(function() {
			$(this).attr("disabled", "true");
		});
	}
});