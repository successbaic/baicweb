<%@ page contentType="text/html;charset=GBK"%>
<html><head><title>ÇëÑ¡Ôñ¶àÒô×ÖµÄÆ´Òô</title></head>
<SCRIPT LANGUAGE='javascript'>
var tmp = window.dialogArguments;
var arr = tmp.split(",");
function ListPY()
{
	for (i=1;i<arr.length;i++ )
	{
		OptionsAddPY(document.forms[0].pinyin, arr[i]);
	}
	document.getElementById('HZ').innerHTML="ºº×Ö£º¡¾ <font color=red>"+arr[0]+"</font> ¡¿";
}
function OptionsAddPY( obj,sValue)
{
	var myOption;
	myOption = document.createElement("OPTION");
	myOption.value=sValue;
	myOption.text=sValue;
	obj.add( myOption);
}
function retfunc()
{	
	pinyin = document.forms[0].pinyin;
	if (pinyin.selectedIndex==-1)
	{
		pinyin.selectedIndex=0;
	}
	var arr = pinyin.options[pinyin.selectedIndex].text;
	window.returnValue=arr;
	window.close();
}
</SCRIPT>
<body onload="ListPY()">
<form name="form1" method="POST" style="margin:0px;">
<table border="1" cellpadding="0" cellspacing="0" width="100%" align="center">
  <tr><td class="tc" id="HZ">ºº×Ö£º</td></tr>
  <tr>
	<td class="lc1">
		<select size="20" name="pinyin" id="pinyin" style="height:118px;width:100px;font-size:16pt;font-family: Microsoft Sans Serif;" ondblclick="retfunc();">
		</select>
	</td></tr>
  <tr>
    <td class="fc">
      <input type="button" value="È· ¶¨" name="OK" onclick='retfunc();'>
	 </td>
  </tr>
</table></form></body></html>
