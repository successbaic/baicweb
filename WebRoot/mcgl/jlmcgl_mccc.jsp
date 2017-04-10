<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="MCGL_JBXX_SQ" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>
<html>
<head><title>名称预查重</title>
<%
	String sql = "SELECT t.remark" + "  FROM com_parm_item t"
			+ " WHERE t.sort_code = 'GT_GMLX'"
			+ "   AND item_code = 'GT_GMLX'"
			+ "   AND item_status = '1'";
	ResultSet rs = gsdbc.executeQuery(sql);
	boolean gt_isQx = false;
	if(rs.next()){
		if("QX".equals(rs.getString("remark")));
		gt_isQx = true;
	}
	rs.close();
	gsdbc.close();
	String SIGN = Page.getSIGN();
	String OPENO = Page.getOPENO();
	String STATUS = SysUtility.doPreProcess(request.getParameter("STATUS"));
	String cheNametype="";
	String XZQH=webuser.getXZQH();
	//if(XZQH.equals("3700")){cheNametype="nametypeChange()";}
	String gsm=icms.getSysDm("XZQH",XZQH);
%>
<script type="text/javascript">
	var gt_isQx = "<%=gt_isQx%>";
	var XZQH = "<%=XZQH%>";
/*
	modify by:vincent
	2014.8.5
	业务类型事件和冠名类型事件合并到一起，原来两个事件有bug；
*/
function ENTCHANGE(){
	var ENTCLASS=document.form1.ENTCLASS.value;	
	var nametype=document.form1.NAMETYPE.value;
	var XZQH=document.form1.XZQH.value;
	//处理个体冠名类型只能冠区县名
	if(gt_isQx == "true"){
		if(XZQH != "3700"){
			if(ENTCLASS == "5"){
				$("#NAMETYPE option[value='2']").remove();
			}else{
				if($("#NAMETYPE option[value='2']").length <= 0){
					$("#NAMETYPE").prepend("<option value='2'>冠市名</option>");
				}
			}
		}
	}
	var SREAMRK="1,2,3";
    	if(ENTCLASS=="5" || ENTCLASS=="6"){
    		SREAMRK="2,3";
    	}else{
		if(nametype=="1"){
			SREAMRK="3";
		}else if(nametype=="2"){
			SREAMRK="1,2,3";
		}		
	}
	document.frames["hiddenframe1"].location="../support/mcload.jsp?OBJ=parent.form1.PREREGORG&SREAMRK="+SREAMRK+"&XZQH="+XZQH+"&ENTCLASS="+$("#ENTCLASS").val();
	if(ENTCLASS=="5"){
		document.getElementById("tr_31").style.display="none";
		document.getElementById("tr_32").style.display="none";
		document.form1.SPANAME3.value="";
		document.form1.ENTNAME3.value="";
	}else{
		document.getElementById("tr_31").style.display="";
		document.getElementById("tr_32").style.display="";
	}
	
}
/*
function nametypeChange(){
	var nametype=document.form1.NAMETYPE.value;
	var ENTCLASS=document.form1.ENTCLASS.value;	
	var SREAMRK="1,2,3";
	//0省局 1市局 2分局 3县市局
	if(ENTCLASS=="5"||ENTCLASS=="6"){
		SREAMRK="2,3";
	}else{
		if(nametype=="1"){
			SREAMRK="3";
		}else if(nametype=="2"){
			SREAMRK="1,2,3";
		}		
	}
	document.frames["hiddenframe1"].location="../support/mcload.jsp?OBJ=parent.form1.PREREGORG&SREAMRK="+SREAMRK;
}
*/
function zhcc(lx){
	var ENTCLASS=document.form1.ENTCLASS.value;
	if(ENTCLASS==""){
		alert("请选择业务类型");
		return;
	}
	var NAMETYPE=document.form1.NAMETYPE.value;
	if(NAMETYPE==""){
		alert("请选择冠名类型");
		return;
	}
	var PREREGORG=document.form1.PREREGORG.value;
	if(PREREGORG==""){
		alert("请选择拟登记机关");
		return;
	}
	var zhName = "";
	if(lx=="0"){
		zhName = $("#ENTTRA").val();
	}else{
		zhName = $("#SPANAME"+lx).val();
	}
	//var NAMEIND=document.form1.NAMEIND.value;
	//if(NAMEIND==""){
	//	alert("请录入行业名称");
	//	return;
	//}
	var hy=document.form1.NAMEIND.value;
	var djjg=document.form1.PREREGORG.value;
	var url="zhcc.jsp?nametype="+NAMETYPE+"&lx="+lx+"&djjg="+djjg+"&hy="+hy+"&ENTCLASS="+ENTCLASS+"&zhName="+zhName;
	window.open(url,'','toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no,left=150,top=50, height=600,width=800 fullscreen=no');
}

//数据校验
function check(){
	var NAMETYPE=document.form1.NAMETYPE.value;
	var PREREGORG=document.form1.PREREGORG.value;
	var XZQH=document.form1.XZQH.value;	
	var ENTCLASS=document.form1.ENTCLASS.value;
	//if(ENTCLASS=="5" || ENTCLASS=="6"){
	if(ENTCLASS=="5"){
		if(NAMETYPE!="1"){
			//alert("个体户只能冠区县名！");
			//return false;
		}
	}
	if(ENTCLASS=="5" || ENTCLASS=="6"){
		if(PREREGORG.length=6 && PREREGORG.substr(4,6)=="00"){
			alert("个体户及合作社不能选择市局作为登记机关！");
			return false;
		}
	}
	if(NAMETYPE=="1"&&PREREGORG==XZQH){
		alert("冠名类型为冠区县名时，拟登记机关不能选择市局！");
		return false;
	}
	return true;
}
function checkZh(){
	var arr = new Array($("#ENTTRA").val(),$("#SPANAME1").val(),$("#SPANAME2").val(),$("#SPANAME3").val());
	return isRepeat(arr);
}
function isRepeat(arr){
	var nary=arr.sort();
	 for(var i=0;i<arr.length;i++){
	 if (nary[i]==nary[i+1]&&nary[i]!=""){
	  	alert("字号：\"" + nary[i]  + "\" 不能重复申请，请检查后重试！");
	  	return false;
	 }
	}
	return true;
}

function loadgss()   
{
	var dqdm=document.form1.NAMETYPE.value;
	var entclass=document.form1.ENTCLASS.value;	

	document.frames["hiddenframe"].location="../support/loadmc.jsp?OBJ=parent.form1.PREREGORG&SREAMRK="+dqdm+"&SENTCLASS="+entclass;
}
function showTxsm(url){
	window.open(url,'_blank','toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=yes,left=0,top=0, height=600,width=800 fullscreen=no');
}
</script>
</head>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	if(!OPENO.equals("")){
		MCGL_JBXX_SQ.setOPENO(OPENO);
		vf.setData(MCGL_JBXX_SQ.getData());
		if("3".equals(STATUS)){//如果状态为驳回，则清空申请字号和申请名称
			vf.setFormData("ENTTRA","");
			vf.setFormData("ENTNAME","");
			vf.setFormData("SPANAME1","");
			vf.setFormData("ENTNAME1","");
			vf.setFormData("SPANAME2","");
			vf.setFormData("ENTNAME2","");
			vf.setFormData("SPANAME3","");
			vf.setFormData("ENTNAME3","");
		}
	}	
	String zczbNote = icms.getSysDm("VAL_MCGL","DJJG_ZCZB");
	if(zczbNote.length()>4){
		zczbNote = zczbNote.substring(0,zczbNote.length() - 4) + "亿";
	}else{
		zczbNote = zczbNote + "万";
	}	
	
%>
<body bgcolor="#eefbf7" style="margin-top: 0; margin-bottom: 0">
<%@include file="../top.inc"%>
<%
StepShow stepShow= new StepShow();
%>
<%=stepShow.getStep("2",Page.getDL()+Page.getOPETYPE(),Page.getOPENO())%>

<form name="form1" method="post" action="mcgl_mccc_action.jsp" target="editframe">
<input type="hidden" name="OPENO" value="<%=OPENO %>"/>
<input type="hidden" name="SIGN" value="<%=SIGN %>"/>
<input type="hidden" name="TRADPINY">
<input type="hidden" name="TRADPINY1">
<input type="hidden" name="TRADPINY2">
<input type="hidden" name="TRADPINY3">
<input type="hidden" name="XZQH" value="<%=XZQH%>">
<input type="hidden" name="NAMEIND"/>
<table width="100%" border="1">
<tr class="yxsm">
	<td colspan="3"  style="font-size:14pt;text-align: center;background-image: url('../images/main/ywbltitleBG.jpg');">
		名称预查重
	</td>
</tr>

  <tr>
    <td>业务类型 <font color="red">*</font></td>
    <td>
	<select id="ENTCLASS" name="ENTCLASS" onchange="ENTCHANGE()" title="业务类型">
		<option value="">请选择业务类型</option>
		<option value="1">内资企业</option>
		<option value="2">私营企业</option>
		<option value="8">外资企业</option>		
		<option value="6">农民专业合作社</option>
		<option value="5">个体工商户</option>			
	</select>
	&nbsp;<input type="button" class="button"  style="height:20px;width:100px;" name="" value="业务类型简述" onclick="javascript:window.open('../utils/qylxDesc.jsp','','dialogWidth:600px;dialogHeight:400px;center:1;status:0;scrollbars=yes')" onmouseover="this.className='mouseover'" onmouseout="this.className='button'"/>
	</td>
   <td>请选择申请名称的类别。<!-- <input type="button" value="说明" onclick="showTxsm('txsm/ywlx_smxx.jsp')"> --></td>
  </tr>
  <tr>
    <td>冠名类型 <font color="red">*</font></td>
    <td>
	<select id="NAMETYPE" name="NAMETYPE" disblank title="冠名类型" onchange="ENTCHANGE()">		
		<option value="2">冠市名</option>
		<option value="1">冠区县名（含县级市）</option>				
	</select>
	</td>
    <td>
   
		目前只支持冠市名、冠区县名。冠市名指的是以<%=gsm%>开头的名称。
		<br/>其余的请选择冠区县名。如果要办理冠省名业务请到当地的工商大厅或者登录省局网上登记系统办理。
	
    </td>
  </tr>
  <tr>
    <td>拟登记机关 <font color="red">*</font></td>
    <td><select name="PREREGORG" id="PREREGORG" disblank style="width: 200px;" title="拟登记机关">
	<option value="" >请选择拟登记机关</option>
	<%
	String nametype=MCGL_JBXX_SQ.getNAMETYPE();
	String entclass=MCGL_JBXX_SQ.getENTCLASS();
	//个体户及合作社不能选择市局为登记机关
	if(entclass.equals("5") || entclass.equals("6")){
		out.println(icms.getSysDmListByRemark("REGORG","3"));
	}else{
		out.println(icms.getSysDmList("REGORG"));		
	}	
	%>
       </select></td>
 <td>市局只登记注册资本<%=zczbNote %>以上的企业，低于<%=zczbNote %>的请选择分局登记。</td>
  </tr>
  <%--tr>
    <td>行业名称 <font color="red">*</font></td>
    <td><input type="text" id="NAMEIND" name="NAMEIND"  style="width: 200px;" disblank title="行业名称"></td>
    <td>请填写申请名称的行业，如：信息技术。<!-- <input type="button" value="说明" onclick="showTxsm('txsm/hymc_smxx.jsp')"> --></td>
  </tr--%>
  <tr>
    <td>申请字号 <font color="red">*</font></td>
    <td><input type="text" id="ENTTRA" name="ENTTRA" class="zhCheck"  style="width: 200px;"  title="申请字号" disblank disabled="disabled"/>
		<input type="button" value="字号查重" onclick="if(check())zhcc(0)"></td>
    <td>请点击字号查重按钮，选择字号。</td>
  </tr>
  <tr>
    <td>申请名称 <font color="red">*</font></td>
    <td><input type="text" id="ENTNAME" name="ENTNAME"  style="width: 280px;"  title="申请名称" disblank disabled="disabled"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>备选字号1</td>
    <td><input type="text" id="SPANAME1"  class="zhCheck" name="SPANAME1"   style="width: 200px;" disabled="disabled">
    <input type="button" value="字号查重" onclick="if(check())zhcc(1)">
    </td>
    <td>请点击字号查重按钮，选择字号。</td>
  </tr>
  <tr>
    <td>备选申请名称1</td>
    <td><input type="text" id="ENTNAME1" name="ENTNAME1"  style="width: 280px;" disabled="disabled"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>备选字号2</td>
    <td><input type="text" id="SPANAME2" class="zhCheck"  name="SPANAME2" style="width: 200px;" disabled="disabled">
    <input type="button" value="字号查重" onclick="if(check())zhcc(2)">
    </td>
    <td>请点击字号查重按钮，选择字号。</td>
  </tr>
  <tr>
    <td>备选申请名称2</td>
    <td><input type="text" id="ENTNAME2" name="ENTNAME2"  style="width: 280px;" disabled="disabled"></td>
    <td>&nbsp;</td>
  </tr>
  <tr id="tr_31">
    <td>备选字号3</td>
    <td><input type="text" id="SPANAME3" class="zhCheck" name="SPANAME3"  style="width: 200px;" disabled="disabled">
    <input type="button" value="字号查重" onclick="if(check())zhcc(3)">
    </td>
    <td>请点击字号查重按钮，选择字号。</td>
  </tr>
  <tr id="tr_32">
    <td>备选申请名称3</td>
    <td><input type="text" id="ENTNAME3" name="ENTNAME3"  style="width: 280px;" disabled="disabled"></td>
    <td>&nbsp;</td>
  </tr>
</table>
注 ： 以上带 <font color="red">*</font>  必须填写。
<CENTER>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='mcgl_control.jsp'">下一步</div>
<%
}else{
%>
<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">下一步</div>
<%
}
%></CENTER>
</form>
<%@include file="../bottom.inc"%>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe> 
<iframe height="0" width="0" name="hiddenframe" src="" id="hiddenframe"></iframe>
<iframe height="0" width="0" name="hiddenframe1" src="" id="hiddenframe1"></iframe>
</body>
</html>
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.setUserFunction("check()");
	ec.setUserFunction("checkZh()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	//vf.setUserFunction("loadgss()");
	vf.setUserFunction("ENTCHANGE()");
	out.print(vf.ValueDefaultScript());
%>