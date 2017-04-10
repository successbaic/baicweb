<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="SYS_DMDZ" scope="page"  class="com.macrosoft.icms.util.SYS_DMDZ"/>
	
<html>
	<head>
		<title>选择企业类型</title>
		<style type="text/css">
#Layer2 {
	position: absolute;
	width: 100%;
	display: none;
	height: 0px;
	background-color: #DAE9F3;
	border: 1px solid #DEF;
	filter: Alpha(Opacity=0);
	opacity: 0;
	z-index: 999;
}

#nomenu {
	background-image: url(images/main/currpostitleBG.jpg);
	background-repeat: repeat-x;
	height: 27px;
}

.inp_L3 {
	width: 70px;
	height: 22px;
	background-position: -4px -55px;
	border: 0;
	line-height: 23px;
	background: url(images/main/default_button.png) no-repeat
}

.inp_L4 {
	width: 70px;
	height: 22px;
	background-position: -4px -80px;
	border: 0;
	line-height: 23px;
	background: url(images/main/select_button.png) no-repeat
}
</style>
	</head>
	<%
		//String CDDL = SysUtility.doPreProcess(request.getParameter("CDDL"));
		//String OPETYPE = SysUtility.doPreProcess(request
		//		.getParameter("OPETYPE"));
		String OPENO = SysUtility.doPreProcess(request
				.getParameter("OPENO"));
		//String SIGN = SysUtility.doPreProcess(request.getParameter("SIGN"));
		String MCID = "";
		String ENTTYPE = "";
		String ENTCLASS = "";
		String ENTNAME = "";
		String IFELEC ="";
		String PREREGORG="";
		if (OPENO.equals("")) {
			OPENO = Page.getOPENO();
		}
		if (!OPENO.equals("") && Page.getENTNAME().equals("")) {
			QYDJ_JBXX_SQ jbxx = new QYDJ_JBXX_SQ();
			jbxx.setOPENO(OPENO);
			jbxx.doSelect();
			Page.setMCXH(jbxx.getMCXH());
			Page.setXGBH(jbxx.getSPANAME());
			Page.setENTNAME(jbxx.getENTNAME());
			Page.setENTCLASS(jbxx.getENTCLASS());
			Page.setPRIPID(jbxx.getPRIPID());
			Page.setIFELEC(jbxx.getIFELEC());
			Page.setPREREGORG(jbxx.getREGORG());

			Page.setENTTYPE(icms.getSysRemark("ENTTYPE", jbxx
							.getENTTYPE()));		
		}
	//	if (!OPENO.equals("")) {
	//		QYDJ_JBXX_SQ jbxx = new QYDJ_JBXX_SQ();
	//		jbxx.setOPENO(OPENO);
	//		jbxx.doSelect();
	//		IFELEC = jbxx.getIFELEC();
	//	}
		MCID = Page.getXGBH();
		ENTTYPE = Page.getENTTYPE();
		ENTCLASS = Page.getENTCLASS();
		ENTNAME = Page.getENTNAME();
		IFELEC= Page.getIFELEC();
		PREREGORG= Page.getPREREGORG();
		boolean isSJ = icms.isSJ();
		
		boolean needMCYH = false;
		String XZQH=webuser.getXZQH();
		//boolean ifDzh=SYS_DMDZ.ifDzh(XZQH);
		String dzhRegorg = icms.getFullElecUnit();
	%>
	<script type="text/javascript">
var isSJ=<%=isSJ%>;
var needMCYH=<%=needMCYH%>;
var ifQcdzh="1";
var dzhRegorg = "<%=dzhRegorg%>";

function ifmc(lx){
	if(lx=="Y"){
		document.getElementById("y_mc").style.display="";
		document.getElementById("n_mc").style.display="none";
		//if(ifDzh){
		//document.getElementById('iffullelec').style.display="none";
    	//document.getElementById('Elecxx').style.display="none";
		//}
    	document.getElementById('preregorg1').value="";
    	document.getElementById('preregorg2').value="";
		//document.getElementById("radio_y_mc").checked="checked";
	}else{
		document.getElementById("y_mc").style.display="none";
		document.getElementById("n_mc").style.display="";	
		//if(ifDzh){
		//document.getElementById('iffullelec').style.display="none";
    	//document.getElementById('Elecxx').style.display="none";
		//}
    	document.getElementById('preregorg1').value="";
    	document.getElementById('preregorg2').value="";
		//n_mc_qylx('NZ');
		//document.getElementById("radio_n_mc").checked="checked";
		//document.getElementById("radio_n_mc_qylx_nz").checked="checked";
	}
}

function IsFullElec(){
	var fullElec = document.getElementById("ifelec_y");
	var noFullElec = document.getElementById("ifelec_n");
	if(fullElec.checked){
		Elecxx.style.setAttribute("display", ""); 
	}
	if(noFullElec.checked){
		Elecxx.style.setAttribute("display", "none"); 
	}
}

function regorgChange(){
    var objS = document.getElementById("preregorg1");
    var preregorg = objS.options[objS.selectedIndex].value;
    if(preregorg==dzhRegorg){
    	document.getElementById('iffullelec').style.display="";
    	document.getElementById("ifelec_n").checked=true;
    	ifQcdzh="2";
    }else{
    	document.getElementById('iffullelec').style.display="none";
    	document.getElementById('Elecxx').style.display="none";
    	document.getElementById("ifelec_n").checked=true;
    }
}

function regorgChange1(){
    var objS = document.getElementById("preregorg2");
    var preregorg = objS.options[objS.selectedIndex].value;
    if(preregorg==dzhRegorg){
    	document.getElementById('iffullelec').style.display="";
    	document.getElementById("ifelec_n").checked=true;
    	ifQcdzh="2";
    }else{
    	document.getElementById('iffullelec').style.display="none";
    	document.getElementById('Elecxx').style.display="none";
    	document.getElementById("ifelec_n").checked=true;
    }
}

function n_mc_qylx(lx){
	if(lx=="NZ"){
		document.getElementById("n_mc_nz").style.display="";
		document.getElementById("n_mc_wz").style.display="none";
		$("#n_mc_sy").hide();
		document.getElementById("GS").checked="checked";
		$("#radio_y_mc").attr("checked","checked");
		$("input[name='radio_mc']").attr("disabled",true);
	}else if(lx=="SY"){
		document.getElementById("n_mc_nz").style.display="none";
		document.getElementById("n_mc_wz").style.display="none";
		$("#n_mc_sy").show();
		document.getElementById("SYGS").checked="checked";
		$("#radio_y_mc").attr("checked","checked");
		$("input[name='radio_mc']").attr("disabled",true);		
	}else if(lx=="WZ"){
		document.getElementById("n_mc_nz").style.display="none";
		document.getElementById("n_mc_wz").style.display="";
		$("#n_mc_sy").hide();
		document.getElementById("WZGS").checked="checked";
		$("#radio_y_mc").attr("checked","checked");
		$("input[name='radio_mc']").attr("disabled",true);		
	}
}
//需要名称预核准的
var needQzh;
if(needMCYH){
	needQzh = ["GS","SYGS","WZGS","NZFGS","NZYY","NZFR","SYFGS","HHQY","HHFZ","GRDZ","GRDZFZ","WZFZ","WZHH","WZHHFZ","WGJY"];
}else{
	needQzh= ["GS","SYGS","WZGS"];
}
$(function(){
	body_load();
	$("input:radio[name='R1']").click(function(){
		var enttypeChecked = $(this).val();
		if($.inArray(enttypeChecked,needQzh)>=0){
			ifmc("Y");
			$("#radio_y_mc").attr("checked","checked");
			$("input[name='radio_mc']").attr("disabled",true);
		}else{
			$("input[name='radio_mc']").attr("disabled",false);
		}
	});
});
function body_load(){
	var OPENO="<%=OPENO%>";
	var ENTTYPE="<%=ENTTYPE%>";
	var MCID="<%=MCID%>";
	var ENTNAME="<%=ENTNAME%>";
	var ENTCLASS="<%=ENTCLASS%>";
	var IFELEC="<%=IFELEC%>";
	var PREREGORG = "<%=PREREGORG%>";
	if(ENTNAME==""){
		ifmc('Y');
		n_mc_qylx("NZ");
		document.getElementById("radio_y_mc").checked="checked";
	}else{
		if(MCID==""){
			document.getElementById("y_mc").style.display="none";
			document.getElementById("n_mc").style.display="";	
			$("#n_mc_sy").hide();
			document.getElementById("radio_n_mc").checked="checked";
			if(ENTCLASS=="8"){
				document.getElementById("n_mc_nz").style.display="none";
				document.getElementById("n_mc_wz").style.display="";
				$("#n_mc_sy").hide();
				document.getElementById("radio_n_mc_qylx_wz").checked=true;
			}else if(ENTCLASS=="1"){
				document.getElementById("n_mc_nz").style.display="";
				document.getElementById("n_mc_wz").style.display="none";
				$("#n_mc_sy").hide();
				document.getElementById("radio_n_mc_qylx_nz").checked=true;
			}else if(ENTCLASS=="2"){
				document.getElementById("n_mc_nz").style.display="none";
				document.getElementById("n_mc_wz").style.display="none";
				$("#n_mc_sy").show();
				document.getElementById("radio_n_mc_qylx_sy").checked=true;
			}else{
				document.getElementById("n_mc_nz").style.display="";
				document.getElementById("n_mc_wz").style.display="none";
				$("#n_mc_sy").hide();
				document.getElementById("radio_n_mc_qylx_nz").checked=true;
			}
			if(ENTTYPE=="FGS"){
				if(ENTCLASS=="1"){
					document.getElementById("NZFGS").checked=true;
				}else{
					document.getElementById("SYFGS").checked=true;
				}
			}else if(ENTTYPE=="GS"){
				if(ENTCLASS=="1"){
					document.getElementById("GS").checked=true;
				}else{
					document.getElementById("SYGS").checked=true;
				}
			}else{
				if(ENTTYPE != ""){
					document.getElementById(ENTTYPE).checked=true;
				}
			}
			var r1=document.getElementsByName("R1");
			var r1_value="";
			
			for(var i=0;i<r1.length;i++){
				if(r1[i].checked){
					r1_value=r1[i].value;
					break;
				}
			}
			document.myform.qyname2.value=ENTNAME;
		    document.getElementById("preregorg2").value=PREREGORG;
		    if(PREREGORG==dzhRegorg){
		    	document.getElementById('iffullelec').style.display="";
		    	ifQcdzh="2";
		    }
		}else{
		    ifmc('Y');
		    $("#radio_y_mc").attr("checked","checked");
			document.myform.mcid.value=MCID;
			document.myform.qyname1.value=ENTNAME;
		    document.getElementById("preregorg1").value=PREREGORG;
		    if(PREREGORG==dzhRegorg){
		    	document.getElementById('iffullelec').style.display="";
		    	ifQcdzh="2";
		    }
		}
	}
	if(IFELEC=="1"){
		document.getElementById("ifelec_y").checked=true;
		document.getElementById("ifagree").checked=true;
	}else if(IFELEC=="0"){
		document.getElementById("ifelec_n").checked=true;
	}

  
	if(OPENO!=""){
		var a=document.getElementsByTagName("input");
		for(var i=0;i<a.length;i++){
			a[i].disabled=true;
		}
	}
}
function doSub(){
	if(ifQcdzh==="2"){
		var ifelec_y = document.getElementById("ifelec_y").checked;
		var ifelec_n = document.getElementById("ifelec_n").checked;
		var ifagree = document.getElementById("ifagree").checked;
	}
	var needchecked = document.getElementById("radio_y_mc").checked;
	var gmlx = $("input:radio[name='gmlx']:checked").val();
	var enttypeChecked = $("input:radio[name='R1']:checked").val();
	if($.inArray(enttypeChecked,needQzh)>=0&&!needchecked){
		var qylxContent = "";
		if(enttypeChecked == "WZGS"){
			qylxContent = "外资公司";
		}else if(enttypeChecked == "GS"){
			qylxContent = "内资公司";
		}else if(enttypeChecked == "SYGS"){
			qylxContent = "私营公司";
		}
		alert(qylxContent + " 必须先取得名称核准通知书！如您还未取得核准名称，请先办理相关的名称核准业务！");
		return;
	}
	if(needchecked){
		if(isSJ){
			if(gmlx != "1"){
				needchecked = false;
			}
		}else{
			if(gmlx == "0"){
				needchecked = false;
			}
		}
	}
	
	if(needchecked){
		if(document.myform.mcid.value==""){
			alert("请录入名称预先核准通知书文号！");return;
		}
		if($.trim(document.myform.mcid.value).length<0){
			alert("名称预先核准通知书文号不应小于4位！");return;
		}
		if(document.myform.qyname1.value==""){
			alert("请录入企业名称！");return;
		}
		document.myform.ENTNAME.value=document.myform.qyname1.value;
		if(document.myform.preregorg1.value==""){
			alert("请选择拟登记机关！");
			return;
		}
		document.myform.PREREGORG.value=document.myform.preregorg1.value;
	}else{
		if(document.getElementById("radio_y_mc").checked){
			if(document.myform.mcid.value==""){
				alert("请录入名称预先核准通知书文号！");return;
			}
			if(document.myform.mcid.value.length<0){
				alert("名称预先核准通知书文号不应小于4位数字！");return;
			}
			if(document.myform.qyname1.value==""){
				alert("请录入企业名称！");return;
			}
			document.myform.ENTNAME.value=document.myform.qyname1.value;
			if(document.myform.preregorg1.value==""){
				alert("请选择拟登记机关！");
				return;
			}
			document.myform.PREREGORG.value=document.myform.preregorg1.value;
		}else{
			if(document.myform.qyname2.value==""){
				alert("请录入企业名称");
				return;
			}else{
				if(!validateZh(document.myform.qyname2.value)){
					alert("名称中不能含有拼音、数字等特殊字符！");
					return;
				}
			}
			document.myform.ENTNAME.value=document.myform.qyname2.value;
			if(document.myform.preregorg2.value==""){
				alert("请选择拟登记机关！");
				return;
			}
			document.myform.PREREGORG.value=document.myform.preregorg2.value;
		}
		
		 //id="radio_n_mc_qylx_nz";
		if(document.getElementById("radio_n_mc_qylx_wz").checked){
			document.myform.ENTCLASS.value="8";
		}else if(document.getElementById("radio_n_mc_qylx_sy").checked){
			document.myform.ENTCLASS.value="2";
		}else if(document.getElementById("radio_n_mc_qylx_nz").checked){
			document.myform.ENTCLASS.value="1";
		}
		
		var r1=document.getElementsByName("R1");
		var r1_value="";
		
		for(var i=0;i<r1.length;i++){
			if(r1[i].checked){
				r1_value=r1[i].value;
				break;
			}
		}
		document.myform.QYLX.value = r1_value;
		if(r1_value=="NZFGS"){
			document.myform.QYLX.value="FGS";
			document.myform.ENTCLASS.value="1";
		}else if(r1_value=="SYFGS"){			
			document.myform.QYLX.value="FGS";
			document.myform.ENTCLASS.value="2";
		}else if(r1_value=="SYGS"){			
			document.myform.QYLX.value="GS";
			document.myform.ENTCLASS.value="2";
		}else{
			document.myform.QYLX.value=r1_value;
		}
		if(r1_value=="NZYY"){
			document.myform.ENTCLASS.value="1";
		}
		if(r1_value=="GRDZFZ"){
			document.myform.ENTCLASS.value="2";
		}
		if(r1_value=="HHFZ"){
			document.myform.ENTCLASS.value="2";
		}

	} 
	
	if(ifQcdzh==="2"){
		if(ifelec_y==false && ifelec_n==false){
			alert("请选择是否全程电子化！");return;
		}
		if(ifelec_y==true && ifagree==false){
			alert("请选择同意以上服务协议条款！");return;
		}
	}
	document.getElementById("subid").disabled=true;
	document.getElementById("waitdiv").style.display="";
	myform.submit();
}
//点击示例图片触发的方法，显示名称核准通知书文号示例
function example(){
   window.showModalDialog("demo/mchztzs.html","","dialogWidth:800px;dialogHeight:600px;center:1;status:0;scrollbars=yes");
}
//校验名称
function validateZh(entname){
	var myReg = /^[\u4e00-\u9fa5]+$/;
		if (!(myReg.test($.trim(entname)))){
			//return false;
		}
		return true;
}
</script>
	<BODY style="margin: 0px">
		<%@include file="top.inc"%>
	
		<%
			StepShow stepShow = new StepShow();
			out.println(stepShow.getStep("1", Page.getDL() + Page.getOPETYPE(),
				Page.getOPENO()));
		%>
		<table width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td class="lc2">
					<font style='font-size: 11pt; color: red; font-weight: bold'>
						&nbsp;&nbsp; 企业设立登记说明： </font>
					<br />
					&nbsp;&nbsp; 一、如果您申请设立的企业类型为公司、非公司企业法人、外资企业、合伙企业、个人独资企业；
					需要办理前置许可的分公司、分支机构以及法律法规规定的其它需要办理名称预先核准的， 请先去工商局办理名称预先核准登记。
					<br />
					&nbsp;&nbsp; 二、如果您已经取得名称预先核准通知书，请在
					<strong>【是否已取得名称核准通知书】</strong>一栏中点击
					<font color='red' style='font-size: 15px;'><strong>是</strong>
					</font>。
					<br />
					&nbsp;&nbsp; 三、如果您申请设立的企业类型为分公司、分支机构、外国(地区)企业常驻代表机构等，
					并且不需要办理前置许可的，请在
					<strong>【是否已取得名称核准通知书】</strong> 一栏中点击
					<font color='red' style='font-size: 15px;'><strong>否。</strong>
					</font>
					<br>
					&nbsp;&nbsp; 四、名称预先核准通知书文号：新系统申请的文号如（临）登记内名预核字[2011]第01xxx6号，只要填写01xxx6即可;其他老系统申请的文号请全部输入。
					<br>
					&nbsp;&nbsp; 五、市工商局目前不登记分公司（外资分支除外）。
				</td>
			</tr>
		</table>
		<FORM NAME="myform" METHOD="POST" ACTION="web/sl_select_action.jsp" target="editframe">
			<input type="hidden" name="DL" value="QY">
			<input type="hidden" name="ENTCLASS">
			<input type="hidden" name="QYLX">
			<input type="hidden" name="ENTNAME">
			<input type="hidden" name="isCheckMc">
			<input type="hidden" name="PREREGORG">			
			<table border="1" width="100%" cellspacing='0' cellpadding='0'
				align="center" style="border-top-width: 0px">
				<tr>
					<td colspan="3" class="yxsm">
						一、请选择企业类型
					</td>
				</tr>
				<tr>
					<td class="lc1" width="180px">
						企业分类
					</td>
					<td class="lc2">
						<input type="radio" name="radio_n_mc_qylx" id="radio_n_mc_qylx_nz"
							value="1" onClick="n_mc_qylx('NZ')" checked="checked" />
						内资 &nbsp;&nbsp;
						<input type="radio" name="radio_n_mc_qylx" id="radio_n_mc_qylx_sy"
							value="2" onClick="n_mc_qylx('SY')" />
						私营 &nbsp;&nbsp;
						<input type="radio" name="radio_n_mc_qylx" id="radio_n_mc_qylx_wz"
							value="8" onClick="n_mc_qylx('WZ')" />
						外资

					</td>
				</tr>
			</table>
			<table border="1" width="100%" cellspacing='0' cellpadding='0'
				align="center" id="n_mc_nz" style="border-top-width: 0px">
				<tr>
					<td rowspan="3" class="lc1" width="180px">
						内资企业类别
					</td>
					<td class="lc2" style="width: 60px;">
						公司类
					</td>
					<td class="lc2">
						<input type="radio" id="GS" name="R1" class="needQzh" value="GS" />
						内资公司 &nbsp;&nbsp;
						<input type="radio" id="NZFGS" name="R1" value="NZFGS" />
						内资分公司
					</td>
				</tr>
				<tr>
					<td class="lc2" style="width: 60px;">
						非公司类
					</td>
					<td class="lc2">

						<input type="radio" id="NZFR" class="needQzh" name="R1"
							value="NZFR" />
						内资法人 &nbsp;&nbsp;
						<input type="radio" id="NZYY" name="R1" value="NZYY" />
						营业单位
					</td>
				</tr>
				<tr>
					<td class="lc2" colspan="3">
						&nbsp;
					</td>
				</tr>
			</table>
			<table border="1" width="100%" cellspacing='0' cellpadding='0'
				align="center" id="n_mc_sy" style="border-top-width: 0px">
				<tr>
					<td rowspan="3" class="lc1" width="180px">
						私营企业类别
					</td>
					<td class="lc2" style="width: 60px;">
						公司类
					</td>
					<td class="lc2">
						<input type="radio" id="SYGS" name="R1" class="needQzh"
							value="SYGS" />
						私营公司 &nbsp;&nbsp;
						<input type="radio" id="SYFGS" name="R1" value="SYFGS" />
						私营分公司
					</td>
				</tr>
				<tr>
					<td class="lc2" style="width: 60px;">
						合伙企业
					</td>
					<td class="lc2">
						<input type="radio" id="HHQY" class="needQzh" name="R1"
							value="HHQY" />
						合伙企业 &nbsp;&nbsp;
						<input type="radio" id="HHFZ" name="R1" value="HHFZ" />
						合伙企业分支机构
					</td>
				</tr>
				<tr>
					<td class="lc2" style="width: 60px;">
						个人独资
					</td>
					<td class="lc2">
						<input type="radio" id="GRDZ" class="needQzh" name="R1"
							value="GRDZ" />
						个人独资企业 &nbsp;&nbsp;
						<input type="radio" id="GRDZFZ" name="R1" value="GRDZFZ" />
						个人独资企业分支机构
					</td>
				</tr>
			</table>
			<table border="1" width="100%" cellspacing='0' cellpadding='0'
				align="center" id="n_mc_wz" style="border-top-width: 0px">
				<tr>
					<td rowspan="3" class="lc1" width="180px">
						外资企业类别
					</td>
					<td class="lc2" style="width: 60px;">
						公司类
					</td>
					<td class="lc2">
						<input type="radio" name="R1" class="needQzh" id="WZGS"
							value="WZGS" />
						外资公司
						<input type="radio" name="R1" id="WZFZ" value="WZFZ" />
						外资分支结构
					</td>
				</tr>
				<tr>
					<td class="lc2" style="width: 60px;">
						合伙企业
					</td>
					<td class="lc2">
						<input type="radio" name="R1" class="needQzh" id="WZHH"
							value="WZHH" />
						外资合伙企业
						<input type="radio" id="WZHHFZ" name="R1" value="WZHHFZ" />
						外资合伙分支机构
					</td>
				</tr>
				<tr>
					<td class="lc2" style="width: 60px;">
						其它类
					</td>
					<td class="lc2">
						<input type="radio" name="R1" class="needQzh" id="WGDB"
							value="WGDB" />
						外国(地区)企业常驻代表机构
						<input type="radio" name="R1" id="WGJY" value="WGJY" />
						外国(地区)企业在中国境内从事经营活动
					</td>
				</tr>
			</table>
			<table border="1" width="100%" cellspacing='0' cellpadding='0'
				align="center">
				<tr>
					<td colspan="3" class="yxsm">
						二、是否已取得名称预先核准通知书
					</td>
				</tr>
				<tr>
					<td class="lc1" width="180px">
						是否已取得名称预先核准通知书
					</td>
					<td colspan="2" class="lc2">
						<input type="radio" name="radio_mc" id="radio_y_mc"
							checked="checked" value="1" onclick="ifmc('Y')" />
						是 &nbsp;&nbsp;
						<input type="radio" name="radio_mc" id="radio_n_mc" value="2"
							onclick="ifmc('N')" />
						否
					</td>
				</tr>
			</table>
			<div id="y_mc">
				<table border="1" width="100%" cellspacing='0' cellpadding='0'
					align="center" style="border-top-width: 0px">
					<tr>
						<td colspan="3" class="yxsm">
							三、请录入名称信息
						</td>
					</tr>
					<tr>
						<td class="lc1" width="180px">
							冠名类型:
						</td>
						<td colspan="2" class="lc2">
							<%if(!"SHENGJU".equals(ContrInfo.bushumoshi)){ %>	
							<input value="2" type="radio" name="gmlx" id="gmlx_ds"
								checked="checked" />							
							地市(含区县)核名 &nbsp;&nbsp;
							<%} %>
							<input value="1" type="radio" name="gmlx" id="gmlx_sj" />
							
							省局核名 &nbsp;&nbsp;
							<input value="0" type="radio" name="gmlx" id="gmlx_zj" />
							总局核名
						</td>
					</tr>
					<tr>
						<td class="lc1" width="180px">
							名称预先核准通知书文号:
						</td>
						<td colspan="2" class="lc2">
							第
							<input type="text" name="mcid" id="mcid" />
							号
						</td>
					</tr>
					<tr>
						<td class="lc1" width="180px">
							企业名称:
						</td>
						<td colspan="2" class="lc2">
							<input type="text" name="qyname1" id="qyname1" size="40" />
						</td>
					</tr>
					<tr>					
					<td class="lc1" nowrap>拟登记机关</td>   
					<td class="lc2"><select name="preregorg1"  id ="preregorg1"  title="拟设立登记机关" disblank style="width:192px; " onchange="regorgChange()"> 
					<option value="">请选择登记机关</option>
					<%=icms.getBsDjjg(XZQH)%>
					</select>
					</td> 
					</tr>
				</table>
			</div>
			<div id="n_mc">
				<table border="1" width="100%" cellspacing='0' cellpadding='0'
					align="center" style="border-top-width: 0px">
					<tr>
					<tr>
						<td colspan="3" class="yxsm">
							三、请录入企业名称
						</td>
					</tr>
					<tr>
						<td class="lc1" width="80px">
							企业名称:
						</td>
						<td colspan="2" class="lc2">
							<input type="text" name="qyname2" id="qyname2" size="40" />
						</td>
					</tr>
					<tr>					
					<td class="lc1"  width="80px">拟登记机关</td>   
					<td class="lc2"><select name="preregorg2"  id ="preregorg2"  title="拟设立登记机关" disblank style="width:192px; " onchange="regorgChange1()"> 
					<option value="">请选择登记机关</option>
					<%=icms.getBsDjjg(XZQH)%>
					</select>
					</td> 
					</tr>
					<tr>
						<td colspan="3" class="yxsm" width="100%">
							<font color="red" style="font-size: 15px"> <strong>说明:</strong>
							</font> 请准确填写
							<strong>【企业名称】</strong> ,如所填信息不符合要求，业务人员将
							<strong>驳回</strong>&nbsp;申请
						</td>
					</tr>
				</table>
			</div>
			
			<div id="iffullelec" style="display:none;">
				<table border="1" width="100%" cellspacing='0' cellpadding='0'
					align="center" style="border-top-width: 0px">
					<tr>
					<tr>
						<td colspan="3" class="yxsm">
							四、请选择是否全程电子化
						</td>
					</tr>
					<tr>
						<td colspan="3"  style="text-align: center;" width="100%">
							<font color="red" > 无需排队！快速办结！选择全程电子化网上办理登记，方便快捷！是否选择？
							</font>
						</td>
					</tr>
					<tr>
                    <td class="lc1" width="22%">是否全程电子化：</td>
                    <td colspan="2" class="lc2">
	                  <input type="radio" name="ifelec" id="ifelec_y" title="是否全程电子化" value="1"  onclick="IsFullElec()">是
	                 <input type="radio" name="ifelec" id="ifelec_n" title="是否全程电子化" value="0"  checked onclick="IsFullElec()">否
                      <br><font color="red" >提示:<br>(1)潍坊高新区:申请全程电子化企业选“是”，普通申请企业选“否”。<br>(2)非潍坊高新区企业选“否”。<br>(3)如有疑问请拨打潍坊高新区全流程电子化业务咨询电话：<strong>0536-8892525</strong>。</font>
                     </td>
                    </tr>					
				</table>
			</div>
			<br />			
			<div id="Elecxx"  style="display:none; height:200px; overflow:auto;">
              <%@include file="elec_info.jsp"%>
            </div>
            
			<CENTER>
			  <div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
			  <br/>
			  数据查询中，请等待...<br/>&nbsp;
			  </div>
				<%
					if (!OPENO.equals("")) {
				%>
				<div class="subImgs" onclick="window.location.href='wsdj_tbxx.jsp'">
					下一步
				</div>
				<%
					} else {
				%>
				<div class="subImgs" id="subid" onclick="doSub()">
					下一步
				</div>
				<%
					}
				%>

			</CENTER>
		</form>

		<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
		<%@include file="bottom.inc"%>
	</body>
</html>