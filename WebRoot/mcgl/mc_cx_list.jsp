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
   font-family: ����;
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
<title>���Ʋ�ѯ</title>
</head>
<BODY>
<div id="Layer0">
<table id="nomenu" width="100%" align="center" border="0" cellspacing= "0" cellpadding= "0">
	<tr>
		<td>&nbsp;</td>
		<td><img src="../images/main/nowlocation.png"/>&nbsp;&nbsp;<font color="#1E90FF">�� ǰ λ �� : �� �� �� �� > </font><font color="#8c0044"> �� �� Ԥ �� ��</font> </td>
		<td align="right"><img src="../images/main/nowuser.png"/>&nbsp;&nbsp;<font color="#1E90FF">��ǰ�û� :<%=webuser.getUSERNAME()%></font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>
</div>
<div style="margin-top: 35px;margin-left: 20px;z-index: 1">	
<FORM NAME="form1" METHOD="post" ACTION="mc_cx_list.jsp" >
<input type="hidden" name="mode" value="query">
<table border="1" width="95%" cellspacing='0' cellpadding='0'>
  <tr>
        <td id="yxsm" colspan="6">
        <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080>����Ԥ����</font>
        </p>
        </td>
      </tr>
 <tr>
    <td class="lc1" >�ֺ�</td>
    <td class="lc2" >
      <INPUT TYPE="text" NAME="ENTTRA" size="18" onchange="getpy()" title='�ֺ�'>
      <font color="red">���磺���� </font></td>
    <td class="lc1">�ֺ�ƴ��</td>
    <td class="lc2" > <INPUT TYPE="text" NAME="TRADPINY" size="40" disblank title='�ֺ�ƴ��'>
    <font color="red">���磺dong fang </font></td>
    <td class="lc1" >
      <INPUT TYPE="submit" name="QBTN" value="��  ѯ" class="inp_L1" onmouseover="this.className='inp_L2'" onmouseout="this.className='inp_L1'">
      &nbsp;&nbsp;
      <input type="reset" value="��  ��" class="inp_L1" onmouseover="this.className='inp_L2'" onmouseout="this.className='inp_L1'">
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
	 <caption>���Ƶ�����</caption>
	<tr class='tc'>   
	<td align="center">��  ��</td>
    <td align="center">�ֺ�ƴ��</td>
    <td align="center">��  ��</td>
	<td align="center">����״̬</td>
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
<caption>���õ���������</caption>
<tr>
	<td class=tc>��������</td>
	<td class=tc>��������ƴ��</td>
	<td class=tc>˵  ��</td>
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
<caption>��ҵ���Ʋ���˵����</caption>

<tr><td class=lc2 align="left">
1���ù����ṩ�����û�������ҵ���Ƶ�Ԥ�Ȳ��أ��ܹ������û���������ҵ����ʱ�����ظ��Ŀ����ԡ�<br>
2�����ڸù�������Internet�����ݵ�׼ȷ����ʵ���������һ����������ƫ��ò��ؽ�������ο�����ע������Ĳ�ѯ���Ϊ׼��<br>
3����ȷ��ѯ������<br>
�������������ҵ����Ϊ ���϶���ó�����޹�˾���û������ֺŵ���Ŀ�����룺������ϵͳ���Զ������ֺ�ƴ����dong fang ��Ȼ����в�ѯ��
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