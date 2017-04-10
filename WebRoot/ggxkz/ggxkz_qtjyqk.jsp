<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="GGGL_JYDW_JYQK" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JYQK"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<html>
<head>
<title>经营情况</title>
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
	
	String divflag="block";
	if(SIGN.equals("1")||SIGN.equals("2")){//已开业的企业
		divflag="none";
 	}
 %>
<body>
<form name="form1" method="POST" action='ggxkz_qtjyqk_action.jsp' target="editframe">
<input type="hidden" name="ADBULICNO" value=<%=ADBULICNO%>>
<input type="hidden" name="INSYEAR" value=<%=INSYEAR%>>
<br>

<table border="1" width="100%" cellpadding="0" cellspacing="0">
<caption>印刷品广告、户外广告及临时性广告经营等情况</caption>
<%--    
   <tr> 
	<td class="lc1" >广告经营许可证号</td>   
	<td class="lc2" ><input type="text" name="ADBULICNO" title="广告经营许可证号" disblank maxlength=32 disabled>&nbsp;<font color=red>*</font></td> 
	
	<td class="lc1" >检查年度</td>
    <td class="lc2" >
	  <input type="text" name="INSYEAR" disblank title="检查年度" maxlength=5 datetype=INT disabled>&nbsp;<font color=red>*</font>
	</td> 
   </tr>
--%>
   <tr>
    <td class="lc1" rowspan=2 width="10%">固定形式<br>印刷品广告<br>经营情况</td>
	<td class="lc1" width="15%">固定形式印刷品广告名称</td>   
	<td class="lc2" ><input type="text" name="ADNAME" title="固定形式印刷品广告名称" disblank maxlength=50 size="40%">&nbsp;<font color=red>*</font></td> 
	
	<td class="lc1" >发布期数</td>   
	<td class="lc2" ><input type="text" name="ISSDEG" title="发布期数" disblank maxlength=5 datetype=INT>&nbsp;<font color=red>*</font></td> 
	</tr>
   <tr> 
    <td class="lc1" >经营收入</td>   
	<td class="lc2" ><input type="text" name="GDBUSINC" disblank title="固定形式印刷品广告经营收入(万元)" maxlength=18 datetype=NUM>万元&nbsp;<font color=red>*</font></td>
	    
	<td class="lc1" >备注</td>   
	<td class="lc2"><input type="text" name="REMARK" title="备注" maxlength=500>
	</td> 	
   </tr>
   <tr> 
    <td class="lc1" rowspan=3>户外广告<br>设置情况</td>
    <td class="lc1" >经营总收入</td>   
	<td class="lc2" ><input type="text" name="HWBUSINC" disblank title="户外广告经营收入(万元)" maxlength=18 datetype=NUM>万元&nbsp;<font color=red>*</font></td>
	    
	<td class="lc1" >路牌</td>   
	<td class="lc2"><input type="text" name="EXHPLAQUAN" title="路牌" maxlength=5 datetype=INT>个/m2
	</td> 	
   </tr>
   <tr>
    <td class="lc1" >灯箱</td>   
	<td class="lc2"><input type="text" name="LAMPBOXQUAN" title="灯箱" maxlength=5 datetype=INT>个/m2
    
    <td class="lc1" >霓虹灯</td>   
	<td class="lc2"><input type="text" name="NELQUAN" title="霓虹灯" maxlength=5 datetype=INT>个/m2
   </tr>
   <tr>
    <td class="lc1" >电子显示牌(屏)</td>   
	<td class="lc2"><input type="text" name="EDISUQUAN" title="电子显示牌(屏)" maxlength=5 datetype=INT>个/m2
     
    <td class="lc1" >其他</td>   
	<td class="lc2"><input type="text" name="OTHQUAN" title="其他" maxlength=5 datetype=INT>个/m2 
   </tr>
   <tr>
    <td class="lc1" >临时性广告经营情况</td>  
    <td class="lc1" >承办次数</td>   
	<td class="lc2"><input type="text" name="UNDDEG" title="临时性广告承办次数" maxlength=5 datetype=INT>次
   
    <td class="lc1" >临时性广告经营收入</td>   
	<td class="lc2" ><input type="text" name="LSBUSINC" disblank title="临时性广告经营收入（万元）" maxlength=18 datetype=NUM>万元&nbsp;<font color=red>*</font></td>
   </tr>
   <tr>
     <td class="lc1" colspan=2>开展公益广告活动情况</td>
     <td class="lc2" colspan=3>
      <textarea rows="5" id="ACTCON" name="ACTCON" title="开展公益广告活动情况" cols="80" maxlength=2000></textarea>
     </td>
   </tr>
    <tr>
     <td class="lc1" colspan=2>广告经营中有无违法违章问题<br>（时间、类别、内容、次数）</td>
     <td class="lc2" colspan=3>
      <textarea rows="5" id="ILLEGAL" name="ILLEGAL" title="广告经营中有无违法违章问题（时间、类别、内容、次数）" cols="80" maxlength=2000></textarea>
     </td>
   </tr>
   <tr>
     <td class="lc1" colspan=2>改进措施</td>
     <td class="lc2" colspan=3>
      <textarea rows="5" id="IMPROVEMENT" name="IMPROVEMENT" title="改进措施" cols="80" maxlength=2000></textarea>
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
	GGGL_JYDW_JYQK.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JYQK.setINSYEAR(INSYEAR);
	vf.setData(GGGL_JYDW_JYQK.getData());
 	out.print(vf.ValueDefaultScript());
%>