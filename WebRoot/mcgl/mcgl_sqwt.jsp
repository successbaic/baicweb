<%@ page contentType="text/html;charset=GBK"%> 
<%@ include file="../jspheader.inc"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="MCGL_JBXX" scope="page"  class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<html>
<head>
<title>指定代表或者共同委托代理人的证明</title>
<script language="javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
<SCRIPT language="javascript">
function checkTel(){
	var TEL=document.form1.TEL.value;
	if(TEL!=""&&TEL.length<7){
		alert("联系电话格式不对，不应小于7位");
		return false;
	}
	return true;
}
function checkSFZH()
	{		
		var ret=true;
		if (document.form1.CERTYPE.value=="10")	// 身份证
		{
			ret=validatezjhm(document.form1.CERNO.value);
			if(ret){
			
			}else{

			}
		}
		return ret;
	}
	
function doSub(){
	if(form1errorCheck()){
		document.getElementById("subid").disabled=true;
		document.getElementById("waitdiv").style.display="";
		document.form1.submit();
	}
}
</SCRIPT>
</head>
<body >
<%@include file="../top.inc"%>
<%
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);

	String OPENO =Page.getOPENO();
    String SIGN = Page.getSIGN();
    
    String xzinfo="领取《企业名称预先核准通知书》";
    if(Page.getOPETYPE().equals("13")){
    	xzinfo="领取《名称变更核准通知书》";	
    }    
 %> 

<form name="form1" method="POST" action='mcgl_sqwt_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="SIGN" value=0>
<input type="hidden" name="PRIPID" >
<input type="hidden" name="action"  value="1">
<table border="1" width="100%" cellpadding="0" cellspacing="0" >
<tr>
					<td class="yxsm" colspan="5" align="center">
						<p
							style="font-color: #000080; font-size: 11pt; font-weight: bold;">
							<font color=#000080>指定代表或者共同委托代理人的证明</font>
						</p>
					</td>
				</tr>
<tr>
    <td class="lc1" colspan="2" >申请人</td>
    <td class="lc2" colspan="3"  >
        <input type="text" name="APPPER" size="29" disblank title='申请人' maxlength='15'>
        &nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
    <td class="lc1" colspan="2" >指定代表或者委托代理人</td>
    <td class="lc2" colspan="3"  >
        <input type="text" name="CONSIGNER" size="29" disblank title='委托代理人' maxlength='15'>
        &nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
    <td class="lc1"  colspan="2" >指定代表或委托代理人的权限</td>
	<td class="lc2" colspan="3" >
	  	<!-- &nbsp;1、<input type="radio" name="IFLICENSE1" value="1" title="核对登记材料中的复印件并签署核对意见" disblank checked>同意&nbsp;<input type="radio" name="IFLICENSE1" value="2">不同意&nbsp;&nbsp;&nbsp;&nbsp;核对登记材料中的复印件并签署核对意见<br>
	  	&nbsp;2、<input type="radio" name="IFLICENSE3" value="1" title="修改有关表格的填写错误" disblank checked>同意&nbsp;<input type="radio" name="IFLICENSE3" value="2">不同意&nbsp;&nbsp;&nbsp;&nbsp;修改有关表格的填写错误<br>
	  	&nbsp;3、<input type="radio" name="IFLICENSE2" value="1" title="领取《企业名称预先核准通知书》。" disblank checked>同意&nbsp;<input type="radio" name="IFLICENSE2" value="2">不同意&nbsp;&nbsp;&nbsp;&nbsp;领取《企业名称预先核准通知书》。<br> -->
	  	
	  	&nbsp;1、<input type="radio" name="IFLICENSE1" value="1" title="核对登记材料中的复印件并签署核对意见" disblank checked>同意&nbsp;<input type="radio" name="IFLICENSE1" value="2">不同意&nbsp;&nbsp;&nbsp;&nbsp;核对登记材料中的复印件并签署核对意见<br>
	  	&nbsp;2、<input type="radio" name="IFLICENSE2" value="1" title="修改企业自备文件的错误" disblank checked>同意&nbsp;<input type="radio" name="IFLICENSE2" value="2">不同意&nbsp;&nbsp;&nbsp;&nbsp;修改企业自备文件的错误<br>
	  	&nbsp;3、<input type="radio" name="IFLICENSE3" value="1" title="修改有关表格的填写错误" disblank checked>同意&nbsp;<input type="radio" name="IFLICENSE3" value="2">不同意&nbsp;&nbsp;&nbsp;&nbsp;修改有关表格的填写错误<br> 
	  	&nbsp;4、<input type="radio" name="IFLICENSE4" value="1" title="<%=xzinfo%>" disblank checked>同意&nbsp;<input type="radio" name="IFLICENSE4" value="2">不同意&nbsp;&nbsp;&nbsp;&nbsp;<%=xzinfo%>。<br>
  	</td>
 </tr>

<tr>
    <td class="lc1"  colspan="2" >指定或者委托的有效期限</td>
    <td class="lc2" colspan="4">
        自<input type="text" name="CONFROM" size="30" title='有效期限自'disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE">
        &nbsp;<font color=red>*</font>
         至
        <input type="text" name="CONTO" size="30" title='有效期限至' disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE">
        &nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>   
    <td class="lc1" rowspan="2" width="15%" nowrap>指定代表或委托代理人<br>或者经办人信息</td>
    <td class="lc1" height="27" nowrap="nowrap" width="10%">证件类型</td>
    <td class="lc2">
	  <select size="1" name="CERTYPE" title="证件类型" disblank>
	  <option value=''>请选择证件类型</option><%=icms.getSysDmList("CERTYPE")%></select>&nbsp;<font color=red>*</font>
	</td>   	   
    <td class="lc1" height="27" nowrap="nowrap">证件号码</td>
    <td class="lc2">   
        <input type="text" name="CERNO" disblank title="身份证件号码" maxlength=40 size="30">&nbsp;<font color=red>*</font>
	</td>
</tr>
<tr>	   
    <td class="lc1" height="27">联系电话</td>
    <td class="lc2" colspan="3">   
        <input type="text" name="TEL" size="30" title='联系电话' maxlength='30' datatype="TEL" disblank>&nbsp;<font color=red>*</font>
    </td>
    <!-- 
    <td class="lc1" >移动电话</td>
    <td class="lc2">   
        <input type="text" name="MOBTEL" size="30" title='移动电话' maxlength='30' datatype="TEL">
    </td>
     -->
</tr>   
<tr>   
    <td class="lc1"  colspan="2">授权日期</td>
    <td class="lc2" colspan="3">   
        <input type="text" name="CONDATE" size="30" title='授权日期' disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE">
        &nbsp;<font color=red>*</font>
    </td>
</tr>
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：有红色<font color=red >*</font>标示的项目为必填项。
	<!-- <br>
	2、固定电话和移动电话至少填写其中一项。
	<br> -->
	</p></td>   
 </tr>
</table>
 <br><CENTER>
  <div id="waitdiv" style="display:none"><img src="../images/blue-loading.gif">
	<br/>
	数据查询中，请等待...<br/>&nbsp;
  </div>
 <%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='mcgl_dotj.jsp'">下一步</div>
<%
}else{
%>
<div class="subImgs"  id="subid" onclick="doSub()">下一步</div>
<%
}
%></CENTER>
</form>
<iframe height="0" width="100" name="editframe" src="" id="editframe" scrolling="no" border="1" align='center' frameborder="0"></iframe>
<%@include file="../bottom.inc"%>
</body>      
<IFRAME HEIGHT="0" WIDTH="0" SRC="" NAME="hiddenframe" id="hiddenframe"></IFRAME>
</html>      

<%  
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	MCGL_JBXX.setOPENO(OPENO);
	MCGL_JBXX.doSelect();
	String sAPPPER="";
	String QYLX=icms.getSysRemark("ENTTYPE", MCGL_JBXX.getENTTYPE());
	if(QYLX.equals("GS") || QYLX.equals("WZGS")){
		sAPPPER="全体股东";
	}else if(QYLX.equals("HZS")){
		sAPPPER="全体成员";
	}else if(QYLX.equals("HHQY") || QYLX.equals("GRDZ")){
		sAPPPER="全体出资人";
	}
	if(MCGL_JBXX.getENTCLASS().equals("5")){		
		sAPPPER=MCGL_JBXX.getOWNERNAME();
	}
	
	if(Page.getOPETYPE().equals("13")){		
		sAPPPER=MCGL_JBXX.getENTNAMEBEALT();
	}
	vf.setFormData("APPPER",sAPPPER);
	ErrorCheck ec = new ErrorCheck();

	ec.setFormName("form1");
	ec.dateOrderCheck("CONFROM","CONTO","有效期限终止日期应该大于等于起始日期!");
	ec.setUserFunction("checkTel()");
	ec.setUserFunction("checkSFZH()");
	ec.FormErrorCheck();

	out.print(ec.ErrorCheckScript());
	QYDJ_SQWT.setOPENO(OPENO);

	vf.setData(QYDJ_SQWT.getData());
	
	out.print(vf.ValueDefaultScript());
%>
<script type="text/javascript">
	<%
		if (SIGN.equals("1")) {
	%>
	$(":text").attr("disabled","disabled");
	$("select").attr("disabled","disabled");
	$(":radio").attr("disabled","disabled");
	$("#BUSSCOPE").attr("disabled","disabled");
	<%
		}
	%>
</script>