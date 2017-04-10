<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_JBXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<html>
<head>
<title>基本情况</title>
<script language='javascript'>
/*
获得经营范围
*/
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
		$("textarea[name='BUSSCOPE']").focus(function(){
			$(this).text($(this).text().replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,""));
		}).change(function(){
			$(this).text($(this).text().replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,"")+"（依法须经批准的项目，经相关部门批准后方可开展经营活动）");
		}).blur(function(){
			$(this).text($(this).text().replace(/（依法须经批准的项目，经相关部门批准后方可开展经营活动）/g,"")+"（依法须经批准的项目，经相关部门批准后方可开展经营活动）");
		});
	}
}
function RegorgDis(){
	var MCXH=document.form1.MCXH.value;
	var REGORG=document.form1.REGORG.value;
	if(MCXH!="" && REGORG!=""){
		document.form1.REGORG.disabled=true;
	}
}
function loadgss()   
{
	if($("select[name='LOCALADM']").length > 0){
		if(document.form1.REGORG!=null){
		var dqdm=document.form1.REGORG.value;
		document.getElementById("hiddenframe").contentWindow.location.href="support/gssload.jsp?STYPE=GSS&OBJ=parent.form1.LOCALADM&SREAMRK="+dqdm;
		}
	}
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
function regorgChange(){
	/*$("select[name='OPELOCDISTRICT']").val($("select[name='REGORG']").val());
	if($("select[name='REGORG']").val() == $("select[name='OPELOCDISTRICT']").val()){
		$("select[name='OPELOCDISTRICT']").attr("disabled",true);
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
			$("select[name='OPELOCDISTRICT']").attr("disabled",true);
		}
		if($("select[name='LOCALADM']").length > 0){
			loadgss();
		}
	});*/	
}
function init(){
	/*$("#COUNTY").change(function(){
		$("#REGORG").val($(this).val()).trigger("change");
		
	});*/
}
function changeCy(){
	$(".cyClass").change(function(){
		var MEMNUM = parseInt($("#MEMNUM").val());//成员总数
		var PEAMEMNUM = parseInt($("#PEAMEMNUM").val());//农民成员总数
		var PEAMEMRATE = $("#PEAMEMRATE").val();//农民成员比例
		var GROMEMNUM = parseInt($("#GROMEMNUM").val());//企业、事业单位或社会团体成员总数"
		var GROMEMRATE = $("#GROMEMRATE").val();//企业、事业单位或社会团体成员所占比例
		var total = PEAMEMNUM + GROMEMNUM;
		if(total > MEMNUM){
			alert("农民成员总数与非农民成员总数之和不能大于成员总数!");
			$(this).val("");
		}else{
			if(isNaN(MEMNUM)){
			
			}else{
				if($(this).attr("id") == "MEMNUM"){
					if(!isNaN(PEAMEMNUM)){
						$("#PEAMEMRATE").val((Math.round(PEAMEMNUM*100)/MEMNUM).toFixed(1));
					}
					if(!isNaN(GROMEMNUM)){
						$("#GROMEMRATE").val((Math.round(GROMEMNUM*100)/MEMNUM).toFixed(1));
					}
				}else if($(this).attr("id") == "PEAMEMNUM"){
					if(!isNaN(PEAMEMNUM)){
						$("#PEAMEMRATE").val((Math.round(PEAMEMNUM*100)/MEMNUM).toFixed(1));
					}
				}else if($(this).attr("id") == "GROMEMNUM"){
					if(!isNaN(GROMEMNUM)){
						$("#GROMEMRATE").val((Math.round(GROMEMNUM*100)/MEMNUM).toFixed(1));
					}
				}
			}
		}
	});
}
function checkCySub(){
	var MEMNUM = parseInt($("#MEMNUM").val());//成员总数
	var PEAMEMNUM = parseInt($("#PEAMEMNUM").val());//农民成员总数
	var GROMEMNUM = parseInt($("#GROMEMNUM").val());//企业、事业单位或社会团体成员总数"
	var total = PEAMEMNUM + GROMEMNUM;
	if(total != MEMNUM){
		alert("农民成员总数与非农民成员总数之和应该等于成员总数!");
		return false;
	}else{
		return true;
	}
}
function doSub(){
	if(form1errorCheck()){
		if(document.getElementById('REGORG').value==""){
			alert("请录入登记机关");
			return;
		}
		//管辖单位自动默认
		document.getElementById('OPELOCDISTRICT').value=document.getElementById('REGORG').value;
		document.getElementById('subid').disabled=true;
		document.getElementById('waitdiv').style.display='';
		document.form1.submit();
	}
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
<body >
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
		if(Page.getIFELEC()==null){
		    QYDJ_JBXX.doSelect();
			Page.setIFELEC(QYDJ_JBXX.getIFELEC());
			}
	}
	String sENTTYPE=Page.getENTTYPE();
	String ENTTYPE="9100";
	 if(sENTTYPE.equalsIgnoreCase("HZSFZ"))
	  {
	  ENTTYPE="9200";
	  }
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	if (OPENO.equals(""))	
	{
	   if(MCXH==null || MCXH.equals("")){
	 		vf.setFormData("ENTNAME",Page.getENTNAME());
	   		vf.setFormData("ENTCLASS",Page.getENTCLASS());  
	   }else{
		   MCGL_JBXX_ZS.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE NAMEID='"+MCXH+"'");
		   vf.setFormData("ENTCLASS","6");
		   vf.setFormData("PRIPID", MCGL_JBXX_ZS.getPRIPID());
		   vf.setFormData("CBUITEM",MCGL_JBXX_ZS.getCBUITEM());
		   vf.setFormData("COUNTRY",MCGL_JBXX_ZS.getCOUNTRY());
		   vf.setFormData("REGCAPUSD",MCGL_JBXX_ZS.getREGCAPUSD());
		   vf.setFormData("REGCAPCUR",MCGL_JBXX_ZS.getREGCAPCUR());
		   vf.setFormData("REGCAP",MCGL_JBXX_ZS.getREGCAP());
		   vf.setFormData("CONGROUSD",MCGL_JBXX_ZS.getCONGROUSD());
		   vf.setFormData("CONGROCUR",MCGL_JBXX_ZS.getCONGROUSD());
		   vf.setFormData("CONGRO",MCGL_JBXX_ZS.getCONGRO());
		   vf.setFormData("BUSSCOPE",MCGL_JBXX_ZS.getBUSSCOPE());
		   vf.setFormData("DOM",MCGL_JBXX_ZS.getDOM());
		   vf.setFormData("ENTTYPE",ENTTYPE);
		   vf.setFormData("ENTNAME",MCGL_JBXX_ZS.getENTNAME());
		   vf.setFormData("REGORG",MCGL_JBXX_ZS.getPREREGORG());
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
		   if(!"".equals(MCGL_JBXX_ZS.getAPPRNO())){
				vf.setFormData("NAMEAPPNO", MCGL_JBXX_ZS.getAPPRNO());
			}
		}		   
	vf.setUserFunction("init()");
	}
	else 
	{
		vf.setData(qydjList);
	}
%> 
<form name="form1" method="POST" action='web/qydj_gs_jbxx_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value="<%=OPENO%>">
<input type="hidden" name="MCXH" value="<%=MCXH%>">
<input type="hidden" name="PRIPID" value="<%=PRIPID%>">
<input type="hidden" name="SPANAME" value="<%=MCID%>">
<input type="hidden" name="OPETYPE" value="<%=OPETYPE%>">
<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>">
<input type="hidden" name="APPDATE" value="<%=webuser.getCurrentDate()%>">
<input type="hidden" name="STATUS">
<input type="hidden" name="ENTCLASS" value="6">
<input type="hidden" name="INDUSTRYPHY">
<input type="hidden" name="INDUSTRYCO">
<input type="hidden" name="CDDL" value="3">
<input type="hidden" name="NAMEAPPNO" value="<%=Page.getAPPRNO()%>">
<input type="hidden" name="OPELOCDISTRICT" id="OPELOCDISTRICT">
<%
  if(sENTTYPE.equalsIgnoreCase("HZS"))
  {
%>
    <%@include file="public/qydj_hzs_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("HZSFZ"))
  {
  ENTTYPE="9200";
%>
    <%@include file="public/qydj_hzsfz_jbxx.inc" %>
<%}%>

<br>
<CENTER>
<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
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
<div class="subImgs" id="subid" onclick="doSub()">下一页</div>
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
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	if(sENTTYPE.equalsIgnoreCase("HZS")){
		ec.setUserFunction("checkCySub()");
  	}
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	
	vf.setUserFunction("RegorgDis()");
	vf.setUserFunction("loadgss()");
	vf.setUserFunction("INITBUSSCOPE()");
	//vf.setUserFunction("regorgChange()");
	if(sENTTYPE.equalsIgnoreCase("HZS")){
		vf.setUserFunction("changeCy()");
  	}
	out.print(vf.ValueDefaultScript());
%>