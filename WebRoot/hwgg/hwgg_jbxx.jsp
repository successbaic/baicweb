<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="HWGG_JBXX" scope="page"  class="com.macrosoft.icms.gggl.HWGG_JBXX_SQ"/>
<html>
<head>
<title>基本情况</title>
<script language='javascript'>
</script>
</head>
<body>
<%@include file="/top.inc"%>
<%
String pageheader=Page.pageheader(request.getRequestURI());
out.println(pageheader);

String SIGN = Page.getSIGN();	//-1数据未保存,1已开业
String OPENO =Page.getOPENO();
String OPETYPE =Page.getOPETYPE();

%>
<br/>
<form name="form1" action="action/hwgg_jbxx_action.jsp" method="post" target="editframe">
<input type="hidden" name="STATUS" >
<input type="hidden" name="APPDATE" value="<%=webuser.getCurrentDate()%>">
<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>">
<input type="hidden" name="OPETYPE" value=<%=OPETYPE%>>
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="ADREGCNO">
<table border="1" cellpadding="0" cellspacing="0" width="100%">
<caption align="left" >户外广告基本信息</caption>
  <tr>
    <td  class="lc1">广告名称</td>
    <td  class="lc2"    >
    <input type="text" name="ADNAME" title="广告名称" size="40" maxlength=50 disblank ><font color="red"> *</font></td>
    
    <td   class="lc1"align="right"  >广告规格</td>
    <td  class="lc2" >
    <input type="text" name="ADSPF" title="广告规格" size="20" maxlength=50 disblank><font color="red"> *</font></td>
  </tr>
  <tr>
   <td  class="lc1">发布地点</td>
   <td  class="lc2" >
   <input type="text" name="ADISSSPOT" size="40" title="广告发布地点" disblank  maxlength=50><font color="red"> *</font></td>
     <td class="lc1" >发布期限自</td>
    <td class="lc2">
    <INPUT TYPE="text" NAME="ADISSFROM" size=12 disblank  onClick="dropdowndate(this)"  datatype="DATE" title="发布期限自"><font color="red"> *</font> 
    至 <INPUT TYPE="text" NAME="ADISSTO"  size=12 disblank  onClick="dropdowndate(this)"  datatype="DATE" title="发布期限至"><font color="red"> *</font></td>
  </tr>
  
  <tr >
  <td  class="lc1"   >广告形式</td>
    <td  class="lc2">
	<select name="ADFORM" title="广告发布形式" disblank>
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
	</select><font color="red"> *</font>
	</td>
	<td class="lc1" >类别</td>
    <td class="lc2">
    <select name="ADCLASS" title="广告类别" disblank>
	<OPTION value=""></OPTION>
	<OPTION value="01">广告主自设  </OPTION>
	<OPTION value="02">经营性户外广告 </OPTION>	
	</select><font color="red"> *</font>
    </td>
  </tr>
 
   <%--tr>
   <td  class="lc1">广告内容</td>
   <td  class="lc2" colspan="5">
   <textarea rows="2" name="ADCONTENT" cols="60" title="广告内容"  maxlength=500></textarea></td>
  </tr--%>

 <tr>
 
 <td  class="lc1">广告数量</td>
    <td  class="lc2" >
    <input type="text" name="ADQUAN" size="5" title="广告数量" maxlength=8 disblank  datatype="NUM"><font color="red"> *</font></td>
    
  <td class="lc1" align="right">登记机关</td>
    <td class="lc2">
	<select size="1" name="REGORG" style='width:220' title="登记机关" disblank>
	<option value=''></option> 
	<%
		  out.print(icms.getSysDmList("REGORG"));
	%>
		</select><font color="red"> *</font></td>
</tr>		
 <tr>
   <td  class="lc1">申请材料目录</td>
   <td  class="lc2"  colspan="3">
   <textarea rows="3" name="ADSTUFF" cols="60"title="申请材料目录" maxlength=200 disblank></textarea><font color="red"> *</font>
   </td>
   </tr>
</table>
<br>
<center>
<%if(SIGN.equals("0")){%>
 	<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">下一步</div>
<%}else{
%>
	 <div class="subImgs" onclick="window.location.href='hwgg_ggfbz.jsp'">下一步</div>
<%
}%>
</center>  
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
<%@include file="/bottom.inc"%>
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
	if ("".equals(OPENO)||OPENO==null||"null".equals(OPENO)){

	}else{
		HWGG_JBXX.setOPENO(OPENO);
	   vf.setData(HWGG_JBXX.getData());
	}
	out.print(vf.ValueDefaultScript());
%>