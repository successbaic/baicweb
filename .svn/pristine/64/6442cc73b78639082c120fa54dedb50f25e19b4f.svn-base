<%@ page contentType="text/html;charset=GBK"%> 
<html>
<head>
<title>表格下载</title>
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
function FmenuClick(id,ci){
	var a=document.getElementById(id+"_U");
	if(a.style.display==""){
		a.style.display="none";
		document.getElementById(id).className=ci;
	}else{
		a.style.display="";
		ci=ci+"Sel";
		document.getElementById(id).className=ci;
	}	
}
var oldActive="NZ_LI_1F";
function urlChan(obje,evt,url){
	var e=(evt)?evt:window.event; 
	if (window.event) { 
	e.cancelBubble=true; 
	} else { 
	//e.preventDefault(); 
	e.stopPropagation(); 
	}
	document.getElementById(oldActive).className="";	
	document.getElementById(obje.id).className="activeChan";
	oldActive=obje.id;
	if(url==""){
		alert("功能完善中！");
		return;
	}
	if(url=="btxz"){
		window.open("djbg/djbg.jsp");
		return;
	}
	parent.document.getElementById("frmmain").src=url;
}
function body_load(){
	document.getElementById("NZ_LI_U").style.display="";
	document.getElementById("NZ_LI_1F").className="activeChan";
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
			<li id="NZ_LI" class="secondMenu" onClick="FmenuClick('NZ_LI','secondMenu')">&nbsp;&nbsp;
			内资企业</li>
			<ul id="NZ_LI_U" style="display:none">
			<li id="NZ_LI_1F" onClick="urlChan(this,event,'showbg.jsp?YWLX=nzgsbg')"><img src="../images/ly.gif"><span style="width:120px">公司登记表格</span></li>
			<li id="NZ_LI_2F" onClick="urlChan(this,event,'showbg.jsp?YWLX=fgsbg')"><img src="../images/ly.gif"><span style="width:120px">分公司登记表格</span></li>
			<li id="NZ_LI_3F" onClick="urlChan(this,event,'showbg.jsp?YWLX=nzfrbg')"><img src="../images/ly.gif"><span style="width:120px">非公司企业法人</span></li>
			<li id="NZ_LI_4F" onClick="urlChan(this,event,'showbg.jsp?YWLX=nzyybg')"><img src="../images/ly.gif"><span style="width:120px">营 业 单 位</span></li>            
			<li id="NZ_LI_5F" onClick="urlChan(this,event,'showbg.jsp?YWLX=grdzbg')"><img src="../images/ly.gif"><span style="width:120px">个人独资企业</span></li>
			<li id="NZ_LI_6F" onClick="urlChan(this,event,'showbg.jsp?YWLX=grdzfzbg')"><img src="../images/ly.gif"><span style="width:120px">个人独资分支</span></li>
			<li id="NZ_LI_7F" onClick="urlChan(this,event,'showbg.jsp?YWLX=hhqybg')"><img src="../images/ly.gif"><span style="width:120px">合 伙 企 业</span></li>
			<li id="NZ_LI_8F" onClick="urlChan(this,event,'showbg.jsp?YWLX=hhfzbg')"><img src="../images/ly.gif"><span style="width:120px">合伙企业分支</span></li>
			<li id="NZ_LI_9F" onClick="urlChan(this,event,'showbg.jsp?YWLX=nzjtbg')"><img src="../images/ly.gif"><span style="width:120px">集 团</span></li>
			</ul>
				
			<li id="WZ_LI" class="secondMenu" onClick="FmenuClick('WZ_LI','secondMenu')">&nbsp;&nbsp;
			外资企业</li>
			<ul id="WZ_LI_U" style="display:none">
			<li id="WZ_LI_1F" onClick="urlChan(this,event,'showbg.jsp?YWLX=wzgsbg')"><img src="../images/ly.gif"><span style="width:140px">外商投资企业</span></li>
			<li id="WZ_LI_2F" onClick="urlChan(this,event,'showbg.jsp?YWLX=wzfzbg')"><img src="../images/ly.gif"><span style="width:140px">外商投资企业分支</span></li>
			<li id="WZ_LI_3F" onClick="urlChan(this,event,'showbg.jsp?YWLX=wgjybg')"><img src="../images/ly.gif"><span style="width:140px">外国企业在中国境内<br>从事生产经营活动</span></li>
			<li id="WZ_LI_4F" onClick="urlChan(this,event,'showbg.jsp?YWLX=wgdbbg')"><img src="../images/ly.gif"><span style="width:140px">外国企业常驻代表机构</span></li>
			<li id="WZ_LI_5F" onClick="urlChan(this,event,'showbg.jsp?YWLX=wzhhbg')"><img src="../images/ly.gif"><span style="width:140px">外商投资合伙企业</span></li>
			<li id="WZ_LI_6F" onClick="urlChan(this,event,'showbg.jsp?YWLX=wzhhfzbg')"><img src="../images/ly.gif"><span style="width:140px">外商投资合伙企业分支</span></li>
			</ul>
			
			<li id="HZS_LI" class="secondMenu" onClick="FmenuClick('HZS_LI','secondMenu')">&nbsp;&nbsp;
			农民专业合作社</li>
			<ul id="HZS_LI_U" style="display:none">
			<li id="HZS_LI_1F" onClick="urlChan(this,event,'showbg.jsp?YWLX=hzsbg')"><img src="../images/ly.gif"><span style="width:120px">合作社登记表格</span></li>
			<li id="HZS_LI_2F" onClick="urlChan(this,event,'showbg.jsp?YWLX=hzsfzbg')"><img src="../images/ly.gif"><span style="width:120px">合作社分支表格</span></li>
			</ul>
			
			<li id="GT_LI" class="secondMenu" onClick="FmenuClick('GT_LI','secondMenu')">&nbsp;&nbsp;
			个体工商户</li>
			<ul id="GT_LI_U" style="display:none">
			<li id="GT_LI_1F" onClick="urlChan(this,event,'showbg.jsp?YWLX=gthbg')"><img src="../images/ly.gif"><span style="width:120px">个体户登记表格</span></li>
			</ul>
			
			<%--li id="QT_LI" class="secondMenu" onClick="FmenuClick('QT_LI','secondMenu')">&nbsp;&nbsp;
			其它</li>
			<ul id="QT_LI_U" style="display:none">
			<li id="QT_LI_1F" onClick="urlChan(this,event,'')"><img src="../images/ly.gif"> 合作社登记表格</li>
			<li id="QT_LI_2F" onClick="urlChan(this,event,'')"><img src="../images/ly.gif"> 合作社分支表格</li>
			</ul--%>

			</td>
			</tr>
			</table>
    </td>
    <td width="5px">
	<img id="ycid" src="../images/main/yc1.png" onClick="switchSysBar()" title="关闭/打开左栏" style="cursor:pointer;">
	</td>
    <td align="center">
		<iframe id="frmmain" name="main" width="98%" height="98%" scrolling="auto" frameborder="0" src="nzgsbg.jsp"></iframe>
	</td>
  </tr>
  <tr>
    <td colspan="3" height="5px">&nbsp;</td>
    </tr>
</table>
</body>
</html>