<%-- <%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id='MCGL_JBXX' scope='page' class='com.macrosoft.icms.gsnw.MCGL_JBXX_ZS'/>
<jsp:useBean id='MCGL_ZHJY' scope='page' class='com.macrosoft.icms.nw.MCGL_ZHJY'/>
<%
	String ENTTRA = SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("ENTTRA")));
	String TRADPINY = SysUtility.convertCode(SysUtility.doPreProcess(request.getParameter("TRADPINY")));
%>
<script language="javascript">
function getpy()
{
	document.frames["hiddenframe"].location="mc_gethypy.jsp?ENTTRA="+document.form1.ENTTRA.value;
}
</script>
<style type="text/css">
#nomenu {
   background-image:url(../images/main/currpostitleBG.jpg);
   background-repeat:repeat-x;
}
#yxsm {
   background-image:url(../images/main/ywbltitleBG.jpg);
   background-repeat:repeat-x;
   font-size:11pt;
   font-family: 锟斤拷锟斤拷;
   color:#000080; 
   font-weight: bold;
}
#Layer0 {
    position:absolute;   
	left:0px;
	top:0px;
}
#Layer1 {
	position:absolute;
	z-index:1;
	left:20px;
	top:35px;
}
</style>
<html>
<head>
<title>名称查询</title>
</head>
<BODY>
<div id="Layer0">
<table id="nomenu" width="100%" align="center" border="0" cellspacing= "0" cellpadding= "0">
	<tr>
		<td>&nbsp;</td>
		<td><img src="../images/main/nowlocation.png"/>&nbsp;&nbsp;<font color="#1E90FF">当 前 位 置 : 其 他 功 能 > </font><font color="#8c0044"> 名 称 预 查 重</font> </td>
		<td align="right"><img src="../images/main/nowuser.png"/>&nbsp;&nbsp;<font color="#1E90FF">当前用户 :<%=webuser.getUSERNAME()%></font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>
</div>
<div style="margin-top: 35px;margin-left: 20px;z-index: 1">	
<FORM NAME="form1" METHOD="post" ACTION="mc_cx_list.jsp" >
<input type="hidden" name="mode" value="query">
<table border="1" width="95%" cellspacing='0' cellpadding='0'>
  <tr>
        <td id="yxsm" colspan="6">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>名称预查重</font>
        </p>
        </td>
      </tr>
 <tr>
    <td class="lc1" >字号</td>
    <td class="lc2" >
      <INPUT TYPE="text" NAME="ENTTRA" size="18" onchange="getpy()" title='字号'>
      <font color="red">例如：东方 </font></td>
    <td class="lc1">字号拼音</td>
    <td class="lc2" > <INPUT TYPE="text" NAME="TRADPINY" size="40" disblank title='字号拼音'>
    <font color="red">例如：dong fang </font></td>
    <td class="lc1" >
      <INPUT TYPE="submit" name="QBTN" value="查  询" class="inp_L1" onmouseover="this.className='inp_L2'" onmouseout="this.className='inp_L1'">
      &nbsp;&nbsp;
      <input type="reset" value="重  置" class="inp_L1" onmouseover="this.className='inp_L2'" onmouseout="this.className='inp_L1'">
	</td>
  </tr>  
</table>
</FORM>
<%
if (request.getParameter("mode")!=null)
{
webuser.setQueryString(request);
%>
<table border="1" cellpadding="0" cellspacing="0" width="95%" >
	 <caption>近似的名称</caption>
	<tr class='tc'>   
	<td align="center">字  号</td>
    <td align="center">字号拼音</td>
    <td align="center">名  称</td>
	<td align="center">名称状态</td>
	</tr>
	<%  
		String whSql=" WHERE TRADPINY = '" + TRADPINY + "' OR ENTTRA = '"+ENTTRA+"'";
		ArrayList list=MCGL_JBXX.getList(whSql,request.getParameter("start"));
		for(int i=0;i<list.size();i++){
			com.macrosoft.icms.nw.MCGL_JBXX jbxx=(com.macrosoft.icms.nw.MCGL_JBXX) list.get(i);
	%>
	<tr class='lc1'>			
	<td><%=jbxx.getENTTRA()%></td>
	<td><%=jbxx.getTRADPINY()%></td>
	<td><%=jbxx.getENTNAME()%></td>	
	<td><%=icms.getSysDm("NAMEFLAG",String.valueOf(jbxx.getFLAG()))%></td>
	</tr>
	<%
		}
	%>
</table>
<br>
<table border="1" cellpadding="0" cellspacing="0" width="95%" >
<caption>禁用的名称文字</caption>
<tr>
	<td class=tc>禁用文字</td>
	<td class=tc>禁用文字拼音</td>
	<td class=tc>说  明</td>
</tr>
<%	
	whSql=" WHERE BANLETTPINY LIKE '%"+TRADPINY+"%' OR BANLETTER LIKE '%"+ENTTRA+"%'";
	list=MCGL_ZHJY.getList(whSql,request.getParameter("start"));
	for(int i=0;i<list.size();i++){
		com.macrosoft.icms.nw.MCGL_ZHJY zhjy=(com.macrosoft.icms.nw.MCGL_ZHJY) list.get(i);
%>
	<tr class='lc1'>
	<td><%=zhjy.getBANLETTER()%></td>
	<td><%=zhjy.getBANLETTPINY()%></td>
	<td><%=zhjy.getBANEXP()%></td>			
	</tr>
<%	
	}
%> 
</table>
<%}%>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="95%" >
<caption>企业名称查重说明：</caption>

<tr><td class=lc2 align="left">
1、该功能提供网上用户进行企业名称的预先查重，能够帮助用户在申请企业名称时降低重复的可能性。<br>
2、由于该功能面向Internet，数据的准确性与实际情况会有一定的周期性偏差，该查重结果仅供参考，以注册大厅的查询结果为准。<br>
3、正确查询方法：<br>
例如拟申请的企业名称为 济南东方贸易有限公司，用户须在字号的栏目中输入：东方，系统会自动生成字号拼音：dong fang ，然后进行查询。
</td></tr>
</table>
</div>
<IFRAME HEIGHT="0" WIDTH="0" SRC="" NAME="hiddenframe" id="hiddenframe"></IFRAME>
</body>
</html>
<%/// init
	com.macrosoft.icms.system.ValueDefault vf=new com.macrosoft.icms.system.ValueDefault();
	vf.setFormName("form1");
	vf.setData(request);
	out.print(vf.ValueDefaultScript());
	
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%> --%>