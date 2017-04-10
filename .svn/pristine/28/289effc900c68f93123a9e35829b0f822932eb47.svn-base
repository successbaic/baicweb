<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="DCDY_BGXX" scope="page" class="com.macrosoft.icms.htgl.DCDY_BGXX_SQ"/>
<jsp:useBean id="DCDY_JBXX" scope="page" class="com.macrosoft.icms.htgl.DCDY_JBXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html><head>
<title>变更信息</title></head>
<style type="text/css">
#yxsm2 {
   background-image:url(../images/main/ywbltitleBG.jpg);
   background-repeat:repeat-x;
   font-size:10pt;
   font-family: 锟斤拷锟斤拷;
   color:#000080; 
}
</style>
<script language="javascript">
function blankCheck()
{
	var elements = form1.elements;
	var nLength;
	var eleput;
	nLength=elements.length;	
	for (var j=0; j<nLength; j++)
	{
		if (elements[j].type=="checkbox")
		{	
			if (elements[j].checked)
			{			
				eleput=elements[j+2];
				if (eleput!=null)
				{	
					if(((eleput.type=="text")||(eleput.type=="select-one")||(eleput.type=="textarea"))&&fucCheckLength(eleput.value)<=0)
					{
						eleput.focus();
						alert("请填写"+eleput.title+"!");						
						return false;  
					}
				}
   		
			}
		}
	}
	return(true);
}
</script>
<body>
<%@include file="/top.inc"%>
<%
String OPENO = Page.getOPENO();
String SIGN=Page.getSIGN();
String pageheader=Page.pageheader(request.getRequestURI());
out.println(pageheader);
if(!OPENO.equals("")){
	DCDY_JBXX.setOPENO(OPENO);
	DCDY_BGXX.setOPENO(OPENO);
	DCDY_JBXX.doSelect();
	Page.setREGNO(DCDY_JBXX.getMORREGCNO());
	Page.setENTNAME(DCDY_JBXX.getMORTGAGO());
	Page.setXGBH(DCDY_JBXX.getMORE());
}else{
	String MORTGAGO=Page.getENTNAME();
	String MORREGCNO=Page.getREGNO();
	String REGORUN=Page.getXGBH();
	DCDY_JBXX.doSelectBySql(" SELECT * FROM DCDY_JBXX_SQ WHERE MORREGCNO='"+MORREGCNO+"' AND REGORUN='"+REGORUN+"' AND MORTGAGO='"+MORTGAGO+"'");
}
%>
<form name="form1" method="POST" action="action/dcdy_bgsx_action.jsp" target="editframe">
<br>
<table border="1"width="100%">
<input type="hidden" name = "OPENO" value=<%=OPENO%>>
<input type="hidden" name = "REGORG" value=<%=DCDY_JBXX.getREGORG() %>>
<tr >
    <td width="10%"  class="lc1" align="right">抵押登记证号：</td>
    <td width="25%"  class="lc2"><%=DCDY_JBXX.getMORREGCNO() %></td>
	  <td width="14%"  class="lc1" align="right">登记日期：</td>
    <td width="21%"  class="lc2"><%=DCDY_JBXX.getREGDATE() %></td>
  </tr>
</table>
<table border="1" width="100%" >
<caption>动产抵押登记变更事项</caption>
<input type="hidden" name="ALTTIME">
 <tr class='tc'>
	<td id="yxsm2" colspan="2">项目</td>
	<td id="yxsm2">原登记事项</td>
	<td id="yxsm2">申请变更登记事项</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTCONITEM" value="MAINCONTTYPE" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>主债权的种类</td>
	<td class='lc2'>
	<select size="1" name="ALTBEMAINCONTTYPE"   title="主债权的种类变更前内容"  disabled>
			<option value=''>请选择</option><option value='1'>购销</option><option value='2'>借贷</option><option value='3'>其它</option>
		</select>
	</td>
	<td class='lc2'>
	<select size="1" name="ALTAFMAINCONTTYPE"   title="主债权的种类变更后内容" disabled>
			<option value=''>请选择</option><option value='1'>购销</option><option value='2'>借贷</option><option value='3'>其它</option>
		</select>
	</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTCONITEM" value="MAINCONTAM" type="checkbox" onclick="setvalue(this)" > </td>
	<td class='lc1'>主债权的数额</td>
	<td class='lc2'>
	<input type="text" size="20" name="ALTBEMAINCONTAM" title="主债权的数额变更前内容" maxlength='20' datatype="NUM" disabled> 万元</td>
	<td class='lc2'><input type="text" size="20" name="ALTAFMAINCONTAM" title="主债权的数额变更后内容" maxlength='20' datatype="NUM" disabled> 万元</td>
</tr>
<tr>
	<td class='lc1'><input name="ALTCONITEM" value="PRICRE" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>担保范围</td>
	<td class='lc2'>
	<textarea rows="4" cols="40" name="ALTBEPRICRE" title="担保范围变更前内容" maxlength='500' disabled></textarea></td>
	<td class='lc2'><textarea rows="4" cols="40" name="ALTAFPRICRE" title="担保范围变更后内容" maxlength='500' disabled></textarea></td>
</tr>

<tr>	
	<td class='lc1'><input name="ALTCONITEM" value="PEFPERFROM" type="checkbox" onclick="setvalue(this)"></td>
	<td class="lc1">履行债务起始时间</td>    
	<td class="lc2"><input type="text" size="20" name="ALTBEPEFPERFROM" title="债务人履行债务起始时间变更前内容" maxlength='12' onclick="dropdowndate(this);" datatype=date disabled></td>
  	<td class="lc2"><input type="text" size="20" name="ALTAFPEFPERFROM" title="债务人履行债务起始时间变更后内容" maxlength='12' onclick="dropdowndate(this);" datatype=date disabled></td>
</tr> 
<tr>	
	<td class='lc1'><input name="ALTCONITEM" value="PEFPERTO" type="checkbox" onclick="setvalue(this)"></td>
	<td class="lc1">履行债务结束时间</td>    
	<td class="lc2"><input type="text" size="20" name="ALTBEPEFPERTO" title="债务人履行债务结束时间变更前内容" maxlength='12' onclick="dropdowndate(this);" datatype=date disabled></td>
  	<td class="lc2"><input type="text" size="20" name="ALTAFPEFPERTO" title="债务人履行债务结束时间变更后内容" maxlength='12' onclick="dropdowndate(this);" datatype=date disabled></td>
</tr>

</table>
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
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
<%@include file="/bottom.inc"%>
<script language=javascript>
function setvalue(obj){
	if(obj.checked){
	   eval("document.form1.ALTAF"+obj.value+".disabled=false");
	}else{
	   eval("document.form1.ALTAF"+obj.value+".value=''");
	   eval("document.form1.ALTAF"+obj.value+".disabled=true");
	}
}
</SCRIPT>
</body></html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.setUserFunction("blankCheck()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%><%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	vf.setFormData("ALTBEMAINCONTTYPE",DCDY_JBXX.getMAINCONTTYPE());
	vf.setFormData("ALTBEMAINCONTAM",DCDY_JBXX.getMAINCONTAM());
	vf.setFormData("ALTBEPRICRE",DCDY_JBXX.getPRICRE());
	vf.setFormData("ALTBEPEFPERFROM",DCDY_JBXX.getPEFPERFROM());
	vf.setFormData("ALTBEPEFPERTO",DCDY_JBXX.getPEFPERTO());
	
    //变更前登记事项	
	vf.setData(DCDY_BGXX.getDataList());
	
	out.print(vf.ValueDefaultScript());
%>