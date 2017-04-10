<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="../jspheader.inc"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<title>名称预核申请相关说明</title>
<style type="text/css">
		.yxsm {
		   background-image:url(images/main/ywbltitleBG.jpg);
		   background-repeat:repeat-x;
		}
</style>

</head>
<body bgcolor="#eefbf7" style="margin-top: 0; margin-bottom: 0">
<%@include file="../top.inc"%>

<%
StepShow stepShow= new StepShow();
%>
<%=stepShow.getStep("1",Page.getDL()+Page.getOPETYPE(),Page.getOPENO())%>
<table width="100%" align="center" border="1">
	<tr >
		<td colspan="5" class="yxsm" align="center" style="font-size:14pt;text-align: center;background-image: url('../images/main/ywbltitleBG.jpg');">
				名称预核申请相关说明
		</td>
	</tr>
<tr>
<td class="lc2" style="font-family: 宋体;font-size:10pt;">
1、企业名称不得含有下列内容的文字： <br/>
&nbsp;&nbsp;&nbsp;&nbsp;（1）有损于国家、社会公共利益的； <br/>
&nbsp;&nbsp;&nbsp;&nbsp;（2）可能对公众造成欺骗或者误解的； <br/>
&nbsp;&nbsp;&nbsp;&nbsp;（3）外国国家(地区)名称、国际组织名称； <br/>
&nbsp;&nbsp;&nbsp;&nbsp;（4）政党名称、党政军机关名称、群众组织名称、社会团体名称及部队番号； <br/>
&nbsp;&nbsp;&nbsp;&nbsp;（5）外国文字、汉语拼音字母、阿拉伯数字； <br/>
&nbsp;&nbsp;&nbsp;&nbsp;（6）其他法律、行政法规规定禁止的。 <br/>
2、依旧《企业名称登记管理规定》，企业名称应由行政区划+字号+行业或经营特点+组织形式，四部分组成。
企业名称应当使用符合国家规范的汉字,输入的字符必须为<b>半角</b>。  <br/>
3、企业名称中不得含有另一个企业名称。<b>企业分支机构名称应当冠以其所从属企业的名称。</b> <br/>
<!--  4、<b>企业名称应当由行政区划、字号、行业、组织形式依次组成</b>。例如：山东浪潮科技有限公司。其中“山东”是行政区划，“浪潮”是字号，“科技”是行业（经营特点），“有限公司”为组织形式。<br/>-->
4、
<%
if(webuser.getXZQH().equals("3700")){
%>
本系统目前只支持登记机关是山东省工商局的名称业务，登记机关是山东省各地市工商局的，请到当地网站或大厅办理。
<%
}else{
%>
目前，网上登记<font color="red">暂不支持冠省名的名称申请登记</font>，如需办理冠省名的名称登记业务，请到工商局大厅现场办理,或登录省局网上登记系统办理。冠市名及区县名，请参考当地相关规定。
<%}%>
<br/>
5、<font color="red">企业名称有下列情形之一的，不予核准：</font> <br/>
&nbsp;&nbsp;&nbsp;&nbsp;（1) 与同一工商行政管理机关核准或者登记注册的同行业企业名称字号相同（有投资关系的除外）； <br/>
&nbsp;&nbsp;&nbsp;&nbsp;（2）与其他企业变更名称未满1年的原名称相同； <br/>
&nbsp;&nbsp;&nbsp;&nbsp;（3）与注销登记未满1年或者被吊销营业执照未满3年的企业名称相同； <br/>
&nbsp;&nbsp;&nbsp;&nbsp;（4）其他违反法律、行政法规的； <br/>
6、<font color="red"><b>网上申请的企业名称自核准通过之日起<%=icms.getSysRemark("WSDJ_CFG", "MCBLQ") %>个工作日内
。请指定代表或委托代理人在上述期限工作日内，到工商局大厅现场提交纸质申请材料，
办理企业名称预先核准业务，领取《企业名称预先核准通知书》。</b></font><br/>
</td>
</tr>
</table>
<br/>
<CENTER>
<%
String url="mcgl_mccc.jsp";
if(webuser.getXZQH().startsWith("22")){
	//url="jlmcgl_mccc.jsp";
}
%>
<div class="subImgs" onclick="window.location.href='<%=url %>'">我了解</div>
</CENTER>
<%@include file="../bottom.inc"%>
</body>
</html>