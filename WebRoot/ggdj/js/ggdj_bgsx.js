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
	if (entProBe) {
		$("#entProBe").val(entProBe);
	}
	if (entProAf) {
		$("#entProAf").val(entProAf);
	}
});

function setvalue(obj) {
	if (obj.value == "06") {
		if (obj.checked) {
//			eval("document.form1.opfromaf.disabled=false");
			eval("document.form1.optoaf.disabled=false");
		} else {
//			eval("document.form1.opfromaf.disabled=true");
			eval("document.form1.optoaf.disabled=true");
//			eval("document.form1.opfromaf.value=''");
			eval("document.form1.optoaf.value=''");
		}
	} else if (obj.value == "03") {
		if (obj.checked) {
			$("input[name='mediaaf']").each(function() {
				$(this).attr("disabled", false);
			});
			$("#addButton").attr("disabled", false);
		} else {
			$("input[name='mediaaf']").each(function() {
				$(this).attr("disabled", true);
				$(this).val("");
			});
			$("#addButton").attr("disabled", true);
			$("input[name='delRowBtn']").each(function() {
				$(this).parent().parent().remove();
			});

		}
	} else {
		if (obj.checked) {
			eval("document.form1.ALTAF" + obj.value + ".disabled=false");
		} else {
			eval("document.form1.ALTAF" + obj.value + ".value=''");
			eval("document.form1.ALTAF" + obj.value + ".disabled=true");
		}
	}
}

function addRow(curRow) {
	var content = [];
	content.push('<tr>');
	content.push('<td align="center" class="lc1" colspan="2">');
	content.push('</td>');
	content.push('<td class="lc2" >');
	content
			.push('<input type="text" size="45" name="mediabe" readonly title="变更前媒介名称" />');
	content.push('</td>');
	content.push('<td class="lc2" >');
	content
			.push('<input type="text" name="mediaaf" size="50"  title="变更后媒介名称" disblank maxlength=50>');
	content
			.push('<input name="delRowBtn" class="button" type="button" onclick="delRow(this);" value="删除"></input>');
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

function doSub() {
	if (form1errorCheck()) {
		$("input").each(function() {
			$(this).attr("disabled", false);
		});
		$("select").each(function() {
			$(this).attr("disabled", false);
		});
		document.getElementById('subid').disabled = true;
		document.getElementById('waitdiv').style.display = '';
		document.form1.submit();
		$("input").each(function() {
			$(this).attr("disabled", "true");
		});
		$("select").each(function() {
			$(this).attr("disabled", "true");
		});
	}
}