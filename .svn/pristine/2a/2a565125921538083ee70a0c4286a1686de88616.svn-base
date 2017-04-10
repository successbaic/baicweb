<%-- <%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<jsp:useBean id="QYDJ_JBXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="GSGSJIN_BASIS02" scope="page"  class="com.macrosoft.icms.wsnj.GSGSJIN_BASIS02"/>
<html>
<head>
<title>基本情况</title>
<script language='javascript'>
/*
获得经营范围
*/
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
	var dqdm=document.form1.OPELOCDISTRICT.value;
	document.frames["hiddenframe"].location="support/load.jsp?STYPE=GSS&OBJ=parent.form1.LOCALADM&SREAMRK="+dqdm;
}
</script>
<style type="text/css">
#yxsm {
   background-image:url(images/main/ywbltitleBG.jpg);
   background-repeat:repeat-x;
}
</style>
</head>
<body bgcolor="#eefbf7" style="margin-top:0;margin-bottom:0">
<%@include file="../top.inc"%>
<%	
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String SIGN = Page.getpageKey9();	//-1数据未保存,1已开业
	String OPENO =Page.getpageKey();	
	String OPETYPE =Page.getopra();
	String MCXH=Page.getpageKey5();
	String MCID=Page.getpageKey8();
	String PRIPID=Page.getpageKey1();
	if(PRIPID.equals("")){
		PRIPID=MCXH;
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
<input type="hidden" name="ENTCLASS">
<input type="hidden" name="INDUSTRYPHY">
<input type="hidden" name="INDUSTRYCO">
<input type="hidden" name="POSITION">
<input type="hidden" name="CDDL" value="1">
<%String sENTTYPE=Page.getpageKey4();
sENTTYPE = "GS";
  if(sENTTYPE.equalsIgnoreCase("GS"))
  {%>
    <%@include file="../public/qydj_gs_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("FGS"))
  {%>
    <%@include file="../public/qydj_fgs_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("NZYY"))
  {%>
    <%@include file="../public/qydj_nzyy_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("NZFR")) 
  {%>
   <%@include file="../public/qydj_nzfr_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("HHQY"))
  { %>
   <%@include file="../public/qydj_nzhh_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("HHFZ"))
  {%>
   <%@include file="../public/qydj_nzhhfz_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("GRDZ")) 
  {%>
    <%@include file="../public/qydj_grdz_jbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("GRDZFZ")) 
  {%>
    <%@include file="../public/qydj_grdzfz_jbxx.inc" %>
<%} %> 
<br>
<CENTER>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">下一页</div>
<%
}
%>
</CENTER>
<input type="hidden" name="BUSSCOPE" id="BUSSCOPE"/>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe> 
<iframe height="0" width="0" name="hiddenframe" src="" id="hiddenframe"></iframe>
<%@include file="../bottom.inc"%>
</body>  
</html>
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.setUserFunction("checkSub()");
	ec.setUserFunction("setBusscope()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	if (OPENO.equals(""))	
	{
	   if(MCXH==null || MCXH.equals("")){
	 		vf.setFormData("ENTNAME",Page.getpageKey7());
	   		vf.setFormData("ENTCLASS",Page.getpageKey3());  
	   }else{
		   GSGSJIN_BASIS02.doSelectBySql("SELECT * FROM gsgsjin_basis02 where field002 like '01%' and field155='9002' and field001='"+MCXH+"'");
		   String entc=GSGSJIN_BASIS02.getFIELD023();
		   if(entc.equals("01")){entc="1";}
		   if(entc.equals("02")){entc="2";}
		   if(entc.equals("04")){entc="8";}
		   if(entc.equals("07")){entc="7";}
		   if(entc.equals("09")){entc="5";}
		   if(entc.equals("11")){entc="1";}
		   if(entc.equals("13")){entc="7";}
		   
		   vf.setFormData("ENTCLASS",entc);
		   vf.setFormData("CBUITEM",GSGSJIN_BASIS02.getFIELD067());
		   vf.setFormData("COUNTRY",GSGSJIN_BASIS02.getFIELD016());
		   vf.setFormData("REGCAPUSD",GSGSJIN_BASIS02.getFIELD221());
		   vf.setFormData("REGCAPCUR",GSGSJIN_BASIS02.getFIELD050());
		   vf.setFormData("REGCAP",GSGSJIN_BASIS02.getFIELD049());
		   vf.setFormData("CONGROUSD",GSGSJIN_BASIS02.getFIELD218());
		   vf.setFormData("CONGROCUR",GSGSJIN_BASIS02.getFIELD047());
		   vf.setFormData("CONGRO",GSGSJIN_BASIS02.getFIELD046());
		   vf.setFormData("BUSSCOPE",GSGSJIN_BASIS02.getFIELD067());
		   vf.setFormData("DOM",GSGSJIN_BASIS02.getFIELD033());
		   vf.setFormData("ENTTYPE",GSGSJIN_BASIS02.getFIELD020());
		   vf.setFormData("ENTNAME",GSGSJIN_BASIS02.getFIELD009());
		   vf.setFormData("REGORG",GSGSJIN_BASIS02.getFIELD104());
		   vf.setFormData("ABUITEMCO",GSGSJIN_BASIS02.getFIELD261());
		   vf.setFormData("INDUSTRYPHY",GSGSJIN_BASIS02.getFIELD021());
		   vf.setFormData("INDUSTRYCO",GSGSJIN_BASIS02.getFIELD022());
		}		   
	}
	else 
	{
		QYDJ_JBXX.setOPENO(OPENO);
		vf.setData(QYDJ_JBXX.getData());
	}
	vf.setUserFunction("RegorgDis()");
	vf.setUserFunction("loadgss()");
	vf.setUserFunction("INITBUSSCOPE()");
	out.print(vf.ValueDefaultScript());
%>
<script src="support/jquery-1.7.2.min.js" type="text/javascript"></script> 
<script language="javascript">
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

</script> --%>