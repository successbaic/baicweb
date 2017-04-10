<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<jsp:useBean id="GGGL_GGJY" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_GGJY"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="GGGL_JYDW_JYQK" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JYQK"/>
<%
  	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	
  	String ADBULICNO=Page.getpageKey();
  	String blFlag=Page.getpageKey2();
	int INSYEAR=Page.getipageKey();
	GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();
	
	GGGL_JYDW_JYQK.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JYQK.setINSYEAR(INSYEAR);
	GGGL_JYDW_JYQK.doSelect();

  	String SIGN = Page.getpageKey1();
 %>
<html>
<head>
<title>基本信息补录</title>
</head>
<body>
<form name="form1" method="POST" action='ggxkz_blxx_action.jsp' target="editframe">
<input type="hidden" name="PRIPID" value=<%=ADBULICNO%>>
<input type="hidden" name="ANCHEYEAR" value=<%=INSYEAR%>>
<input type="hidden" name="DJJG">
<input type="hidden" name="ENTTYPE" value="ZGJC">
<%if("1".equals(blFlag)) {//内网补录的记录，状态默认为是预审通过的%>
<input type="hidden" name="STATUS" value="2">
<%} %>
<br>
<table border="1" width="100%" cellpadding="0" cellspacing="0">
<CAPTION>经营信息补录</CAPTION>
   <tr>
   	<td width="80px" class="lc1" rowspan="4">基本情况</td>
    <td class="lc1" nowrap="nowrap">单位名称</td>   
	<td class="lc2"><input type="text" name="ENTNAME" title="单位名称"  maxlength=50 style="width:200px;">&nbsp;<!--  font color=red>*</font --></td> 
   
    <td class="lc1" nowrap="nowrap">广告经营许可证号</td>   
	<td class="lc2"><input type="text" name="ENTREGNO" title="营业执照注册号(或广告经营许可证号)"  maxlength=15>&nbsp;<!--  font color=red>*</font --></td> 
	<td class="lc1">法定代表人(负责人)</td>
    <td class="lc2">
       <input type="text" name="LEGREFEREE" title="法定代表人(负责人)"  maxlength=25 >&nbsp;<!--  font color=red>*</font -->
    </td>
   </tr>
   <tr>
     <td class="lc1">注册资本</td>   
	<td class="lc2">
	<input type="text" name="REGCAPITAL" id="REGCAPITAL" title="注册资本" size="15" maxlength=14  datatype=NUM>万元&nbsp;<!--  font color=red>*</font --></td>  
	<td class="lc1">住所</td>   
	<td class="lc2" colspan=3>
	<input type="text" name="ENTADRESS" title="住所"  maxlength=100 style="width:350px;">&nbsp;<!--  font color=red>*</font --></td> 	
	</tr>
   <tr>    	
	<td class="lc1">单位性质</td>   
	<td class="lc2">
	<select id="ENTTYPE" name="ENTPRO"  title="单位性质" style="width:100px;">
	<option value=""></option>	
	<option value="1">国有企业</option>
    <option value="2">国有事业</option>
    <option value="3">集体企业</option>
    <option value="4">集体事业</option>   
    <option value="5">私营企业</option>  
    <option value="6">个体工商户</option>  
    <option value="7">外商投资企业</option>  
    <option value="8">其他</option>
	</select>&nbsp;<!--  font color=red>*</font -->
	</td>
	
    <td class="lc1">单位类型</td>   
	<td class="lc2">
	<select id="ENTCLASS" name="ENTCLASS"  title="单位类型" style="width:100px;">
	<option value=""></option>
    <option value="30">电视台</option>
    <option value="40">广播电台</option>
    <option value="50">报社</option>
    <option value="60">期刊社</option>
    <option value="70">网站</option>
    <option value="80">其他</option>
	</select>&nbsp;<!--  font color=red>*</font -->
	</td>
	 <td class="lc1" nowrap="nowrap" >广告企业资质等级</td>   
	<td class="lc2" colspan=2><input type="text" name="QUAGRADE" title="广告企业资质等级" maxlength=25></td> 
	</tr>
	<tr>
	<td class="lc1">联系人</td>
    <td class="lc2">
       <input type="text" name="LINKMAN" title="联系人"  maxlength=25 >&nbsp;<!--  font color=red>*</font -->
    </td>
    
	<td class="lc1">联系人电话</td>   
	<td class="lc2"><input type="text" name="FILLTEL" title="联系人电话" size="15" maxlength=20  >&nbsp;<!--  font color=red>*</font --></td> 
	
	<td class="lc1">邮政编码</td>   
	<td class="lc2"><input type="text" name="POSTCODE" title="邮政编码" datatype=int size="15" maxlength=6 >&nbsp;<!--  font color=red>*</font --></td> 
   </tr></table>
   <br/>
   <table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr>
    <td width="80px" class="lc1" rowspan="7">广告经营额</td>
    <td class="lc1">药品经营额</td>   
	<td class="lc2">
	<input type="text" name="MEDI" id="jye1" title="药品经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
	
	<td class="lc1">食品经营额</td>   
	<td class="lc2">
	<input type="text" name="FOOD" id="jye2" title="食品经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
  
    <td class="lc1">保健食品经营额</td>   
	<td class="lc2">
	<input type="text" name="HTHFOOD" id="jye3" title="保健食品经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>  
   </tr>
   <tr>   
    <td class="lc1">化妆品经营额</td>   
	<td class="lc2">
	<input type="text" name="MAQUI" id="jye4" title="化妆品经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
	
	<td class="lc1">美容业经营额</td>   
	<td class="lc2">
	<input type="text" name="BEACUL" id="jye5" title="美容业经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
   
    <td class="lc1">医疗器械经营额</td>   
	<td class="lc2">
	<input type="text" name="MEDAPP" id="jye6" title="医疗器械经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>  
   </tr>
   <tr>  
    <td class="lc1">医疗服务经营额</td>   
	<td class="lc2">
	<input type="text" name="HTHCARPRO" id="jye7" title="医疗服务经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
	
	<td class="lc1">烟草经营额</td>   
	<td class="lc2">
	<input type="text" name="TOBACCO" id="jye8" title="烟草经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
   
    <td class="lc1">酒类经营额</td>   
	<td class="lc2">
	<input type="text" name="WINE" id="jye9" title="酒类经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
   </tr>
   <tr>  
    <td class="lc1">招生招聘经营额</td>   
	<td class="lc2">
	<input type="text" name="ADMREC" id="jye10" title="招生招聘经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
	
	<td class="lc1">房地产经营额</td>   
	<td class="lc2">
	<input type="text" name="REAEST" id="jye11" title="房地产经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
   
    <td class="lc1">农资经营额</td>   
	<td class="lc2">
	<input type="text" name="AGRMAT" id="jye12" title="农资经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>  
   </tr>
   <tr>
    <td class="lc1">服务业经营额</td>   
	<td class="lc2">
	<input type="text" name="SERVICE" id="jye13" title="服务业经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
	
	<td class="lc1">信息产业经营额</td>   
	<td class="lc2">
	<input type="text" name="INFORIND" id="jye14" title="信息产业经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
   
    <td class="lc1">金融保险经营额</td>   
	<td class="lc2">
	<input type="text" name="FININS" id="jye15" title="金融保险经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
   </tr>
   <tr>
    <td class="lc1">汽车经营额</td>   
	<td class="lc2">
	<input type="text" name="AUTOMAN" id="jye16" title="汽车经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
	
	<td class="lc1">家用电器经营额</td>   
	<td class="lc2">
	<input type="text" name="CONEQU" id="jye17" title="家用电器经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
  
    <td class="lc1">服装服饰经营额</td>   
	<td class="lc2">
	<input type="text" name="CLOTH" id="jye18" title="服装服饰经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>  
   </tr>
   <tr>
    <td class="lc1">其他经营额</td>   
	<td class="lc2">
	<input type="text" name="ELSBUSTUR" id="jye19" title="其他经营额" size="15" maxlength=14 datatype=NUM onblur="sumjye()">万元</td>
   
    <td class="lc1">广告经营额合计</td>   
	<td class="lc2" colspan=3>
	<input type="text" name="BUSTUR" id="BUSTUR" title="广告经营额合计" size="15" maxlength=14 datatype=NUM  disabled>万元&nbsp;<!--  font color=red>*</font --></td>   
   </tr>
  </table><br/>
   <table border="1" width="100%" cellpadding="0" cellspacing="0">
     <tr>
		<td class="lc1">固定形式印刷品经营额</td>   
		<td class="lc2">
		<input type="text" name="PRETION" title="固定形式印刷品经营额" size="15" maxlength=14 datatype=NUM>万元</td>  
	    
	    <td class="lc1">户外广告经营额</td>   
		<td class="lc2">
		<input type="text" name="OUTAD" title="户外广告经营额" size="15" maxlength=14 datatype=NUM>万元</td>
	
		<td class="lc1">广告纳税额</td>   
		<td class="lc2">
		<input type="text" name="RATAL" title="广告纳税额" size="15" maxlength=14 datatype=NUM >万元&nbsp;<!--  font color=red>*</font --></td>
     </tr>
     <tr>
		<td class="lc1">广告营业收入</td>   
		<td class="lc2">
		<input type="text" name="OPRAINCOME" title="广告营业收入" size="15" maxlength=14 datatype=NUM >万元&nbsp;<!--  font color=red>*</font --></td>
	
	    <td class="lc1">户外广告营业收入</td>   
		<td class="lc2" colspan=3>
		<input type="text" name="OUTOPRAINCOME" title="户外广告营业收入" size="15" maxlength=14 datatype=NUM>万元</td>  
     </tr>
   </table><br/>
   <table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr>
    <td width="80px" class="lc1" rowspan="3">发布的户外广告媒介数</td>
	<td class="lc1">展示牌</td>   
	<td class="lc2">
	<input type="text" name="SHOWCARD" id="mj1" title="展示牌" size="15" datatype=INT onblur="summjnum()">个</td>

    <td class="lc1">灯箱</td>   
	<td class="lc2">
	<input type="text" name="LIGHTBOX" id="mj2" title="灯箱" size="15" datatype=INT onblur="summjnum()">个</td>
	
	<td class="lc1">电子显示屏</td>   
	<td class="lc2">
	<input type="text" name="ELECSIGNS" id="mj3" title="电子显示屏" size="15" datatype=INT onblur="summjnum()">个</td>
   </tr>
   <tr>
	<td class="lc1">霓虹灯</td>   
	<td class="lc2">
	<input type="text" name="NENOLIGHT" id="mj4" title="霓虹灯" size="15" datatype=INT onblur="summjnum()">个</td>

    <td class="lc1">交通工具</td>   
	<td class="lc2">
	<input type="text" name="VEHICLE" id="mj5" title="交通工具" size="15" datatype=INT onblur="summjnum()">个</td>
	
	<td class="lc1">其他</td>   
	<td class="lc2">
	<input type="text" name="OTHERNUM" id="mj6" title="其他" size="15" datatype=INT onblur="summjnum()">个</td>
   </tr>
   <tr>
	<td class="lc1">户外广告媒介个数总计</td>   
	<td class="lc2" colspan=5>
	<input type="text" name="MEDINUM" id="MEDINUM" title="户外广告媒介个数总计" size="15" datatype=INT  disabled>个&nbsp;<!--  font color=red>*</font --></td>
  </tr></table><br/>
  <table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr>
    <td width="80px" class="lc1" rowspan="2">从业人员</td>
    <td class="lc1">管理人员</td>   
	<td class="lc2">
	<input type="text" name="MANNUM" id="ry1" title="管理人员" size="15" datatype=INT onblur='sumrynum()'>人</td>
	
	<td class="lc1">业务人员</td>   
	<td class="lc2">
	<input type="text" name="WORNUM" id="ry2" title="业务人员" size="15" datatype=INT onblur='sumrynum()'>人</td>
	
	<td class="lc1">其他人员</td>   
	<td class="lc2">
	<input type="text" name="ELSEMPNUM" id="ry3" title="其他人员" size="15" datatype=INT onblur='sumrynum()'>人</td>
   </tr>
    <tr>
	<td class="lc1">从业人员合计</td>   
	<td class="lc2" colspan=5>
	<input type="text" name="EMPNUM" id="EMPNUM" title="从业人员合计" size="15" datatype=INT  disabled>人&nbsp;<!--  font color=red>*</font --></td>
   </tr></table>
   <br/><table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr>   
    <td width="80px" class="lc1" nowrap="nowrap">负责人</td>   
	<td class="lc2"><input type="text" name="MANAGER" title="负责人"  maxlength=25>&nbsp;<!--  font color=red>*</font --></td>
	
	<td class="lc1" nowrap="nowrap">填表人</td>   
	<td class="lc2"><input type="text" name="FILLMAN" title="填表人"  maxlength=25>&nbsp;<!--  font color=red>*</font --></td> 
    
    <td class="lc1" nowrap="nowrap">填报日期</td>   
	<td class="lc2">
	<input type="text" name="FILLDAT" title="填报日期"  maxlength=10 datetype=DATE onclick="dropdowndate(this)">&nbsp;<!--  font color=red>*</font --></td> 
   </tr>
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">说明：
    1、有红色<font color=red >*</font>标示的项目为必填项。<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、广告经营额合计、户外广告媒介个数总计、从业人员合计等，会根据填写的信息自动计算，不必手工填写。
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
<script type="text/javascript">
//计算从业人员合计=管理人员+业务人员+其他人员
function sumrynum()
{
	var rysum=0;//从业人员合计
	for(var i=1;i<=3;i++){
	  var sid="ry"+i;
	  var rynum=document.getElementById(sid).value;
	  var columname=document.getElementById(sid).title;
	  if(rynum!=null&&rynum!="")
	  {
	   if (fucCheckNUM(rynum))
	   {
		 if(rynum<0){
		    alert(columname+'个数不允许是负值！');
			return false;
		  }
		 if (Math.abs(rynum)>999999999999)
		  {
			alert(columname+'个数超过系统最大精度！');
			return false;
		  }
	   }else
	    {
		   alert(columname+'个数应为数字！');
		   return false;
	    }
	  rysum=parseInt(rysum)+parseInt(rynum);
	}
	}
	document.getElementById("EMPNUM").value=rysum;	
}
//计算发布的户外广告媒介数合计=展示牌+灯箱+电子显示屏+霓虹灯+交通工具+其他；
function summjnum()
{
	var mjsum=0;//户外广告媒介合计
	for(var i=1;i<=6;i++){
	  var sid="mj"+i;
	  var mjnum=document.getElementById(sid).value;
	  var columname=document.getElementById(sid).title;
	  if(mjnum!=null&&mjnum!="")
	  {
	   if (fucCheckNUM(mjnum))
	   {
		 if(mjnum<0){
		    alert(columname+'个数不允许是负值！');
			return false;
		  }
		 if (Math.abs(mjnum)>999999999999)
		  {
			alert(columname+'个数超过系统最大精度！');
			return false;
		  }
	   }else
	    {
		   alert(columname+'个数应为数字！');
		   return false;
	    }
	  mjsum=parseInt(mjsum)+parseInt(mjnum);
	}
	}
	document.getElementById("MEDINUM").value=mjsum;	
}
//计算广告经营额合计=药品+食品+保健食品+化妆品+美容业+...
function sumjye(){
    var jyesum=0;//广告经营额合计
	for(var i=1;i<=19;i++){
	  var sid="jye"+i;
	  var jyenum=document.getElementById(sid).value;
	  var columname=document.getElementById(sid).title;
	  if(jyenum!=null&&jyenum!="")
	  {
	   if (fucCheckNUM(jyenum))
	   {
		 if(jyenum<0){
		    alert(columname+'不允许是负值！');
			return false;
		  }
		 if (Math.abs(jyenum)>999999999999)
		  {
			alert(columname+'超过系统最大精度！');
			return false;
		  }
	   }else
	    {
		   alert(columname+'应为数字！');
		   return false;
	    }
	  jyesum=parseFloat(jyesum)+parseFloat(jyenum);
	}
	}
	document.getElementById("BUSTUR").value=jyesum.toFixed(3);	
}
function checkEMPNUM(){
   var empnum=document.getElementById("EMPNUM").value;
   if(empnum==null||empnum==""||empnum==0){
    	alert('管理人员、业务人员、其它人员合计不能为0！');
    	return false;
   }
}
</script>
</body>
</html>	
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
    ec.setUserFunction("checkEMPNUM()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%	
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	GGGL_GGJY.setPRIPID(ADBULICNO);
	GGGL_GGJY.setANCHEYEAR(INSYEAR);
	if(GGGL_GGJY.doCount()){
	   vf.setData(GGGL_GGJY.getData());
	}else{
	   vf.setFormData("ENTNAME",GGGL_JYDW_JBXX.getADBUENT());//单位名称
	   vf.setFormData("ENTREGNO",GGGL_JYDW_JBXX.getADBULICNO());//广告经营许可证号
	   vf.setFormData("ENTADRESS",GGGL_JYDW_JBXX.getDOM());//住所
	   vf.setFormData("LEGREFEREE",GGGL_JYDW_JBXX.getLEREP());//法定代表人
	   vf.setFormData("REGCAPITAL",GGGL_JYDW_JBXX.getREGCAP());//注册资本
	   //vf.setFormData("ENTCLASS",GGGL_JYDW_JBXX.getADTYPE());//代码不对应
	   vf.setFormData("FILLTEL",GGGL_JYDW_JBXX.getTEL());//联系电话
	   vf.setFormData("POSTCODE",GGGL_JYDW_JBXX.getPOLCODE());//邮政编码
	   vf.setFormData("DJJG",GGGL_JYDW_JBXX.getREGORG());
	    
	   vf.setFormData("RATAL",GGGL_JYDW_JYQK.getRATAL());//纳税额
	   vf.setFormData("OPRAINCOME",GGGL_JYDW_JYQK.getADOPEINC());//广告营业收入
	   vf.setFormData("OUTOPRAINCOME",GGGL_JYDW_JYQK.getHWBUSINC());//户外广告营业收入
	   vf.setFormData("SHOWCARD",GGGL_JYDW_JYQK.getEXHPLAQUAN());//路牌 展示牌
	   vf.setFormData("LIGHTBOX",GGGL_JYDW_JYQK.getLAMPBOXQUAN());//灯箱
	   vf.setFormData("ELECSIGNS",GGGL_JYDW_JYQK.getEDISUQUAN());//电子显示屏
	   vf.setFormData("NENOLIGHT",GGGL_JYDW_JYQK.getNELQUAN());//霓虹灯
	   vf.setFormData("OTHERNUM",GGGL_JYDW_JYQK.getOTHQUAN());//其他  
	  
	   vf.setFormData("EMPNUM","0");
	   vf.setFormData("MEDINUM","0");
	   vf.setFormData("BUSTUR","0");
	}		
	
 	out.print(vf.ValueDefaultScript());
%>