<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%@ page errorPage="error.jsp"%>
<%@ page import="com.macrosoft.icms.dbc.DbConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面
DbConnection db=new DbConnection();
ResultSet rs=db.executeQuery("select CDDL,count(*) as cou from QYDJ_YWSB_SQ where loginid='"+webuser.getLOGINID()+"' group by CDDL order by CDDL");
String info="";
int num=0;
while(rs.next()){
String CDDL=rs.getString("CDDL");if(CDDL==null){CDDL="";}
if(CDDL.equals("0")){	
	info+=" "+rs.getInt("cou") +" 项名称登记业务，";	
	num=num+rs.getInt("cou");
}
if(CDDL.equals("1")){	
	info+=" "+rs.getInt("cou") +" 项企业登记业务，";	
	num=num+rs.getInt("cou");
}
if(CDDL.equals("2")){	
	info+=" "+rs.getInt("cou") +" 项个体户登记业务，";	
	num=num+rs.getInt("cou");
}
if(CDDL.equals("3")){	
	info+=" "+rs.getInt("cou") +" 项合作社登记业务，";	
	num=num+rs.getInt("cou");
}
if(CDDL.equals("4")){	
	info+=" "+rs.getInt("cou") +" 项股权出质登记业务，";	
	num=num+rs.getInt("cou");
}
if(CDDL.equals("5")){	
	info+=" "+rs.getInt("cou") +" 项户外广告登记业务，";	
	num=num+rs.getInt("cou");
}
if(CDDL.equals("6")){	
	info+=" "+rs.getInt("cou") +" 项动产抵押登记业务，";	
	num=num+rs.getInt("cou");
}
}

String table_value="<table width='96%' style='line-height:30px;' height='175px' id='wxts_table'>"
  +"<tr><td height='20px'>&nbsp;</td></tr><tr><td>&nbsp;&nbsp;"
  +"<font color='#AA0219' style='font-size:16px'>您当前已办理："+info+" 您可以点击<strong>"
  +"<span style='color:red;cursor:pointer' onclick='doThis()'> 这里 </span></strong>查看已办业务信息。</font></td></tr><tr><td>&nbsp;</td></tr></table>";
%>
<html>
<head>
<title><%=PropertiesConfigUtil.getValue("deployregorg")%>网上服务平台</title>
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:440px;
	height:450px;
	z-index:1;
	left: 537px;
	top: 86px;
}
#Layer2 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:2;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
area{
	cursor:hand;
}
-->
</style>
<SCRIPT language="javascript">
function doSub(url,cddl,ifba){
	document.form1.CDDL.value=cddl;
	document.form1.IFBA.value=ifba;
	document.form1.action=url;
	document.form1.submit();
}
function doLogout(){
	if (window.confirm("确定退出企业网上工商系统吗?"))
	{
		window.location.href="logout.jsp";
	}
}
function doThis(){
	document.form1.CDDL.value="YBXX";
	document.form1.IFBA.value="";
	document.form1.action="content.jsp";
	document.form1.submit();
}
//定义“获得指定dom节点”的函数，因为其重用率高
function $(d){return document.getElementById(d);}
var v;
//控制div逐渐显示
var i = 0;
function change_show(){
   var obj = $("wxts_div");
   i=i+5; //逐渐显示速度
   obj.style.filter = "Alpha(Opacity=" + i + ")"; //透明度逐渐变小
   obj.style.opacity = i/100; //兼容FireFox
   obj.style.height = i*1.5 + "px"; //高度逐渐变大
   if(i>=100){
    clearInterval(s);
    i=0;
    $("wxts_div").innerHTML=v;
   }
}
//控制change_show()行为
var s;
function show(x,a){
   v=a;
   if(s){clearInterval(s);}
   $(x).innerHTML="";
   //$(x).style.filter = "Alpha(Opacity=0)";
   //$(x).style.display="block";
   s = setInterval(change_show,40);
}
function body_load(){
	var num=<%=num%>;
	if(num>0){
		show("wxts_div","<%=table_value%>");
	}
}
</SCRIPT>
</head>

<body onLoad="body_load()">
<table height="100%" align="center"><tr><td align="center" valign="middle">
<table align="center" cellpadding="0" cellspacing="0">
<tr>
<td valign="middle" align="center">
  <div style="position:relative">
  <img src="images/welcome/first0.jpg" border="0" usemap="#Map">
  <div style="position:absolute;filter:Alpha(Opacity=0) ;z-index:10;left: 30px;top: 2px;width:440px;height:175px;background-image:url(images/welcome/warmPrompt.png);background-repeat:no-repeat;" id="wxts_div"></div>
  </div>
</td>
</tr>
</table>

<map name="Map">
      <area shape="rect" coords="765,14,826,80" href="#" onClick="window.open('digital/degital_list.jsp?opt=sq','displayWindow','top=120,left=150,toolbar=yes,width=880,height=480,directories=yes,status=yes,scrollbars=yes,resizable =yes,menubar=yes')" onFocus="this.blur()">
      <area shape="rect" coords="829,14,889,80" href="#" onClick="window.open('digital/degital_list.jsp?opt=sp','help','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');" onFocus="this.blur()">
      <area shape="rect" coords="892,14,948,80" href="#" onClick="window.open('djbg/djbg.jsp')" onFocus="this.blur()">
      <area shape="rect" coords="719,102,849,140" href="#" onClick="doSub('main.jsp','0','Y')" onFocus="this.blur()" title="点击后办理名称登记业务">
      <area shape="rect" coords="741,158,875,196" href="#" onClick="doSub('welcSecond.jsp','1','Y')" onFocus="this.blur()" title="点击后办理企业户登记业务">
      <area shape="rect" coords="745,213,924,252" href="#" onClick="doSub('welcSecond.jsp','2','N')" onFocus="this.blur()" title="点击后办理个体登记业务">
	   <area shape="rect" coords="740,268,934,307" href="#" onClick="doSub('welcSecond.jsp','3','N')" onFocus="this.blur()" title="点击后办理农民合作社登记">
	   <area shape="rect" coords="708,324,895,360" href="#" onClick="doSub('welcSecond.jsp','4','N')" onFocus="this.blur()" title="股权出质登记">
      <area shape="rect" coords="661,379,824,417" href="#" onClick="doSub('welcSecond.jsp','5','N')" onFocus="this.blur()" title="户外广告登记">
      <area shape="rect" coords="604,434,809,472" href="#" onClick="doSub('welcSecond.jsp','6','N')" onFocus="this.blur()" title="动产抵押登记">
      <area shape="rect" coords="523,490,687,528" href="#" onClick="window.location.href='content.jsp'" onFocus="this.blur()" title="点击后进入办理进度查询">
      <area shape="rect" coords="827,522,882,583" onClick="javascript:alert('当前已是首页!')" onFocus="this.blur()">
      <area shape="rect" coords="887,522,943,583" href="#" onClick="doLogout()" onFocus="this.blur()">
     
      
    </map>
<form name="form1" method="post">
<input type="hidden" name="CDDL">
<input type="hidden" name="IFBA">
<input type="hidden" name="CJLX" value="0">
<input type="hidden" name="SIGN" value="0">
<input type="hidden" name="STEP" value="0">
<input type="hidden" name="OPENO" value="">
</form></td></tr></table>
</body>
</html>
<%
rs.close();
db.close();
%>