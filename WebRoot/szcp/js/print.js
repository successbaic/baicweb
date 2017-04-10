/**
 * author:ZhangZhen day:2015-5-20
 */
var HKEY_Root, HKEY_Path, HKEY_Key;
HKEY_Root = "HKEY_CURRENT_USER";
HKEY_Path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
var head, foot, top, bottom, left, right;

// 取得页面打印设置的原参数数据
function PageSetup_temp() {
	try {
		var Wsh = new ActiveXObject("WScript.Shell");
		HKEY_Key = "header";
		// 取得页眉默认值
		head = Wsh.RegRead(HKEY_Root + HKEY_Path + HKEY_Key);
		HKEY_Key = "footer";
		// 取得页脚默认值
		foot = Wsh.RegRead(HKEY_Root + HKEY_Path + HKEY_Key);
		HKEY_Key = "margin_bottom";
		// 取得下页边距
		bottom = Wsh.RegRead(HKEY_Root + HKEY_Path + HKEY_Key);
		HKEY_Key = "margin_left";
		// 取得左页边距
		left = Wsh.RegRead(HKEY_Root + HKEY_Path + HKEY_Key);
		HKEY_Key = "margin_right";
		// 取得右页边距
		right = Wsh.RegRead(HKEY_Root + HKEY_Path + HKEY_Key);
		HKEY_Key = "margin_top";
		// 取得上页边距
		top = Wsh.RegRead(HKEY_Root + HKEY_Path + HKEY_Key);
		return true;
	} catch (e) {
		return false;
	}
}

// 设置网页打印的页眉页脚和页边距
function PageSetup_Null() {
	try {
		var Wsh = new ActiveXObject("WScript.Shell");
		HKEY_Key = "header";
		// 设置页眉（为空）
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, "");
		HKEY_Key = "footer";
		// 设置页脚（为空）
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, "");
		HKEY_Key = "margin_bottom";
		// 设置下页边距（0）
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, "0.750000");
		HKEY_Key = "margin_left";
		// 设置左页边距（0）
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, "0.750000");
		HKEY_Key = "margin_right";
		// 设置右页边距（0）
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, "0.750000");
		HKEY_Key = "margin_top";
		// 设置上页边距（8）
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, "0.750000");
		return true;
	} catch (e) {
		return false;
	}
}
// 设置网页打印的页眉页脚和页边距为默认值
function PageSetup_Default() {
	try {
		var Wsh = new ActiveXObject("WScript.Shell");
		HKEY_Key = "header";
		HKEY_Key = "header";
		// 还原页眉
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, head);
		HKEY_Key = "footer";
		// 还原页脚
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, foot);
		HKEY_Key = "margin_bottom";
		// 还原下页边距
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, bottom);
		HKEY_Key = "margin_left";
		// 还原左页边距
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, left);
		HKEY_Key = "margin_right";
		// 还原右页边距
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, right);
		HKEY_Key = "margin_top";
		// 还原上页边距
		Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, top);
		return true;
	} catch (e) {
		return false;
	}
}

// 打印
function print() {
	PageSetup_temp();// 取得默认值
	PageSetup_Null();// 设置页面
	if(PageSetup_temp()&&PageSetup_Null()){
		wb.execwb(6, 1);// 打印页面
		PageSetup_Default();// 还原页面设置
	}else{
		alert("打印失败！不允许ActiveX控件,请打开IE工具--internet选项--安全--本地internet--自定义级别--启用'对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本'选项");
	}
}

// 打印预览
function printpreview() {
	PageSetup_temp();// 取得默认值
	PageSetup_Null();// 设置页面
	if(PageSetup_temp()&&PageSetup_Null()){
		wb.execwb(7, 1);// 打印页面
		PageSetup_Default();// 还原页面设置
	}else{
		alert("打印失败！不允许ActiveX控件,请打开IE工具--internet选项--安全--本地internet--自定义级别--启用'对未标记为可安全执行脚本的ActiveX控件初始化并执行脚本'选项");
	}
}
