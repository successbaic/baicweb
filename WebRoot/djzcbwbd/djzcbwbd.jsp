<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<title>登记注册百问百答</title>
<style type="text/css">
table {
font-family: 锟斤拷锟斤拷;
font-size: 10pt;
border-color:44AED5;
border-width: 1px;
border-collapse: collapse;
}

.firstMenu{
background-image:url(../images/main/myMenuone.gif);
font-weight:600;
color:#FFFFFF;
}
.activeChan{
color:#AA0219;
font-weight:600;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color:#000000;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
	color:#AA0219;
	font-weight:600;
}
.tdbt{	
	 background-image:url(../images/main/myMenu.gif);
	 cursor:hand;
}
.selFont{
	color:#0277FA;
	font-weight:600;
}
</style>
<script type="text/javascript">

var oldid="1";
function menuChange(obje,id){
	if(oldid==id){
		return;
	}else{
		var imid="i"+id;
		var oldimid="i"+oldid;	
		var fid="f"+id;
		var oldfid="f"+oldid;
		var j="d"+id+".jsp";
		document.getElementById(imid).src="../images/main/gjt2.gif";
		document.getElementById(oldimid).src="../images/main/gjt1.gif";
		document.getElementById(fid).className="selFont";
		document.getElementById(oldfid).className="";
		document.getElementById("frmmain").src=j;
		oldid=id;
	}
}
function switchSysBar()
{
	if (document.all("frmleft").style.display=="none")
	{
		document.getElementById("ycid").src="../images/main/yc1.png";
		document.all("frmleft").style.display="";
	}
	else{
		document.getElementById("ycid").src="../images/main/yc2.png";
		document.all("frmleft").style.display="none";
	}
 }

</script>
</head> 
<body>
<TABLE width="100%" height="72px" border="1">
  <tr>
  	<td style="background-image:url(../images/main/top-left.jpg);border-right-style: none;border-right-width: medium;" width="400px"></td>
  	<td style="background-image:url(../images/main/top-center.jpg);border-left-style: none;border-left-width: medium;"></td>
  </tr>
</table>

  <table width="100%" border="1" align="center" height="86%" bgcolor="#D5E2EA">
  <tr>
    <td id="frmleft" width="260px" style="margin: 0px" bgcolor="#D5E2EA">
    	<table align="center" width="240px" bgcolor="#FFFFFF" height="98%" cellpadding="0" cellspacing="0">
			<tr>
			<td height="48px" bgcolor="#D5E2EA" align="center"><img src="../images/main/gddh.png"></td>
			</tr>
			<tr>
			<td class="firstMenu" valign="middle" height="28px" style="font-size:15px;">
			&nbsp;&nbsp;&nbsp;&nbsp;
			登记注册百问百答
			</td></tr>
			<tr><td class="tdbt" height="26px" onclick="menuChange(this,'1')">
				&nbsp;
				<IMG id="i1" src="../images/main/gjt2.gif">
				<font id="f1" class="selFont">关于企业名称</font>
			</td></tr><tr><td class="tdbt" height="26px" onclick="menuChange(this,'2')">
				&nbsp;
				<IMG id="i2" src="../images/main/gjt1.gif">
				<font id="f2">关于注册资本</font>
			</td></tr><tr><td class="tdbt" height="26px" onclick="menuChange(this,'3')">
				&nbsp;
				<IMG id="i3" src="../images/main/gjt1.gif">
				<font id="f3">关于公司及分支机构设立</font>
			</td></tr><tr><td class="tdbt" height="26px" onclick="menuChange(this,'4')">
				&nbsp;
				<IMG id="i4" src="../images/main/gjt1.gif">
				<font id="f4">关于股东、股权</font>
			</td></tr><tr><td class="tdbt" height="26px" onclick="menuChange(this,'5')">
				&nbsp;
				<IMG id="i5" src="../images/main/gjt1.gif">
				<font id="f5">法定代表人和董事、监事等人员</font>
			</td></tr><tr><td class="tdbt" height="26px" onclick="menuChange(this,'6')">
				&nbsp;
				<IMG id="i6" src="../images/main/gjt1.gif">
				<font id="f6">关于经营范围及前置审批</font>
			</td></tr><tr><td class="tdbt" height="26px" onclick="menuChange(this,'7')">
				&nbsp;
				<IMG id="i7" src="../images/main/gjt1.gif">
				<font id="f7">关于住所</font>
			</td></tr><tr><td class="tdbt" height="26px" onclick="menuChange(this,'8')">
				&nbsp;
				<IMG id="i8" src="../images/main/gjt1.gif">
				<font id="f8">关于公司解散、合并、分立</font>
			</td></tr><tr><td class="tdbt" height="26px" onclick="menuChange(this,'9')">
				&nbsp;
				<IMG id="i9" src="../images/main/gjt1.gif">
				<font id="f9">非公司企业法人及分支、营业单位</font>
			</td></tr><tr><td class="tdbt" height="26px" onclick="menuChange(this,'10')">
				&nbsp;
				<IMG id="i10" src="../images/main/gjt1.gif">
				<font id="f10">关于收费标准</font>
			</td></tr><tr><td class="tdbt" height="26px" onclick="menuChange(this,'11')">
				&nbsp;
				<IMG id="i11" src="../images/main/gjt1.gif">
				<font id="f11">政策优惠及其他</font>
			</td></tr>
			<tr><td></td></tr>	
			</table>
    </td>
    <td width="5px">
	<img id="ycid" src="../images/main/yc1.png" onClick="switchSysBar()" title="关闭/打开左栏" style="cursor:pointer;">
	</td>
    <td align="center">
		<iframe id="frmmain" name="main" width="98%" height="98%" scrolling="auto" frameborder="0" src="d1.jsp"></iframe>
	</td>
  </tr>
  <tr>
    <td colspan="3" height="5px">&nbsp;</td>
    </tr>
</table>
</body>
</html>