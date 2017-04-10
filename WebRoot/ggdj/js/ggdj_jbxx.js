$(document).ready(function() {
	if (0 != sign) {
		$("input").each(function() {
			$(this).attr("disabled", "true");
		});
		$("select").each(function() {
			$(this).attr("disabled", "true");
		});
	}
	// 选择框复制
	if (entType) {
		$("#entType").val(entType);
	}
	if (entProp) {
		$("#entProp").val(entProp);
	}
	if (mediaLevel) {
		$("#mediaLevel").val(mediaLevel);
	}
});
/**
 * 动态行增加
 * 
 * @param curRow
 */
function addRow(curRow) {
	var content = [];
	content.push('<tr>');
	content.push('<td class="lc2" colspan="3">');
	content
			.push('<input type="text" name="MJMC" size="60" title="媒介材料" disblank maxlength=50 ">&nbsp;<font color="red">*</font>');
	content.push('</td>');
	content.push('<td align="center" class="lc1" colspan="1" >');
	// content.push('<input class="button" type="button" onclick="addRow(this);"
	// value="增加"></input>&nbsp;&nbsp;&nbsp;&nbsp;');
	content
			.push('<input class="button" type="button" onclick="delRow(this);" value="删除"></input>');
	content.push('</td>');
	content.push('</tr>');
	var row = content.join("");
	$(curRow).parent().parent().parent().append(row);
}
/**
 * 动态行删除
 * 
 * @param curRow
 */
function delRow(curRow) {
	$(curRow).parent().parent().remove();
}
/**
 * 提交表单
 */
function subForm1() {
	// 校验表单数据
	if (!checkFormData()) {
		return;
	}
	$("#form1").submit();
}
/**
 * 数据校验
 * 
 * @returns {Boolean}
 */
function checkFormData() {
	// 输入框校验
	if(!funCheckInForm($("#form1")[0])) {
		return false;
	} 
	// 媒介材料校验
	if($("[name='MJMC']").length == 0) {
		alert("请至少填写一项媒介名称信息！");
		return false;
	}
	return true;
}