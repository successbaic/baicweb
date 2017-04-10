<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="QYDJ_JBXX" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ" />
<jsp:useBean id="MCGL_JBXX_ZS" scope="page"
	class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS" />
<html>
	<head>
		<title>基本情况</title>
		<script type="text/javascript">
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
function doblurregcap()
{
	var REGCAP =document.getElementById("REGCAP").value;
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
	return true;
}
function doblurreccap()
{
	var RECCAP = document.getElementById("RECCAP").value;
	var REGCAP =document.getElementById("REGCAP").value;
	if(RECCAP!=null&&RECCAP!="")
	{
	   if (fucCheckNUM(RECCAP))
	    {
		   if (Math.abs(RECCAP)>999999999999)
		    {
			   alert('实收资本超过系统最大精度！');
			   return false;
		    }
		   //if((RECCAP-REGCAP)>0){
		   //    alert('实收资本应小于等于注册资本！');
		   //   return false;
		   //}
	    }else
	    {
		   alert('实收资本应为数字！');
		   return false;
	    }
	}
	return true;
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
		if(document.form1.OPELOCDISTRICT!=null){
		var dqdm=document.form1.OPELOCDISTRICT.value;
		document.getElementById("hiddenframe").contentWindow.location.href="support/gssload.jsp?STYPE=GSS&OBJ=parent.form1.LOCALADM&SREAMRK="+dqdm;
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
		if(document.getElementById("OPDATETO").value=="长期"){
			document.getElementById("checkboxInput").checked=true;
			document.getElementById("year").style.display="none";
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
					alert("未找到企业名称，请确认注册号填写是否正确！");
				}else{
					$("#SUPENTNAME").val(data.SUPENTNAME);
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
			loadgss();
		});*/
		if($("select[name='REGORG']").val() == $("select[name='OPELOCDISTRICT']").val()){
			//$("select[name='OPELOCDISTRICT']").attr("disabled",true);
		}else{
			$("select[name='OPELOCDISTRICT']").attr("disabled",false);
		}
		$("select[name='REGORG']").change(function(){
			if(document.form1.OPELOCDISTRICT!=null && document.form1.REGORG.value!=""){
				if(document.form1.REGORG.value!=document.form1.CITY.value){
					document.form1.OPELOCDISTRICT.value=document.form1.REGORG.value;
					//$("select[name='OPELOCDISTRICT']").attr("disabled",true);
					loadgss();
				}else{
					$("select[name='OPELOCDISTRICT']").attr("disabled",false);
				}
			}
		});
	}
function init(){
	/*$("select[name='COUNTY']").change(function(){
		$("select[name='REGORG']").val($(this).val()).trigger("change");
	});*/
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
		<style type="text/css">
#yxsm {
	background-image: url(images/main/ywbltitleBG.jpg);
	background-repeat: repeat-x;
}
</style>
	</head>
	<body bgcolor="#eefbf7" style="margin-top: 0; margin-bottom: 0">
		<%@include file="top.inc"%>
		<%
			String pageheader = Page.pageheader(request.getRequestURI());
			out.println(pageheader);
			String SIGN = Page.getSIGN(); //-1数据未保存,1已开业
			String OPENO = Page.getOPENO();
			String OPETYPE = Page.getOPETYPE();
			String MCXH = Page.getMCXH();
			String MCID = Page.getXGBH();
			String PRIPID = Page.getPRIPID();
			if (PRIPID.equals("")) {
				//PRIPID = MCXH;
			}
			String XZQH = webuser.getXZQH();
			ArrayList qydjList=new ArrayList();
			if (!OPENO.equals("")) {
				QYDJ_JBXX.setOPENO(OPENO);
				qydjList=QYDJ_JBXX.getData();
				if(Page.getIFELEC()==null){
			    QYDJ_JBXX.doSelect();
				Page.setIFELEC(QYDJ_JBXX.getIFELEC());
				}
			}
			
			ValueDefault vf = new ValueDefault();
			vf.setFormName("form1");
			if (OPENO.equals("")) {
				if (MCXH == null || MCXH.equals("")) {
					vf.setFormData("ENTNAME", Page.getENTNAME());
					vf.setFormData("ENTCLASS", Page.getENTCLASS());
					vf.setFormData("IFPROVINCENAME", "3");
				} else {
					String gmlx=Page.getGMLX();
					
					if("1".equals(gmlx)){
						MCGL_JBXX_ZS.doSelectBySqlSJ("SELECT * FROM MCGL_JBXX_ZS WHERE NAMEID='"+ MCXH + "'");
						vf.setFormData("IFPROVINCENAME", "1");
					}else{
						MCGL_JBXX_ZS.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE NAMEID='"+ MCXH + "'");
					}
					
					String entc = MCGL_JBXX_ZS.getENTCAT();
		
					vf.setFormData("ENTCLASS", entc);
					if(!"".equals(MCGL_JBXX_ZS.getAPPRNO())){
						vf.setFormData("NAMEAPPNO", MCGL_JBXX_ZS.getAPPRNO());
					}
					vf.setFormData("CBUITEM", MCGL_JBXX_ZS.getCBUITEM());
					vf.setFormData("COUNTRY", MCGL_JBXX_ZS.getCOUNTRY());
					vf.setFormData("PRIPID", MCGL_JBXX_ZS.getPRIPID());
					vf.setFormData("REGCAPUSD", MCGL_JBXX_ZS.getREGCAPUSD());
					vf.setFormData("REGCAPCUR", MCGL_JBXX_ZS.getREGCAPCUR());
					vf.setFormData("REGCAP", MCGL_JBXX_ZS.getREGCAP());
					vf.setFormData("CONGROUSD", MCGL_JBXX_ZS.getCONGROUSD());
					vf.setFormData("CONGROCUR", MCGL_JBXX_ZS.getCONGROUSD());
					vf.setFormData("CONGRO", MCGL_JBXX_ZS.getCONGRO());
					vf.setFormData("BUSSCOPE", MCGL_JBXX_ZS.getBUSSCOPE());
					vf.setFormData("DOM", MCGL_JBXX_ZS.getDOM());
					vf.setFormData("ENTTYPE", MCGL_JBXX_ZS.getENTTYPE());
					vf.setFormData("ENTNAME", MCGL_JBXX_ZS.getENTNAME());
					vf.setFormData("REGORG", MCGL_JBXX_ZS.getPREREGORG());
					if(!MCGL_JBXX_ZS.getPREREGORG().equals(XZQH) && !MCGL_JBXX_ZS.getPREREGORG().equals(icms.getCURRENTUNIT()) && !MCGL_JBXX_ZS.getPREREGORG().endsWith("0000")){
						vf.setFormData("OPELOCDISTRICT", MCGL_JBXX_ZS.getPREREGORG());
					}
					vf.setFormData("ABUITEMCO", MCGL_JBXX_ZS.getABUITEMCO());
					vf
							.setFormData("INDUSTRYPHY", MCGL_JBXX_ZS
									.getINDUSTRYPHY());
					vf.setFormData("INDUSTRYCO", MCGL_JBXX_ZS.getINDUSTRYCO());
					if(!MCGL_JBXX_ZS.getCITY().equals("")){
						vf.setFormData("CITY", MCGL_JBXX_ZS.getCITY());
						QYDJ_JBXX.setCITY(MCGL_JBXX_ZS.getCITY());//首次进入页面时单独赋值CITY，
					}
					if(!MCGL_JBXX_ZS.getCOUNTY().equals("")){
						vf.setFormData("COUNTY", MCGL_JBXX_ZS.getCOUNTY());
					}
					vf.setFormData("TOWN", MCGL_JBXX_ZS.getSTREET());
					vf.setFormData("VILLAGE", MCGL_JBXX_ZS.getROAD());
					vf.setFormData("HOUSENUMBER", MCGL_JBXX_ZS.getDOORPLATE());
				}
			vf.setUserFunction("init()");
			} else {
				
				vf.setData(qydjList);
			}
		%>
		<form name="form1" method="POST" action='web/qydj_gs_jbxx_action.jsp'
			target="editframe">
			<input type="hidden" name="OPENO" value="<%=OPENO%>">
			<input type="hidden" name="MCXH" value="<%=MCXH%>">
			<input type="hidden" name="PRIPID" value="<%=PRIPID%>">
			<input type="hidden" name="SPANAME" value="<%=MCID%>">
			<input type="hidden" name="OPETYPE" value="<%=OPETYPE%>">
			<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>">
			<input type="hidden" name="APPDATE"
				value="<%=webuser.getCurrentDate()%>">
			<input type="hidden" name="NAMEAPPNO" value="<%=Page.getAPPRNO() %>">
			<input type="hidden" name="STATUS">
			<input type="hidden" name="ENTCLASS" value="<%=Page.getENTCLASS()%>">
			<input type="hidden" name="INDUSTRYPHY">
			<input type="hidden" name="INDUSTRYCO">
			<input type="hidden" name="POSITION">
			<input type="hidden" name="IFPROVINCENAME">
			<input type="hidden" name="CDDL" value="1">
			<%
				String sENTTYPE = Page.getENTTYPE();
				if (sENTTYPE.equalsIgnoreCase("GS")) {
			%>
			<%@include file="public/qydj_gs_jbxx.inc"%>
			<%
				} else if (sENTTYPE.equalsIgnoreCase("FGS")) {
			%>
			<%@include file="public/qydj_fgs_jbxx.inc"%>
			<%
				} else if (sENTTYPE.equalsIgnoreCase("NZYY")) {
			%>
			<%@include file="public/qydj_nzyy_jbxx.inc"%>
			<%
				} else if (sENTTYPE.equalsIgnoreCase("NZFR")) {
			%>
			<%@include file="public/qydj_nzfr_jbxx.inc"%>
			<%
				} else if (sENTTYPE.equalsIgnoreCase("HHQY")) {
			%>
			<%@include file="public/qydj_nzhh_jbxx.inc"%>
			<%
				} else if (sENTTYPE.equalsIgnoreCase("HHFZ")) {
			%>
			<%@include file="public/qydj_nzhhfz_jbxx.inc"%>
			<%
				} else if (sENTTYPE.equalsIgnoreCase("GRDZ")) {
			%>
			<%@include file="public/qydj_grdz_jbxx.inc"%>
			<%
				} else if (sENTTYPE.equalsIgnoreCase("GRDZFZ")) {
			%>
			<%@include file="public/qydj_grdzfz_jbxx.inc"%>
			<%
				}
			%>
			<br>
			<CENTER>
			<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
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
				<div class="subImgs" id="subid" onclick="if(form1errorCheck()){document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';document.form1.submit();}">
					下一页
				</div>
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
	ec.setUserFunction("checkSub()");
	//ec.setUserFunction("setBusscope()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	vf.setUserFunction("checkIfCq()");
	vf.setUserFunction("RegorgDis()");
	vf.setUserFunction("loadgss()");
	vf.setUserFunction("tqdw()");
	vf.setUserFunction("INITBUSSCOPE()");
	vf.setUserFunction("regorgChange()");
	out.print(vf.ValueDefaultScript());
%>
<script type="text/javascript">
var changeFlag=false;   
        //标识文本框值是否改变，为true，标识已变    
        $(document).ready(function(){   
             //文本框值改变即触发        
            $("input[type='text']").change(function(){   
				changeFlag=true;
            });    
            //文本域改变即触发   
            $("textarea").change(function(){   
				changeFlag=true;
            }); 
            $("select").change(function(){   
				changeFlag=true;
            });   
        });   
</script>