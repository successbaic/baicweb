<%@page import="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"%>
<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="GTDJ_JBXX" scope="page"  class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ"/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<html>
<head>
<title>�������</title>
<script type="text/javascript">
/*
��þ�Ӫ��Χ
*/
function getJYFWStr(fieldName){
	var jyfwObj = document.getElementById(fieldName);
	var url = "jyfw/selectJyfw.jsp?fieldName="+fieldName+"&fieldValue="+jyfwObj.value.replace(/�������뾭��׼����Ŀ������ز�����׼�󷽿ɿ�չ��Ӫ���/g,"");
	var returnValue = window.showModalDialog(url,jyfwObj,"dialogWidth:800px;dialogHeight:700px;center:1;status:0");
	if(returnValue != null&&returnValue!=""){
		jyfwObj.value=returnValue;
		$("textarea[name='BUSSCOANDFORM']").trigger("change");
	}
}
function INITBUSSCOPE(){
	if($("textarea[name='BUSSCOANDFORM']").length>0){
		$("textarea[name='BUSSCOANDFORM']").focus(function(){
			$(this).text($(this).text().replace(/�������뾭��׼����Ŀ������ز�����׼�󷽿ɿ�չ��Ӫ���/g,""));
		}).change(function(){
			$(this).text($(this).text().replace(/�������뾭��׼����Ŀ������ز�����׼�󷽿ɿ�չ��Ӫ���/g,"")+"�������뾭��׼����Ŀ������ز�����׼�󷽿ɿ�չ��Ӫ���");
		}).blur(function(){
			$(this).text($(this).text().replace(/�������뾭��׼����Ŀ������ز�����׼�󷽿ɿ�չ��Ӫ���/g,"")+"�������뾭��׼����Ŀ������ز�����׼�󷽿ɿ�չ��Ӫ���");
		});
	}
}
function ifJtjy()
{
	var COMPFORM=document.getElementById("COMPFORM").value;
	if(COMPFORM=="0"){
		document.getElementById("jtcy_tr").style.display="";
	}else{
		document.getElementById("jtcy_tr").style.display="none";
		document.getElementById("FAMMEMBER").value=""
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
	if(townm.indexOf("�ֵ����´�")>0
	||townm.indexOf("���´�")>0
	||townm.indexOf("�ֵ�")>0
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
	 if(document.getElementById("OPLOC")!=null){
		document.getElementById("OPLOC").value = Address;
		 }
	}
}
function isYh(){
	$("#REGORG").attr("disabled","diabled");
	//$("#OPELOCDISTRICT").attr("disabled","diabled");
	//$("#LOCALADM").attr("disabled","diabled");
}
/*function regorgChange(){
	$("#REGORG").change(function(){
		$("#OPELOCDISTRICT").val($(this).val());
		loadgss();
	});
}*/

function regorgChange(){
	
}
function init(){
	/*$("#COUNTY").change(function(){
		$("#REGORG").val($(this).val()).trigger("change");
		
	});*/
}
function doSub(){
	if(form1errorCheck()){
		if(document.getElementById('REGORG').value==""){
			alert("��¼��Ǽǻ���");
			return;
		}
		//��Ͻ��λ�Զ�Ĭ��
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
</script>
</head>
<body >
<%@include file="top.inc"%>
<%	
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String SIGN = Page.getSIGN();	//-1����δ����,1�ѿ�ҵ
	String OPENO =Page.getOPENO();	
	String OPETYPE =Page.getOPETYPE();
	String MCXH=Page.getMCXH();
	String PRIPID=Page.getPRIPID();
	if(PRIPID.equals("")){
		//PRIPID=MCXH;
	}
	if(!OPENO.equals("")){
	  if(Page.getIFELEC()==null){
	  GTDJ_JBXX.setOPENO(OPENO);
	  GTDJ_JBXX.doSelect();
	  Page.setIFELEC(GTDJ_JBXX.getIFELEC());
	 }
	}
	String SPANAME1=Page.getXGBH();
	String divflag="block"; 	
	
	String XZQH=webuser.getXZQH();
	
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	if (OPENO.equals(""))	
	{	  
	   if(MCXH == null || MCXH.equals("")){
	 		vf.setFormData("TRANAME",Page.getENTNAME());
	   		vf.setFormData("ENTCLASS",Page.getENTCLASS());  
	   }else{
		   MCGL_JBXX_ZS.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE NAMEID='"+MCXH+"'");
		   vf.setFormData("ENTCLASS","5");
		   vf.setFormData("BUSSCOANDFORM",MCGL_JBXX_ZS.getBUSSCOPE());
		   if(MCGL_JBXX_ZS.getOPLOC().equals("")){
			   vf.setFormData("OPLOC",MCGL_JBXX_ZS.getDOM());
		   }else{
			   vf.setFormData("OPLOC",MCGL_JBXX_ZS.getOPLOC());   
		   }		   
		   vf.setFormData("PRIPID", MCGL_JBXX_ZS.getPRIPID());
		   vf.setFormData("TRANAME",MCGL_JBXX_ZS.getENTNAME());
		   vf.setFormData("REGORG",MCGL_JBXX_ZS.getPREREGORG());
		   vf.setFormData("CAPAM",MCGL_JBXX_ZS.getREGCAP());
		   
		   if(!MCGL_JBXX_ZS.getCITY().equals("")){
				vf.setFormData("CITY", MCGL_JBXX_ZS.getCITY());
				GTDJ_JBXX.setCITY(MCGL_JBXX_ZS.getCITY());//�״ν���ҳ��ʱ������ֵCITY��
			}
			if(!MCGL_JBXX_ZS.getCOUNTY().equals("")){
				vf.setFormData("COUNTY", MCGL_JBXX_ZS.getCOUNTY());
			}
			
		   vf.setFormData("TOWN",MCGL_JBXX_ZS.getSTREET());
		   vf.setFormData("VILLAGE",MCGL_JBXX_ZS.getROAD());
		   vf.setFormData("HOUSENUMBER",MCGL_JBXX_ZS.getDOORPLATE());
		   vf.setFormData("OPERNAME",MCGL_JBXX_ZS.getNAME());
		   vf.setFormData("OPELOCDISTRICT",MCGL_JBXX_ZS.getPREREGORG());
		   vf.setFormData("LOCALADM",MCGL_JBXX_ZS.getLOCALADM());
		   
		   vf.setUserFunction("loadgss()");
		   
		   if(!"".equals(MCGL_JBXX_ZS.getAPPRNO())){
				vf.setFormData("NAMEAPPNO", MCGL_JBXX_ZS.getAPPRNO());
			}
		   vf.setUserFunction("isYh()");
		}   
	vf.setUserFunction("init()");
	   
	}else{
		GTDJ_JBXX.setOPENO(OPENO);
		vf.setData(GTDJ_JBXX.getData());
		
		vf.setUserFunction("loadgss()");
		
		if(!"".equals(GTDJ_JBXX.getNAMEAPPNO())){
			vf.setUserFunction("isYh()");
		}
	}
%> 
<form name="form1" method="POST" action='web/gtdj_gt_jbxx_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value="<%=OPENO%>">
<input type="hidden" name="MCXH" value="<%=MCXH%>">
<input type="hidden" name="OPETYPE" value="<%=OPETYPE%>">
<input type="hidden" name="LOGINID" value="<%=webuser.getLOGINID()%>">
<input type="hidden" name="APPDATE" value="<%=webuser.getCurrentDate()%>">
<input type="hidden" name="SPANAME1" value="<%=SPANAME1%>">
<input type="hidden" name="STATUS">
<input type="hidden" name="ENTCLASS" value="5">
<input type="hidden" name="PRIPID" value="<%=PRIPID%>">
<input type="hidden" name="CDDL" value="2">
<input type="hidden" name="NAMEAPPNO" value="<%=Page.getAPPRNO()%>">
<input type="hidden" name="OPELOCDISTRICT" id="OPELOCDISTRICT">
<%String sENTTYPE=Page.getENTTYPE();
  if(sENTTYPE.equalsIgnoreCase("GT"))
  {%>
    <%@include file="public/gtdj_gt_jbxx.inc" %>
<%}%>
<br>
<CENTER>
<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
	<br/>
	���ݲ�ѯ�У���ȴ�...<br/>&nbsp;
</div>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">��һҳ</div>
<%
}else{
%>
<div class="subImgs" id="subid" onclick="doSub();">��һҳ</div>
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
	//ec.setUserFunction("checkSub()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	vf.setUserFunction("ifJtjy()");
	//vf.setUserFunction("regorgChange()");
	vf.setUserFunction("INITBUSSCOPE()");
	out.print(vf.ValueDefaultScript());
%>