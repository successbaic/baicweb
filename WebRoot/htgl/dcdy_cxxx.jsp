<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="DCDY_CXXX" scope="page" class="com.macrosoft.icms.htgl.DCDY_CXXX_SQ"/>
<jsp:useBean id="DCDY_JBXX" scope="page" class="com.macrosoft.icms.htgl.DCDY_JBXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>

<html><head>
<title>撤销信息</title>
</head>
<body>
<%@include file="/top.inc"%>
<%
String OPENO = Page.getOPENO();
String SIGN=Page.getSIGN();
String pageheader=Page.pageheader(request.getRequestURI());
out.println(pageheader);
if(!OPENO.equals("")){
	DCDY_JBXX.setOPENO(OPENO);
	DCDY_CXXX.setOPENO(OPENO);
	DCDY_JBXX.doSelect();
	Page.setREGNO(DCDY_JBXX.getMORREGCNO());
	Page.setENTNAME(DCDY_JBXX.getMORTGAGO());
	Page.setXGBH(DCDY_JBXX.getMORE());
}
	String MORTGAGO=Page.getENTNAME();
	String MORREGCNO=Page.getREGNO();
	String REGORUN=Page.getXGBH();
	DCDY_JBXX.doSelectBySql(" SELECT * FROM DCDY_JBXX_SQ WHERE MORREGCNO='"+MORREGCNO+"' AND REGORUN='"+REGORUN+"' AND MORTGAGO='"+MORTGAGO+"'");


%>
<form name="form1" method="POST" action="action/dcdy_cxxx_action.jsp" target="editframe">
<input type="hidden" name = "OPENO" value="<%=OPENO%>">
<input type="hidden" name = "REGORG" value=<%=DCDY_JBXX.getREGORG() %>>
<input type="hidden" name = "OPETYPE" value="81">
<input type="hidden" name = "SIGN" value="<%=SIGN%>">
<input type="hidden" name="MORCONTNO" value=<%=MORREGCNO%>>
<br/>
<table border="1"width="100%">
<tr >
    <td width="10%"  class="lc1" align="right">抵押登记证号：</td>
    <td width="25%"  class="lc2"><%=DCDY_JBXX.getMORREGCNO() %></td>
	  <td width="14%"  class="lc1" align="right">登记日期：</td>
    <td width="21%"  class="lc2"><%=DCDY_JBXX.getREGDATE() %></td>
  </tr>
</table>
<br/>
<table width="100%" border=1  >
  <caption align="center">
	<p align="left">动产抵押撤销信息</p>
  </caption> 	
<tr>
    <td class="lc1" >撤销原因</td>
   <!-- <td class="lc2" width="38%">
        <select size="1" name="MORCANREA" style="width:200" title='撤销原因' disblank>
	      <option value=''>请选择</option>
	      <option value='1'>当事人提前解除抵押合同</option>
	      <option value='2'>合同履行完毕</option>
	      <option value='3'>抵押物灭失</option>
	      <option value='4'>提交虚假证明文件或其他手段骗取抵押物登记</option>
       </select> -->

    <td class="lc2" colspan="3" >
	<textarea rows="4" name="MORCANREA" cols="80"></textarea>
    </td>
</tr>    
<tr>
    <td class="lc1" width="11%">撤销日期</td>
    <td class="lc2" width="38%" >
       <input type="text" name="CANDATE" size="15" title="撤销日期" datatype=date disblank onclick="dropdowndate(this)">
    </td>
</tr>
<tr>
    <td class="lc1" >备注</td>
    <td class="lc2" colspan="3" >
	<textarea rows="4" name="REMARK" cols="80"></textarea></td></tr>
    </table>
<br>
<center>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">下一页</div>
<%
}
%>
</center>
</form>
<IFRAME height="0" width="100" name="editframe"  id="editframe"></IFRAME>
</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	DCDY_CXXX.setOPENO(OPENO);
	vf.setData(DCDY_CXXX.getData());
	out.print(vf.ValueDefaultScript());
%>