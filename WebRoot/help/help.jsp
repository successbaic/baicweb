<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="icms" scope="application" class="com.macrosoft.icms.system.SysSystem" />
<html>
<head>
<title>使用帮助</title>
<style type="text/css">
table {
font-family: 锟斤拷锟斤拷;
font-size: 9pt;
border-color:44AED5;
border-width: 1px;
border-collapse: collapse;
}

td {
font-size: 9pt;
border-color:#A0A0A0;
line-height: 25px;
border-left-style: none;
border-left-width: medium;
border-top-style: none;
border-top-width: medium;
}
.firstMenu{
background-image:url(../images/main/fistMenu.jpg);
color:#095C90;
font-weight:normal;
}
.firstMenuSel{
background-image:url(../images/main/fistMenuSel.jpg);
font-weight:600;
color:#FFFFFF;
}
.secondMenu{
background-image:url(../images/main/secondMenu.jpg);
color:#000000;
font-weight:normal;
background-repeat:no-repeat;
font-size:13px;
cursor:pointer;
}
.secondMenuSel{
background-image:url(../images/main/secondMenuSel.jpg);
color:#0277FA;
font-weight:600;
background-repeat:no-repeat;
font-size:13px;
cursor:pointer;
}
.activeChan{
color:#AA0219;
font-weight:600;
}
li{
list-style:none;
margin:0;
padding:0;
line-height:24px;
background-repeat:no-repeat;
font-size:13px;
cursor:pointer;
}
ul{
margin:0;
padding:0;
text-align:center;
color:#000000;
font-weight:normal;
list-style-type:none;
}
hr{
border:1 dashed #987cb9;
margin-top:0; 
margin-bottom:0;
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
</style>
<script type="text/javascript">
var oldActive="LI1";
function FmenuClick(id){
	var a=document.getElementById(id);	
	if(a.className=="secondMenu"){	
		var url=id+".jsp";
		a.className="secondMenuSel";
		parent.document.getElementById("frmmain").src=url;
		document.getElementById(oldActive).className="secondMenu";
		oldActive=id;		
	}	
}
function body_load(){	
	document.getElementById("LI1").className="secondMenuSel";
}
</script>
</head> 
<body onload="body_load()">
<TABLE width="100%" height="72px" border="1">
  <tr>
  	<td style="background-image:url(../images/main/top-left.jpg);border-right-style: none;border-right-width: medium;" width="400px"></td>
  	<td style="background-image:url(../images/main/top-center.jpg);border-left-style: none;border-left-width: medium;"></td>
  </tr>
</table>

  <table width="100%" border="1" align="center" height="86%" bgcolor="#D5E2EA">
  <tr>
    <td id="frmleft" width="220px" style="margin: 0px" bgcolor="#D5E2EA">
    	<table align="center" cellspacing="0" cellpadding="0" width="200px" bgcolor="#FFFFFF" height="98%">
			<tr>
			<td height="48px" bgcolor="#D5E2EA"><img src="../images/main/gddh.png"></td>
			</tr>
			<tr>
			<td class="firstMenuSel" valign="bottom" height="28px" style="font-size:15px;" align="center">
			主 菜 单
			</td>
			</tr>
			<tr>
			<td valign="top">
			<li id="LI1" class="secondMenu" onClick="FmenuClick(this.id)">&nbsp;&nbsp;
			功能简介</li>
			<li id="LI2" class="secondMenu" onClick="FmenuClick(this.id)">&nbsp;&nbsp;
			注册及登录</li>
			<li id="LI3" class="secondMenu" onClick="FmenuClick(this.id)">&nbsp;&nbsp;
			<%if(!"370100".equals(icms.getCURRENTUNIT())){%>名称登记</li>
			<li id="LI4" class="secondMenu" onClick="FmenuClick(this.id)">&nbsp;&nbsp;
			<%} %>
			企业登记</li>
			<li id="LI5" class="secondMenu" onClick="FmenuClick(this.id)">&nbsp;&nbsp;
			个体户登记</li>
			<li id="LI6" class="secondMenu" onClick="FmenuClick(this.id)">&nbsp;&nbsp;
			合作社登记</li>
			<li id="LI7" class="secondMenu" onClick="FmenuClick(this.id)">&nbsp;&nbsp;
			办理进度查询</li>
			<li id="LI8" class="secondMenu" onClick="FmenuClick(this.id)">&nbsp;&nbsp;
			辅助功能</li>
			</td>
			</tr>
			</table>
    </td>
    <td width="5px">
	<img id="ycid" src="../images/main/yc1.png" onClick="switchSysBar()" title="关闭/打开左栏" style="cursor:pointer;">
	</td>
    <td align="center">
		<iframe id="frmmain" name="main" width="98%" height="98%" scrolling="auto" frameborder="0" src="LI1.jsp"></iframe>
	</td>
  </tr>
  <tr>
    <td colspan="3" height="5px">&nbsp;</td>
    </tr>
</table>
</body>
</html>