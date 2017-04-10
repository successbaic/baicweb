$(document).ready(function() {
	if (0 != sign) {
		$("input").each(function() {
			$(this).attr("disabled", "true");
		});
		$("select").each(function() {
			$(this).attr("disabled", "true");
		});
	}
	if (entType) {
		$("#entType").val(entType);
	}
	if (canRea) {
		$("#canRea").val(canRea);
	}
});

function subForm1() {
	if (funCheckInForm($("#form1")[0])) {
		$("#form1").submit();
	}
}
