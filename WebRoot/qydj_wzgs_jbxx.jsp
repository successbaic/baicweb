<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_JBXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<html>
<head>
<title>基本情况</title>
<script type="text/javascript">
function getSelDm(id,type,otherId){
	var url = "support/doSelDm.jsp?type="+type;
	var info="dialogHeight:580px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
	var ret = window.showModalDialog(url,"",info);
	if(ret!=undefined){
		var testId=id+"_TEXT"
		document.getElementById(id).value=ret[0];
		document.getElementById(testId).value=ret[1];	
		
		if(otherId!=undefined && otherId!=null && otherId!=""){
			document.getElementById(otherId).value=ret[0];
			document.getElementById(otherId+"_TEXT").value=ret[1];	
		}
	}
}
//获取企业地址
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
		document.getElementById("DOM").value = Address;
		 }
	}
}

function writePROLOC(){
	if(document.getElementById("PROPROVINCE")!=null &&document.getElementById("PROCITY")!==null
			&&document.getElementById("PROCOUNTY")!==null&&document.getElementById("PROTOWN")!==null
			&&document.getElementById("PROVILLAGE")!==null&&document.getElementById("PROHOUSENUMBER")!==null){
	var proSel = document.getElementById("PROPROVINCE");
	var ctSel =  document.getElementById("PROCITY");
	var countySel = document.getElementById("PROCOUNTY");
	
	var proText = proSel.options[proSel.selectedIndex].text; 
	var ctText = ctSel.options[ctSel.selectedIndex].text; 
	var countyText = countySel.options[countySel.selectedIndex].text; 
	
	var townm=document.getElementById("PROTOWN").value;
	var Address="";
	if(townm.indexOf("街道办事处")>0
	||townm.indexOf("办事处")>0
	||townm.indexOf("街道")>0
	){
		Address = proText+ctText+countyText+		
		document.getElementById("PROVILLAGE").value+
		document.getElementById("PROHOUSENUMBER").value;
	}else{
		Address = proText+ctText+countyText+
		document.getElementById("PROTOWN").value+
		document.getElementById("PROVILLAGE").value+
		document.getElementById("PROHOUSENUMBER").value;			
	}	
	 if(document.getElementById("PROLOC")!=null){
		document.getElementById("PROLOC").value = Address;
		 }
	}
}
function tqdw(){
	if($("#tqdw").length>0){
		$("#tqdw").click(function(){
		var SUPREGNO = $.trim($("#SUPREGNO").val());
		if(SUPREGNO == ""){
			alert("请填写注册号！");
			return;
		}
		$.ajax(
			{
				async:false,//提交采用同步方法
				type:"post", 
				data:{"SUPREGNO":SUPREGNO},
				dataType: "json",
					 //method:getGSS,
					 //contentType:"application/json",
				url:"tqdw.action",
				beforeSend:function (XMLHttpRequest) {
				}, 
				success:function (data, textStatus) {
				if(data == null){
					alert("未找到企业信息，请确认注册号填写是否正确！");
				}else{
					$("#SUPENTNAME").val(data.SUPENTNAME);
					$("#SUPREGORG").val(data.SUPREGORG);
					$("#ECOCHR").val(data.ECOCHR);
					$("#FORENTOPFROM").val(data.FORENTOPFROM);
					$("#FORENTOPTO").val(data.FORENTOPTO);
				}
				}, 
				complete:function (XMLHttpRequest, textStatus) {
				}, 
				error:function () {
						//请求出错处理
					alert("系统错误，请稍后重试或联系管理员！");
				}
				}
			);
		});
	}
}
function regorgChange(){
		if($("select[name='REGORG']").val() == $("select[name='OPELOCDISTRICT']").val()){
			///$("select[name='OPELOCDISTRICT']").attr("disabled",true);
		}else{
			$("select[name='OPELOCDISTRICT']").attr("disabled",false);
		}
		$("select[name='REGORG']").change(function(){
			var OPELOCDISTRICT_OLD = $("select[name='OPELOCDISTRICT']").val();
			$("select[name='OPELOCDISTRICT']").val($(this).val());
			var OPELOCDISTRICT_NEW = $("select[name='OPELOCDISTRICT']").val();
			if(OPELOCDISTRICT_NEW == OPELOCDISTRICT_OLD){
				$("select[name='OPELOCDISTRICT']").val("");
				$("select[name='OPELOCDISTRICT']").attr("disabled",false);
			}else{
				//$("select[name='OPELOCDISTRICT']").attr("disabled",true);
			}
		});
	}
	
function cityChange(){
	var CITY=document.form1.CITY.value;
	document.getElementById("hiddenframe").contentWindow.location.href="support/load.jsp?STYPE=DISCOUS&OBJ=parent.form1.COUNTY&SREAMRK="+CITY;
}	
function procityChange(){
	var PROCITY=document.form1.PROCITY.value;
	document.getElementById("hiddenframe").contentWindow.location.href="support/load.jsp?STYPE=DISCOUS&OBJ=parent.form1.PROCOUNTY&SREAMRK="+PROCITY;
}
</script>
</head>
<body bgcolor="#eefbf7" style="margin-top:0;margin-bottom:0">
<%@include file="top.inc"%>
<%	
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String SIGN = Page.getSIGN();	//-1数据未保存,1已开业
	String OPENO =Page.getOPENO();	
	String OPETYPE =Page.getOPETYPE();
	String MCXH=Page.getMCXH();
	String MCID=Page.getXGBH();
	String PRIPID=Page.getPRIPID();
	if(PRIPID.equals("")){
		//PRIPID=MCXH;
	}
	String XZQH=webuser.getXZQH();
	ArrayList qydjList=new ArrayList();
	if (!OPENO.equals("")) {
		QYDJ_JBXX.setOPENO(OPENO);
		qydjList=QYDJ_JBXX.getData();
	}
	
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	
	if (OPENO.equals(""))	
	{
	   if(MCXH==null || MCXH.equals("")){
	 		vf.setFormData("ENTNAME",Page.getENTNAME());
	   		vf.setFormData("ENTCLASS",Page.getENTCLASS());  
	   }else{
		    String gmlx=Page.getGMLX();
			if("1".equals(gmlx)){
				MCGL_JBXX_ZS.doSelectBySqlSJ("SELECT * FROM MCGL_JBXX_ZS WHERE NAMEID='"+ MCXH + "'");
				vf.setFormData("IFPROVINCENAME", "1");
			}else{
				MCGL_JBXX_ZS.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE NAMEID='"+ MCXH + "'");
			}
		   
		   String entc=MCGL_JBXX_ZS.getENTCAT();
		  
		   vf.setFormData("ENTCLASS",entc);
		   if(!"".equals(MCGL_JBXX_ZS.getAPPRNO())){
				vf.setFormData("NAMEAPPNO", MCGL_JBXX_ZS.getAPPRNO());
			}
			vf.setFormData("PRIPID", MCGL_JBXX_ZS.getPRIPID());
		   vf.setFormData("CBUITEM",MCGL_JBXX_ZS.getCBUITEM());
		   vf.setFormData("COUNTRY",MCGL_JBXX_ZS.getCOUNTRY());
		   vf.setFormData("COUNTRY_TEXT",icms.getSysDm("COUNTRY",MCGL_JBXX_ZS.getCOUNTRY()));
		   vf.setFormData("REGCAPUSD",MCGL_JBXX_ZS.getREGCAPUSD());
		   vf.setFormData("REGCAPCUR",MCGL_JBXX_ZS.getREGCAPCUR());
		   vf.setFormData("REGCAPCUR_TEXT",icms.getSysDm("CURRENCY",MCGL_JBXX_ZS.getREGCAPCUR()));
		   //vf.setFormData("RECCAPCUR_TEXT",icms.getSysDm("CURRENCY",MCGL_JBXX_ZS.getRECCAPCUR()));
		   vf.setFormData("REGCAP",MCGL_JBXX_ZS.getREGCAP());
		   vf.setFormData("CONGROUSD",MCGL_JBXX_ZS.getCONGROUSD());
		   vf.setFormData("CONGROCUR",MCGL_JBXX_ZS.getCONGROCUR());
		   vf.setFormData("CONGROCUR_TEXT",icms.getSysDm("CURRENCY",MCGL_JBXX_ZS.getCONGROCUR()));
		   
		   vf.setFormData("CONGRO",MCGL_JBXX_ZS.getCONGRO());
		   vf.setFormData("BUSSCOPE",MCGL_JBXX_ZS.getBUSSCOPE());
		   vf.setFormData("DOM",MCGL_JBXX_ZS.getDOM());
		   vf.setFormData("ENTTYPE",MCGL_JBXX_ZS.getENTTYPE());
		   vf.setFormData("ENTNAME",MCGL_JBXX_ZS.getENTNAME());
		   vf.setFormData("REGORG",MCGL_JBXX_ZS.getPREREGORG());
		   if(!MCGL_JBXX_ZS.getPREREGORG().equals(XZQH) && !MCGL_JBXX_ZS.getPREREGORG().equals(icms.getCURRENTUNIT())&& !MCGL_JBXX_ZS.getPREREGORG().endsWith("0000")){
				vf.setFormData("OPELOCDISTRICT", MCGL_JBXX_ZS.getPREREGORG());
			}
		   vf.setFormData("ABUITEMCO",MCGL_JBXX_ZS.getABUITEMCO());
		   vf.setFormData("INDUSTRYPHY",MCGL_JBXX_ZS.getINDUSTRYPHY());
		   vf.setFormData("INDUSTRYCO",MCGL_JBXX_ZS.getINDUSTRYCO());
		   if(!MCGL_JBXX_ZS.getCITY().equals("")){
				vf.setFormData("CITY", MCGL_JBXX_ZS.getCITY());
				QYDJ_JBXX.setCITY(MCGL_JBXX_ZS.getCITY());//首次进入页面时单独赋值CITY，
			}
			if(!MCGL_JBXX_ZS.getCOUNTY().equals("")){
				vf.setFormData("COUNTY", MCGL_JBXX_ZS.getCOUNTY());
			}
		   vf.setFormData("TOWN",MCGL_JBXX_ZS.getSTREET());
		   vf.setFormData("VILLAGE",MCGL_JBXX_ZS.getROAD());
		   vf.setFormData("HOUSENUMBER",MCGL_JBXX_ZS.getDOORPLATE());
		   //vf.setFormData("CBUITEM",GSGSJIN_BASIS02.getFIELD067());
		   //vf.setFormData("COUNTRY",GSGSJIN_BASIS02.getFIELD016());
		   //vf.setFormData("REGCAPUSD",GSGSJIN_BASIS02.getFIELD221());
		   //vf.setFormData("REGCAPCUR",GSGSJIN_BASIS02.getFIELD050());
		   //vf.setFormData("REGCAP",GSGSJIN_BASIS02.getFIELD049());
		   //vf.setFormData("CONGROUSD",GSGSJIN_BASIS02.getFIELD218());
		   //vf.setFormData("CONGROCUR",GSGSJIN_BASIS02.getFIELD047());
		   //vf.setFormData("CONGRO",GSGSJIN_BASIS02.getFIELD046());
		  // vf.setFormData("BUSSCOPE",GSGSJIN_BASIS02.getFIELD067());
		  // vf.setFormData("DOM",GSGSJIN_BASIS02.getFIELD033());
		   //vf.setFormData("ENTTYPE",GSGSJIN_BASIS02.getFIELD020());
		   //vf.setFormData("ENTNAME",GSGSJIN_BASIS02.getFIELD009());
		   //vf.setFormData("REGORG",GSGSJIN_BASIS02.getFIELD104());
		   //vf.setFormData("ABUITEMCO",GSGSJIN_BASIS02.getFIELD261());
		   //vf.setFormData("REGCAPCUR",GSGSJIN_BASIS02.getFIELD242());
		}		   
	}
	else 
	{
		vf.setData(qydjList);
		vf.setFormData("COUNTRY_TEXT",icms.getSysDm("COUNTRY",QYDJ_JBXX.getCOUNTRY()));
		vf.setFormData("RECCAPCUR_TEXT",icms.getSysDm("CURRENCY",QYDJ_JBXX.getRECCAPCUR()));
		vf.setFormData("REGCAPCUR_TEXT",icms.getSysDm("CURRENCY",QYDJ_JBXX.getREGCAPCUR()));
		vf.setFormData("CONGROCUR_TEXT",icms.getSysDm("CURRENCY",QYDJ_JBXX.getCONGROCUR()));
	}
%> 
<form name="form1" method="POST" action='web/qydj_gs_jbxx_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="MCXH" value=<%=MCXH%>>
<input type="hidden" name="PRIPID" value=<%=PRIPID%>>
<input type="hidden" name="SPANAME" value=<%=MCID%>>
<input type="hidden" name="OPETYPE" value=<%=OPETYPE%>>
<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>">
<input type="hidden" name="APPDATE" value="<%=webuser.getCurrentDate()%>">
<input type="hidden" name="STATUS">
<input type="hidden" name="ENTCLASS" value="8">
<input type="hidden" name="INDUSTRYPHY">
<input type="hidden" name="INDUSTRYCO">
<input type="hidden" name="CDDL" value="1">
<input type="hidden" name="NAMEAPPNO" value="<%=Page.getAPPRNO() %>">
<input type="hidden" name="IFPROVINCENAME">
<%String sENTTYPE=Page.getENTTYPE();
  if(sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WZQY"))
  {%>
    <%@include file="public/qydj_wzgs_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("WZFZ"))
  {%>
    <%@include file="public/qydj_wzfz_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("WGDB"))
  {%>
    <%@include file="public/qydj_wgdb_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("WZFR")){ %>
    <%@include file="public/qydj_wzfr_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("WGJY"))
  {%>
    <%@include file="public/qydj_wgjy_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("WZHH")){%>
    <%@include file="public/qydj_wzhh_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("WZHHFZ")){ %>
    <%@include file="public/qydj_wzhhfz_jbxx.inc" %>
<%} %>
<br>
<CENTER>
  <div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
  <br/>
      数据查询中，请等待...<br/>&nbsp;
 </div>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" id="subid" onclick="if(form1errorCheck()){document.getElementById('subid').disabled=true;parent.document.getElementById('waitdiv').style.display='';document.form1.submit();}">下一页</div>
<%
}
%>
</CENTER>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
<iframe height="0" width="0" name="hiddenframe" src="" id="hiddenframe"></iframe>
<%@include file="bottom.inc"%>
</body>  
</html> 
<script type="text/javascript">
/*
获得经营范围
*/
var ENTTYPE = "<%=sENTTYPE%>";
function getJYFWStr(fieldName){
	var jyfwObj = document.getElementById(fieldName);
	var url = "jyfw/selectJyfw.jsp?fieldName="+fieldName+"&fieldValue="+jyfwObj.value.replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,"");
	var returnValue = window.showModalDialog(url,jyfwObj,"dialogWidth:800px;dialogHeight:700px;center:1;status:0");
	if(returnValue != null&&returnValue!=""){
		jyfwObj.value=returnValue;
		$("textarea[name='BUSSCOPE']").trigger("change");
	}
}
function INITBUSSCOPE(){
	if($("textarea[name='BUSSCOPE']").length>0){
		if(ENTTYPE != "WGDB"){
			$("textarea[name='BUSSCOPE']").focus(function(){
				$(this).text($(this).text().replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,""));
			}).change(function(){
				$(this).text($(this).text().replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,"")+"（依法须经批准的项目，经相关部门批准后方可开展经营活动）");
			}).blur(function(){
				$(this).text($(this).text().replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,"")+"（依法须经批准的项目，经相关部门批准后方可开展经营活动）");
			});
		}
	}
}
function RegorgDis(){
	var MCXH=document.form1.MCXH.value;
	var REGORG=document.form1.REGORG.value;
	if(MCXH!="" && REGORG!=""){
		document.form1.REGORG.disabled=true;
	}
}
//经营期限，长期或者年
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
	if(document.getElementById("OPDATETO")!=null){
		if(document.getElementById("OPDATETO").value=="长期"||document.getElementById("OPDATETO").value==""){
			document.getElementById("checkboxInput").checked=true;
			document.getElementById("year").style.display="none";
		}	
	}	
}
function checkOPTO(){
	var OPFROM = new Date($("#OPFROM").val().replace(/\-/g,'/')).getFullYear();
	var OPTO = new Date($("#OPTO").val().replace(/\-/g,'/')).getFullYear();
	if(OPTO - OPFROM >20){
		alert("外国代表机构的经营期限不能超过20年!");
		return false;
	}else{
		return true;
	}
	
}
</script>
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.setUserFunction("checkSub()");
	ec.FormErrorCheck();
	if("WGDB".equals(sENTTYPE)){
		ec.setUserFunction("checkOPTO()");
	}
	out.print(ec.ErrorCheckScript());
%>
<%       
	
	vf.setUserFunction("RegorgDis()");
	vf.setUserFunction("checkIfCq()");
	vf.setUserFunction("tqdw()");
	if(!"WGDB".equals(sENTTYPE)){
		vf.setUserFunction("INITBUSSCOPE()");
	}
	//vf.setUserFunction("regorgChange()");
	out.print(vf.ValueDefaultScript());
%>