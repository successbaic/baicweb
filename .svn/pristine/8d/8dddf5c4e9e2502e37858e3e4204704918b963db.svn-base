<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="GGGL_JYDW_GLZD" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_GLZD"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<html>
<head>
<title>基本管理制度建立和执行情况</title>
<style type="text/css">
#yxsm {
   background-image:url(../images/main/ywbltitleBG.jpg);
   background-repeat:repeat-x;
}
</style>
</head> 
<%
  	String ADBULICNO=Page.getpageKey();
	int INSYEAR=Page.getipageKey();
	String SIGN=Page.getpageKey1();
	GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();

	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
		
 %>
<body>
<form name="form1" method="POST" action='ggxkz_glzd_action.jsp' target="editframe">
<input type="hidden" name="ADBULICNO" value=<%=ADBULICNO%>>
<input type="hidden" name="INSYEAR" value=<%=INSYEAR%>>
<br>
<table border="1" width="100%" cellpadding="0" cellspacing="0">
<CAPTION>基本管理制度建立和执行情况</CAPTION>
   <tr>
	<td class="lc1" nowrap="nowrap" width="30%">是否建立了广告承接登记制度</td>   
	<td class="lc2" align="center" width="20%">
	&nbsp;&nbsp;是<input type="radio" name="ADREGSYS" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ADREGSYS" value="2"/>
	</td> 
	
	<td class="lc1" width="30%">是否建立了广告档案管理制度</td>   
	<td class="lc2" align="center" width="20%">
	&nbsp;&nbsp;是<input type="radio" name="ADARCHMAG" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ADARCHMAG" value="2"/>
	</td> 
	</tr>
   <tr> 
    <td class="lc1" >是否建立了广告合同管理制度</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ADCONTMAG" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ADCONTMAG" value="2"/>
	</td>
	    
	<td class="lc1" >是否建立了广告审查制度，设计、制作、代理、发布的<br>广告是否经广告审查员审查，并签署意见</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ADEXAMSYS" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ADEXAMSYS" value="2"/>
	</td> 	
   </tr>
   <tr> 
    <td class="lc1" >广告收费标准是否及时向备案管理机关备案</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISBA" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISBA" value="2"/>
	</td>
	    
	<td class="lc1" >使用广告业务专用发票、广告业务财务往来是否单独立帐</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISSEPACC" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISSEPACC" value="2"/>
	</td> 	
   </tr>
   <tr>
    <td class="lc1" >是否按规定及时报送《广告经营单位基本情况统计表》</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISTABLE" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISTABLE" value="2"/>
	</td>
    
    <td class="lc1" >广告经营登记事项变化后，是否及时办理了变更手续</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISBG" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISBG" value="2"/>
	</td>
   </tr>
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
    1、有红色<font color=red >*</font>标示的项目为必填项。
	<br>
	</p></td>   
 </tr>
</table>
<br>
<%
if(SIGN.equals("1")){

}else{
%>
<table border="1" width="100%">
	<tr>
		<td align=center>
		<input name="btSave" type="submit" value="保  存" class="butontType"></td>
	</tr>
</table>
<%}%>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
</body>     
</html>
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");

	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	GGGL_JYDW_GLZD.setADBULICNO(ADBULICNO);
	GGGL_JYDW_GLZD.setINSYEAR(INSYEAR);
	vf.setData(GGGL_JYDW_GLZD.getData());
 	out.print(vf.ValueDefaultScript());
%>