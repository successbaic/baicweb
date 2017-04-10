<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="HWGG_BGXX" scope="page" class="com.macrosoft.icms.gggl.HWGG_BGXX_SQ"/>
<jsp:useBean id="HD0403" scope="page" class="com.macrosoft.icms.gsnw.HD0403"/>
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
<body><%@include file="/top.inc"%>
<%
String pageheader=Page.pageheader(request.getRequestURI());
out.println(pageheader);

String SIGN = Page.getSIGN();	//-1数据未保存,1已开业
String OPENO =Page.getOPENO();
String PRIPID =Page.getPRIPID();
String OPETYPE =Page.getOPETYPE();
//HD0403.doSelectBySql("SELECT * FROM HD0403 WHERE HD04035='"
//	+Page.getENTNAME()+"' and HD04023='"+Page.getREGNO()+"'");
//if(HD0403.getHD04035().equals("")){
	HD0403.doSelectBySql("SELECT * FROM HD0403 WHERE HD04001='"
	+PRIPID+"'");	
//}	
%>
<form name="form1" method="POST" action="action/hwgg_bgsx_action.jsp" target="editframe">
<table border="1"width="100%">
<input type="hidden" name = "OPENO" value=<%=OPENO%>>
<input type="hidden" name = "PRIPID" value=<%=HD0403.getHD04001() %>>
<input type="hidden" name = "REGORG" value=<%=HD0403.getHD04002() %>>
<input type="hidden" name = "ADREGCNO" value=<%=HD0403.getHD04023() %>>
<tr >
    <td width="10%"  class="lc1" align="right">广告登记证号：</td>
    <td width="25%"  class="lc2"><%=HD0403.getHD04035() %></td>
	  <td width="14%"  class="lc1" align="right">广告名称：</td>
    <td width="21%"  class="lc2"><%=HD0403.getHD04023()%></td>
  </tr>
</table>
<table border="1" width="100%" >
<caption>户外广告登记变更事项</caption>
<input type="hidden" name="ALTTIME">
 <tr class='tc'>
	<td class="yxsm" colspan="2">项目</td>
	<td class="yxsm">原登记事项</td>
	<td class="yxsm">申请变更登记事项</td>
</tr>
<tr>
	<td class='lc1'><input name="ADALTITEM" value="HD04035" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>广告名称</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE_HD04035" title="广告名称变更前内容" maxlength='50' disabled></td>
	<td class='lc2'><input type="text" size="45" name="ALTAF_HD04035"  title="广告名称变更后内容" maxlength='50'></td>
</tr>
<%--tr>
	<td class='lc1'><input name="ADALTITEM" value="03" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>广告发布地点</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE03" title="广告发布地点变更前内容" maxlength='50' disabled></td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF03" title="广告发布地点变更后内容" maxlength='50'></td>
</tr--%>

<tr>
	<td class='lc1'><input name="ADALTITEM" value="HD04011" type="checkbox" onclick="setvalue(this)"></td>
	<td class='lc1'>广告规格</td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTBE_HD04011" title="广告规格变更前内容" maxlength='50' disabled></td>
	<td class='lc2'>
	<input type="text" size="45" name="ALTAF_HD04011" title="广告规格变更后内容" maxlength='50'></td>
</tr>
<tr>	
	<td class='lc1'><input name="ADALTITEM" value="HD04025" type="checkbox" onclick="setvalue(this)"></td>
	<td class="lc1">广告数量</td>    
	<td class="lc2"><input type="text" size="20" name="ALTBE_HD04025" title="广告数量变更前内容" maxlength='8' datatype="NUM" disabled></td>
  	<td class="lc2"><input type="text" size="20" name="ALTAF_HD04025" title="广告数量变更后内容" maxlength='8' datatype="NUM" ></td>
</tr> 
<tr>
	<td class='lc1'><input name="ADALTITEM" value="HD04027" type="checkbox" onclick="setvalue(this)" ></td>
	<td class='lc1'>广告发布形式</td>
	<td class='lc2'>
	<select name="ALTBE_HD04027" title="广告发布形式变更前内容" disabled>
	<OPTION value=""></OPTION>
	<OPTION value="01">展示牌</OPTION>
	<OPTION value="02">电子显示装置</OPTION>
	<OPTION value="03">灯箱</OPTION>
	<OPTION value="04">霓虹灯</OPTION>
	<OPTION value="05">交通工具</OPTION>
	<OPTION value="06">水上漂浮物</OPTION>
	<OPTION value="07">升空器具</OPTION>
	<OPTION value="08">充气物</OPTION>
	<OPTION value="09">模型</OPTION>
	<OPTION value="10">墙体广告</OPTION>
	<OPTION value="11">条幅</OPTION>
	<OPTION value="99">其它</OPTION>
	</select>
	</td>
	<td class='lc2'>
	<select name="ALTAF_HD04027" title="广告发布形式变更后内容">
	<OPTION value=""></OPTION>
	<OPTION value="01">展示牌</OPTION>
	<OPTION value="02">电子显示装置</OPTION>
	<OPTION value="03">灯箱</OPTION>
	<OPTION value="04">霓虹灯</OPTION>
	<OPTION value="05">交通工具</OPTION>
	<OPTION value="06">水上漂浮物</OPTION>
	<OPTION value="07">升空器具</OPTION>
	<OPTION value="08">充气物</OPTION>
	<OPTION value="09">模型</OPTION>
	<OPTION value="10">墙体广告</OPTION>
	<OPTION value="11">条幅</OPTION>
	<OPTION value="99">其它</OPTION>
	</select>
	</td>
</tr>
<tr>	
	<td class='lc1'><input name="ADALTITEM" value="HD04014" type="checkbox" onclick="setvalue(this)"></td>
	<td class="lc1">广告发布起始日期</td>    
	<td class="lc2"><input type="text" size="20" name="ALTBE_HD04014" title="广告发布起始日期变更前内容" maxlength='12' datatype=date disabled>(截至日期)</td>
  	<td class="lc2"><input type="text" size="20" name="ALTAF_HD04014" title="广告发布起始日期变更后内容" maxlength='12' onclick="dropdowndate(this);" datatype=date >(截至日期)</td>
</tr>
<tr>	
	<td class='lc1'><input name="ADALTITEM" value="HD04034" type="checkbox" onclick="setvalue(this)"></td>
	<td class="lc1">广告发布结束日期</td>    
	<td class="lc2"><input type="text" size="20" name="ALTBE_HD04034" title="广告发布结束日期变更前内容" maxlength='12' datatype=date disabled>(截至日期)</td>
  	<td class="lc2"><input type="text" size="20" name="ALTAF_HD04034" title="广告发布结束日期变更后内容" maxlength='12' onclick="dropdowndate(this);" datatype=date >(截至日期)</td>
</tr>
</table>
<CENTER>
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
</CENTER>
</form>
<IFRAME height="0" width="0" name="editframe"  id="editframe"></IFRAME>
<%@include file="/bottom.inc"%>
<script language=javascript>
function setvalue(obj)
{
	if (obj.checked)
	{		
		//eval("document.form1.ALTAF"+obj.value+".disabled=false");
 	}
	else
	{
		eval("document.form1.ALTAF"+obj.value+".value=''");
		eval("document.form1.REMARK"+obj.value+".value=''");
		//eval("document.form1.ALTAF"+obj.value+".disabled=true");
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
    //变更前登记事项
	vf.setFormData("ALTBE_HD04035",HD0403.getHD04035());//广告名称变更前内容
	vf.setFormData("ALTBE_HD04027",HD0403.getHD04027());//广告发布发布形式
	vf.setFormData("ALTBE_HD04011",HD0403.getHD04011());//广告规格变更前内容
	vf.setFormData("ALTBE_HD04025",HD0403.getHD04025());//广告数量变更前内容
	vf.setFormData("ALTBE_HD04014",HD0403.getHD04014());//
	vf.setFormData("ALTBE_HD04034",HD0403.getHD04034());//

	HWGG_BGXX.setOPENO(OPENO);
	vf.setData(HWGG_BGXX.getDataList()); 

	out.print(vf.ValueDefaultScript());
%>