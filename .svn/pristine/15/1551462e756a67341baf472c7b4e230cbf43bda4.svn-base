<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="MCGL_JBXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ" />
<html>
	<head>
	<%	
		String SIGN = Page.getSIGN();
		String OPENO = Page.getOPENO();
		String ENTCLASS = Page.getENTCLASS();
		String XZQH = webuser.getXZQH();
		MCGL_JBXX.setOPENO(OPENO);
		ArrayList mclist = MCGL_JBXX.getData();
		String zczb_set = icms.getSysDm("VAL_MCGL","DJJG_ZCZB");
		String zczbNote = "";
		if(zczb_set.length()>4){
			zczbNote = zczb_set.substring(0,zczb_set.length() - 4) + "亿";
		}else{
			zczbNote = zczb_set + "万";
		}
	 %>
		<title>基本情况</title>
		<script type="text/javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
		<script type="text/javascript">
		var zczb_set = "<%=zczb_set%>";
		var djjg_level ;
function getJYFWStr(fieldName){
	var jyfwObj = document.getElementById(fieldName);
	var url = "../jyfw/selectJyfw.jsp?fieldName="+fieldName+"&fieldValue="+jyfwObj.value.replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,"");
	var returnValue = window.showModalDialog(url,jyfwObj,"dialogWidth:800px;dialogHeight:700px;center:1;status:0");
	if(returnValue != null&&returnValue!=""){
		jyfwObj.value=returnValue;
		$("textarea[name='BUSSCOPE']").trigger("change");
	}
}
function INITBUSSCOPE(){
	if($("textarea[name='BUSSCOPE']").length>0){
		$("textarea[name='BUSSCOPE']").focus(function(){
			$(this).text($(this).text().replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,""));
		}).change(function(){
			$(this).text($(this).text().replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,"")+"（依法须经批准的项目，经相关部门批准后方可开展经营活动）");
		}).blur(function(){
			$(this).text($(this).text().replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,"")+"（依法须经批准的项目，经相关部门批准后方可开展经营活动）");
		});
	}
}
function getSelDm(id,type){
	var url = "../support/doSelDm.jsp?type="+type;
	var info="dialogHeight:580px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
	var ret = window.showModalDialog(url,"",info);
	if(ret!=undefined){
		var testId=id+"_TEXT"
		document.getElementById(id).value=ret[0];
		document.getElementById(testId).value=ret[1];
		
		if(id=="CONGROCUR"){
			document.getElementById("REGCAPCUR").value=ret[0];
			document.getElementById("REGCAPCUR_TEXT").value=ret[1];
		}
	}
}
function doblurregcap(){
	$.ajax(
			{
				async:false,//提交采用同步方法
				type:"post", 
				data:{"code":$("#PREREGORG").val()},
				dataType: "text",
				url:"getDjjgLevel.action",
				beforeSend:function (XMLHttpRequest) {
				}, 
				success:function (data, textStatus) {
					djjg_level = data;
				}, 
				complete:function (XMLHttpRequest, textStatus) {
				}, 
				error:function () {
						//请求出错处理
						return false;
					alert("系统错误，请稍后重试或联系管理员！");
				}
			}
		);
		var REGCAP =$("#REGCAP").val();
		if($("#REGCAP").length>0){
						
						if(REGCAP!=null&&REGCAP!="")
						{
						   if (fucCheckNUM(REGCAP))
						   {
							 if (Math.abs(REGCAP)>999999999999)
							  {
								alert('注册资本（金）超过系统最大精度！');
								return false;
							  }
						    }else
						    {
							   alert('注册资本（金）应为数字！');
							   return false;
						    }
						}
						if( parseInt(REGCAP) < parseInt(zczb_set) && djjg_level == "2" && ENTCLASS != "8"){
							 //alert('注册资本低于<%--=zczbNote--%>,请选择管辖的分局登记！');
						//	 return false;
						}
					}
					if($("#CONGRO").length>0){
						var CONGRO =$("#CONGRO").val();
						if(CONGRO!=null&&CONGRO!=""){
						   if (fucCheckNUM(CONGRO)){
							 if (Math.abs(CONGRO)>999999999999){
								alert('投资总额超过系统最大精度！');
								return false;
							  }
							  if(parseInt(CONGRO)<parseInt(REGCAP)){
									alert('投资总额不能小于注册资本！');
									return false;
								}
						    }else{
							   alert('投资总额应为数字！');
							   return false;
					    	}
						}
					}
					return true;
}

function writeDOM(){
	if(document.getElementById("PROVINCE")!=null &&document.getElementById("CITY")!==null
			&&document.getElementById("COUNTY")!==null&&document.getElementById("TOWN")!==null
			&&document.getElementById("VILLAGE")!==null&&document.getElementById("HOUSENUMBER")!==null){
	var proSel = document.getElementById("PROVINCE");
	var ctSel =  document.getElementById("CITY");
	var countySel = document.getElementById("COUNTY");
	
	var proText = proSel.options[proSel.selectedIndex].text; 
	var ctText = ctSel.options[ctSel.selectedIndex].text; 
	var countyText = countySel.options[countySel.selectedIndex].text; 
	
	var townm=document.getElementById("TOWN").value;
	var Address="";
	if(townm.indexOf("街道办事处")>0
	||townm.indexOf("办事处")>0
	||townm.indexOf("街道")>0
	){
		Address = proText+ctText+countyText+		
		document.getElementById("VILLAGE").value+
		document.getElementById("HOUSENUMBER").value;
	}else{
		Address = proText+ctText+countyText+
		document.getElementById("TOWN").value+
		document.getElementById("VILLAGE").value+
		document.getElementById("HOUSENUMBER").value;			
	}	
	
	 if(document.getElementById("DOM")!=null){
	 	if(Address.length<=100){
			document.getElementById("DOM").value = Address;
	 	}else{
	 		alert("您输入的地址过长！");
	 	}
		 }
	}
}
function setBusscope()
{
document.form1.BUSSCOPE.value="许可经营项目："+document.form1.ABUITEMCO.value + "一般经营项目："+document.form1.CBUITEM.value;
}
function opfyears(t){
	if(t.checked){
		document.getElementById("OPDATETO").value="长期";
		document.getElementById("year").style.display="none";	
	}else{
		document.getElementById("OPDATETO").value="";
		document.getElementById("year").style.display="";	
	} 	
}
function checkIfCq(){
	if($("#OPDATETO").length>0){
		if(!($("#check1").is(":checked")) && $.trim($("#OPDATETO").val()) == ""){
		alert("请输入营业期限！");
		return false;
		}
	}
	return true;
}
function checkSFZH()
	{		
		return validatezjhm(document.form1.CERNO.value);
	}
function setCounty(){
	$("#COUNTY").val($("select[name='PREREGORG']").val());
}
function setCq(){
	if(document.getElementById("OPDATETO")!=null){
		if(document.getElementById("OPDATETO").value=="长期"||document.getElementById("OPDATETO").value==""){
			document.getElementById("checkboxInput").checked=true;
			document.getElementById("year").style.display="none";
		}	
	}	
}
function cityChange(){
	var CITY=document.form1.CITY.value;
	document.getElementById("hiddenframe").contentWindow.location.href="../support/load.jsp?STYPE=DISCOUS&OBJ=parent.form1.COUNTY&SREAMRK="+CITY;
}

function doSub(){
	if(form1errorCheck()){
		document.getElementById("subid").disabled=true;
		document.getElementById("waitdiv").style.display="";
		document.form1.submit();
	}
}
</script>
	</head>
	<body>
		<%@include file="../top.inc"%>
		<%
			String pageheader = Page.pageheader(request.getRequestURI());
			out.println(pageheader);
		%>
		<form name="form1" method="POST" action='mcgl_jbxx_action.jsp'
			target="editframe">
			<input type="hidden" name="OPENO" value="<%=MCGL_JBXX.getOPENO()%>">
			<input type="hidden" name="OPETYPE" value="10">
			<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>">
			<input type="hidden" name="APPDATE">
			<input type="hidden" name="NAMESTATUS"
				value="<%=MCGL_JBXX.getNAMESTATUS()%>">
			<input type="hidden" name="PRIPID" value="<%=MCGL_JBXX.getPRIPID()%>">

			<input type="hidden" name="ENTCLASS"
				value="<%=MCGL_JBXX.getENTCLASS()%>">
			<input type="hidden" name="NAMETYPE"
				value="<%=MCGL_JBXX.getNAMETYPE()%>">
			<%--input type="hidden" name="PREREGORG" value="<%=MCGL_JBXX.getPREREGORG() %>"--%>

			<input type="hidden" name="POSITION">
			<input type="hidden" name="APPRAUTH"
				value="<%=MCGL_JBXX.getAPPRAUTH()%>">
			<input type="hidden" name="NAMEIND"
				value="<%=MCGL_JBXX.getNAMEIND()%>">
			<input type="hidden" name="APPRNO" value="<%=MCGL_JBXX.getAPPRNO()%>">
			<input type="hidden" name="APDATE" value="<%=MCGL_JBXX.getAPDATE()%>">
			<input type="hidden" name="CDDL" value="0">
			<input type="hidden" name="NAMEIND"
				value="<%=MCGL_JBXX.getNAMEIND()%>">
			<input type="hidden" name="TRAMARK"
				value="<%=MCGL_JBXX.getTRAMARK()%>">

			<input type="hidden" name="ENTTRA" value="<%=MCGL_JBXX.getENTTRA()%>">
			<input type="hidden" name="TRADPINY"
				value="<%=MCGL_JBXX.getTRADPINY()%>">
			<input type="hidden" name="ENTNAMEPINY"
				value="<%=MCGL_JBXX.getENTNAMEPINY()%>">
			<input type="hidden" name="TRADPINY1"
				value="<%=MCGL_JBXX.getTRADPINY1()%>">
			<input type="hidden" name="TRADPINY2"
				value="<%=MCGL_JBXX.getTRADPINY2()%>">
			<input type="hidden" name="TRADPINY3"
				value="<%=MCGL_JBXX.getTRADPINY3()%>">
			<input type="hidden" name="SPANAME1"
				value="<%=MCGL_JBXX.getSPANAME1()%>">
			<input type="hidden" name="SPANAME2"
				value="<%=MCGL_JBXX.getSPANAME2()%>">
			<input type="hidden" name="SPANAME3"
				value="<%=MCGL_JBXX.getSPANAME3()%>">
			<input type="hidden" name="INDUSTRYPHY"
				value="<%=MCGL_JBXX.getINDUSTRYPHY()%>">
			<input type="hidden" name="INDUSTRYCO"
				value="<%=MCGL_JBXX.getINDUSTRYCO()%>">
			<%
				if (ENTCLASS.equals("1") || ENTCLASS.equals("2")) {
			%>
			<%@ include file="../public/mcgl_nz_jbxx.inc"%>
			<%
				} else if (ENTCLASS.equals("8")) {
			%>
			<%@ include file="../public/mcgl_wz_jbxx.inc"%>
			<%
				} else if (ENTCLASS.equals("6")) {
			%>
			<%@ include file="../public/mcgl_hzs_jbxx.inc"%>
			<%
				} else if (ENTCLASS.equals("5")) {
			%>
			<%@ include file="../public/mcgl_gt_jbxx.inc"%>
			<%
				}
			%>
			<br>
			<CENTER>
			 <div id="waitdiv" style="display:none"><img src="../images/blue-loading.gif">
				<br/>
				数据查询中，请等待...<br/>&nbsp;
  			 </div>
				<%
					if (SIGN.equals("1")) {
				%>
				<div class="subImgs"
					onclick="window.location.href='<%=Page.getNextPage()[0]%>'">
					下一页
				</div>
				<%
					} else {
				%>
				<div class="subImgs" id="subid" onclick="doSub()">
					下一页
				</div>
				<%
					}
				%>
			</CENTER>
		</form>
		<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
		<iframe height="0" width="0" name="hiddenframe" src="" id="hiddenframe"></iframe>
		<%@include file="../bottom.inc"%>
	</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	ec.setUserFunction("checkIfCq()");
	ec.setUserFunction("doblurregcap()");
	//ec.setUserFunction("setBusscope()");
	if (ENTCLASS.equals("5")) {
		ec.setUserFunction("checkSFZH()");
	}
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf = new ValueDefault();
	vf.setFormName("form1");
	vf.setData(mclist);
	
	vf.setFormData("CONGROCUR_TEXT", icms.getSysDm("CURRENCY",
			MCGL_JBXX.getCONGROCUR()));
	vf.setFormData("REGCAPCUR_TEXT", icms.getSysDm("CURRENCY",
			MCGL_JBXX.getREGCAPCUR()));
	vf.setUserFunction("writeDOM()");
	vf.setUserFunction("INITBUSSCOPE()");
	vf.setUserFunction("setCq()");
	if(MCGL_JBXX.getDOM().equals("")){
		vf.setUserFunction("setCounty()");
	}
	
	out.print(vf.ValueDefaultScript());
%>
<script type="text/javascript">
	var ENTCLASS = "<%=ENTCLASS%>";
	<%
		if (SIGN.equals("1")) {
	%>
	$(":text").attr("disabled","disabled");
	$("select").attr("disabled","disabled");
	$("radio").attr("disabled","disabled");
	<%
		}
	%>
</script>