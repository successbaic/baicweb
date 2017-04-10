<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="GGGL_JYDW_HCQK" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_HCQK"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<%@ page import="com.gwssi.gongshang.component.sysadmin.model.*"%>
<html>
<head>
<title>核查情况</title>
<script language="javascript">
function doSub(lx){
    document.form1.ANCHETYPE.value=lx;
    document.form1.submit();
}
</script>
</head> 
<%
  	String ADBULICNO=Page.getpageKey();
	int INSYEAR=Page.getipageKey();

  	String SIGN = Page.getpageKey1();
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	UserModel userModel = (UserModel) session.getAttribute("userModel");
	String userid="",username="";
	if(userModel!=null){
		userid=userModel.getUserID();
		username=userModel.getEname();
	}	
 %>
<body>
<form name="form1" method="POST" action='ggxkz_hcqk_action.jsp' target="editframe">
<input type="hidden" name="ADBULICNO" value=<%=ADBULICNO%>>
<input type="hidden" name="INSYEAR" value=<%=INSYEAR%>>
<input type="hidden" name="ANCHETYPE">
<input type="hidden" name="CHEPERID">
<br>
<table border="1" width="100%">
<CAPTION>核查情况</CAPTION>
   <tr>
	<td class="lc1" nowrap="nowrap" width="20%">注册资本数额是否符合</td>   
	<td class="lc2" align="center" width="20%">
	&nbsp;&nbsp;是<input type="radio" name="ISREGCAP" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISREGCAP" value="2"/>
	</td> 
	
	<td class="lc1" width="30%">经营场所及其面积是否符合</td>   
	<td class="lc2" align="center" width="25%">
	&nbsp;&nbsp;是<input type="radio" name="ISOPDOM" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISOPDOM" value="2"/>
	</td> 
	</tr>
   <tr> 
    <td class="lc1" >专业人员具有大专以上学历人数是否符合</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISJUCOL" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISJUCOL" value="2"/>
	</td>
	    
	<td class="lc1" >从业人员取得《广告专业技术岗位资格培训证书》人数是否符合</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISCRED" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISCRED" value="2"/>
	</td> 	
   </tr>
   <tr> 
    <td class="lc1" >广告审查员配备人数是否符合</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISADCHE" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISADCHE" value="2"/>
	</td>
	    
	<td class="lc1" >内部经营机构设置与其广告经营范围适应程度是否符合</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISOPBUS" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISOPBUS" value="2"/>
	</td> 	
   </tr>
   <tr>
    <td class="lc1" >广告经营基本专业设备是否符合</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISPROEQU" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISPROEQU" value="2"/>
	</td>
    
    <td class="lc1" >广告经营基本管理制度是否符合</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISMASYS" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISMASYS" value="2"/>
	</td>
   </tr>
   <tr>
    <td class="lc1" >广告经营业务开展情况是否符合</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISBUSSIT" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISBUSSIT" value="2"/>
	</td>
    
    <td class="lc1" >无广告违法违章行为是否符合</td>   
	<td class="lc2" align="center">
	&nbsp;&nbsp;是<input type="radio" name="ISCASE" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISCASE" value="2"/>
	</td>
   </tr>
   <tr>
    <td class="lc1" >是否已经改正</td>   
	<td class="lc2" align="center" colspan=3>
	&nbsp;&nbsp;是<input type="radio" name="ISCHANGE" value="1" checked/>
	&nbsp;&nbsp;否<input type="radio" name="ISCHANGE" value="2"/>
	</td>
   </tr>
   <tr>
    <td class="lc1">审查意见</td>   
	<td class="lc2" align="center" colspan=3>
      <select id="CHEOPIN" name="CHEOPIN" title="审查意见" onchange="setVar()" disblank>
       <option></option>  
       <option value="1">具备经营广告业务资格，通过检查</option>
       <option value="2">缓期通过检查，限期整改</option>
       <option value="3">核减其广告经营项目</option>
       <option value="4">不具备经营广告业务资格，核销《广告经营许可证》</option>
       <option value="5">其他(选择其他的同时，请填写具体的意见)</option>
     </select> <font color="red">*</font>
	</td>
   </tr>
   <tr id="che_tr">
   <td class="lc1">其它意见</td>
	<td class="lc2" align="center" colspan=3>
      <textarea rows="5" id="OTHERCHEOPIN" name="OTHERCHEOPIN" title="审查意见" cols="80" maxlength=2000></textarea>&nbsp;<font color="red">*</font>
	</td>
   </tr>
   <tr>
   <td class="lc1">审查人员</td>
   <td class="lc2"><input type="text" id="CHEPER" name="CHEPER" disabled></td>
   <td class="lc1">审查时间</td>
   <td class="lc2"><input type="text" id="CHEDATE" name="CHEDATE" disblank maxlength=10 datetype=DATE onclick="dropdowndate(this)">&nbsp;<font color=red>*</font></td>
   </tr>
   <%
	if(SIGN.equals("1")){
		GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
		GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
		GGGL_JYDW_JBXX.doSelect();
		String anchetype=GGGL_JYDW_JBXX.getANCHETYPE();
   %>
   <tr>
    <td class="lc1"><%=INSYEAR%>年度年检状态：</td>
   <td class="lc2" colspan="3">
   <%
    String sAnche="";
   	if(anchetype.equals("") || anchetype.equals("0")){
   		sAnche=" 尚 未 提 交";
   	}else if(anchetype.equals("1")){
   		sAnche=" 待 预 审";
   	}else if(anchetype.equals("2")){
   		sAnche=" 预 审 通 过";
   	}else if(anchetype.equals("3")){
   		sAnche=" 预 审 驳 回";
   	}
   %><font color="red" style="font-size:14px">&nbsp;&nbsp;<%=sAnche%></font>
   </td>
   </tr>
  <%}%> 
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
		<input name="btSave" type="button" value="预审通过" class="butontType" onclick="doSub(2)">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="btSave" type="button" value="预审驳回" class="butontType" onclick="doSub(3)">
		</td>
	</tr>
</table>
<%}%>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
<script type="text/javascript">
function setVar()
{
	var cheopin=document.getElementById("CHEOPIN").value;
	if(cheopin=="5"){
	   //document.getElementById("OTHERCHEOPIN").value="";
	   document.getElementById("che_tr").style.display="";
	}else{
	   document.getElementById("OTHERCHEOPIN").value="";
	   document.getElementById("che_tr").style.display="none";
	}
}
function checkOtherChe(){
	var cheopin=document.getElementById("CHEOPIN").value;
	if(cheopin=="5"){
		if( document.getElementById("OTHERCHEOPIN").value==""){
			alert("选择其它意见时，必须录入其它意见的信息!");
			return false;
		}
	}
}
</script>
</body>     
</html>
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.setUserFunction("checkOtherChe()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	
	java.util.Date date=new java.util.Date();
	String Years	=String.valueOf(date.getYear()+1900);
	String Months	=String.valueOf(date.getMonth()+1);	
	String Days		=String.valueOf(date.getDate());
	if(Months.length()==1)
		Months="0"+Months;
	if(Days.length()==1)
		Days="0"+Days;
	vf.setFormData("CHEPER",username);
	vf.setFormData("CHEPERID",userid);
	vf.setFormData("CHEDATE",Years+"-"+Months+"-"+Days);
	GGGL_JYDW_HCQK.setADBULICNO(ADBULICNO);
	GGGL_JYDW_HCQK.setINSYEAR(INSYEAR);	
	vf.setData(GGGL_JYDW_HCQK.getData());
	vf.setUserFunction("setVar()");	
 	out.print(vf.ValueDefaultScript());
%>