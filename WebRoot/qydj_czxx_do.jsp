<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_CZXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_JBXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<html>
<head>
<%
 	// String OPENO =Page.getpageKey();
	String action = SysUtility.doPreProcess(request.getParameter("action"));
  	String RECID = SysUtility.doPreProcess(request.getParameter("RECID"));
  	String OPENO = SysUtility.doPreProcess(request.getParameter("OPENO"));
	String PRIPID="";
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	
	String sENTTYPE=Page.getENTTYPE();
	String opetype=Page.getOPETYPE();
 %>
<title>��˾�ɶ��������ˣ�������Ϣ</title>
<script language="javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
<script type="text/javascript">
var sENTTYPE = '<%=sENTTYPE%>';
function getSelDm(id,type){
	var url = "support/doSelDm.jsp?type="+type;
	var info="dialogHeight:580px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
	var ret = window.showModalDialog(url,"",info);
	if(ret!=undefined){
		var testId=id+"_TEXT"
		document.getElementById(id).value=ret[0];
		document.getElementById(testId).value=ret[1];		
	}
}
function checkInvtype(){
	var val=document.form1.INVTYPE.value;
	var ENTTYPE=document.form1.ENTTYPE.value;
	if(val=="10"){
		alert("���˹ɶ���ѡ��������ͣ��硰��ҵ���ˡ�������ҵ���ˡ��������ŷ��ˡ��������ط��ˡ���");
		return false;
	}
	if(val=="20"){
		alert("��Ȼ�˹ɶ���ѡ��������ͣ��硰ũ����Ȼ�ˡ�������ũ����Ȼ�ˡ���");
		return false;
	}
	if(val=="30"){
		alert("���(����)Ͷ������ѡ��������ͣ��硰���(����)��ҵ���������(����)������֯����������Ͷ��Ͷ���Թ�˾����������Ͷ�ʴ�ҵͶ����ҵ�������⼮��Ȼ�ˡ��������ȡ���");
		return false;
	}
	if(ENTTYPE=="1151"){
		if (val=="20"||val=="35"||val=="36" || val=="21" || val=="22"){
			
		}else{
			alert("��ǰ���Ƶ���ҵ�����ǡ��������ι�˾(��Ȼ�˶���)������ѡ���Ͷ�����������ڷ���Ȼ��");
			return false;
		}
	}
	if(ENTTYPE=="1152"||ENTTYPE=="1153"){
		//if (val=="20"||val=="35"||val=="36" || val=="21" || val=="22"){
		//	alert("��ǰ���Ƶ���ҵ�����ǡ��������ι�˾(���˶���)������ѡ���Ͷ��������������Ȼ��");
		//	return false;
		//}else{
		//	
		//}
	}
		
	
}
function setInIitem()
{
	var val;		
	document.getElementById("ZJLX_TR").style.display="none";
	document.getElementById("ZZLX_TR").style.display="none";
	if("HZS"==sENTTYPE){
		val = document.form1.INVTYPE.value;
		if(val == "1" ||val == "2"){	// ֤������
			document.form1.BLICTYPE.value="";
			document.form1.BLICNO.value="";
			document.getElementById("ZJLX_TR").style.display="";
			$("select[name='BLICTYPE']").attr("disabled","disabled");
			$("input[name='BLICNO']").attr("disabled","disabled");
			$("select[name='CERTYPE']").attr("disabled",false);
			$("input[name='CERNO']").attr("disabled",false);
		}else{	// ֤������
			document.form1.CERTYPE.value="";
			document.form1.CERNO.value="";
			document.getElementById("ZZLX_TR").style.display="";
			$("select[name='CERTYPE']").attr("disabled","disabled");
			$("input[name='CERNO']").attr("disabled","disabled");
			$("select[name='BLICTYPE']").attr("disabled",false);
			$("input[name='BLICNO']").attr("disabled",false);
		}
	}else{
		val = document.form1.INVTYPE.value;
		if (val=="20"||val=="35"||val=="36" || val=="21" || val=="22")
		{			
			document.form1.BLICTYPE.value="";
			document.form1.BLICNO.value="";
			document.getElementById("ZJLX_TR").style.display="";
		}
		else
		{
			document.form1.CERTYPE.value="";
			document.form1.CERNO.value="";
			document.getElementById("ZZLX_TR").style.display="";
		}		
	}
}

</script>
</head>
<body>
<form name="form1" method="POST" action='web/qydj_czxx_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID() %>">
<input type="hidden" name="RECID" value=<%=RECID%>>
<input type="hidden" name="action" value="<%=action%>">
<input type="hidden" name="REGCAP" id="REGCAP" value=<%=QYDJ_JBXX.getREGCAP()%>>
<input type="hidden" name="ENTTYPE" value="<%=QYDJ_JBXX.getENTTYPE() %>">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<caption></caption>
</table>
<%
  if(sENTTYPE.equals("WZGS")||sENTTYPE.equals("WZQY")||sENTTYPE.equals("WZFR"))
  {%>
     <%@ include file="public/qydj_wzczxx_ini.inc" %>
<%}else if(sENTTYPE.equals("NZFR"))
	{%>
	<%@include file="public/qydj_nzfr_czxx.inc" %>
<%}else if(sENTTYPE.equals("HHQY"))
  {%>
     <%@include file="public/qydj_nzhh_czxx.inc" %>
<%}else if(sENTTYPE.equals("HZS"))
  {%>
    <%@include file="public/qydj_hzs_czxx.inc" %>
<%}else if(sENTTYPE.equals("WZHH"))
  {%>
    <%@include file="public/qydj_wzhh_czxx.inc" %>
<%}else if(sENTTYPE.equals("WZFR"))
  {%>
    <%@include file="public/qydj_wzczxx_ini.inc" %>
<%}else 
  { %>
     <%@include file="public/qydj_czxx_ini.inc" %>
<%} %>
<br>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td align=center>
<%
		if (action.equals("4")) //4 �鿴
		{
%>
		<input name="btRet" type="button" value="��  ��" tyle="cursor:pointer;" onclick="parent.window.location.reload();" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
<%
		}
		else
		{
		%>
		<input name="btSave" type="submit" value="��  ��" class="inp_L1" style="cursor:pointer;"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
		<%
		}
		%>
		</td>
	</tr>
</table>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
</body>     
</html>   

<SCRIPT LANGUAGE="JavaScript">
	function checkSFZH()
	{		
		var ret=true;
		if(document.form1.CERTYPE!=null){
			if (document.form1.CERTYPE.value=="10")	// ���֤
			{
				ret=validatezjhm(document.form1.CERNO.value);
				if(ret){
				
				}else{
					document.form1.btSave.disabled=false;
				}
			}
			return ret;	
		}		
	}
	function invdis(){//Ͷ�������������͡�֤�����͡�֤�����롢֤�����͡�֤�պ��벻�����޸�
	   document.form1.INV.disabled=true;
	   //document.form1.INVTYPE.disabled=true;
	   //document.form1.CERTYPE.disabled=true;
	   //document.form1.CERNO.disabled=true;
	   //document.form1.BLICTYPE.disabled=true;
	   //document.form1.BLICNO.disabled=true;
	}
	function doSetRemark(){
	   var type=document.form1.INVTYPE.value;
	   if(type!=""&&type!=null){
	      if(type=="10"||type=="11"||type=="15"||type=="40"||type=="50"){
	         document.form1.REMARK.value="A";
	      }else if(type=="13"){
	         document.form1.REMARK.value="B";
	      }else if(type=="12"){
	         document.form1.REMARK.value="C";
	      }else if(type=="14"){
	         document.form1.REMARK.value="D";
	      }else if(type=="20"||type=="21"||type=="22"||type=="35"||type=="36"){
	         document.form1.REMARK.value="E";
	      }else{
	         document.form1.REMARK.value="G";
	      }
	   }
	}
</SCRIPT>

 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	
	//ec.setUserFunction("doblurregcap()");	
	//ec.setUserFunction("chebaldelterm()");
	ec.setUserFunction("checkSFZH()");
	ec.setUserFunction("checkInvtype()");
//	ec.setUserFunction("loadrzrq()");
//	ec.dateOrderCheck("OFFHFROM","OFFHTO","��ְ������ֹ����Ӧ�ô��ڵ�����ʼ����!");
	
	ec.FormErrorCheck();	
	out.print(ec.ErrorCheckScript());


	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	
	if(action.equals("2")||action.equals("4"))//action=4 �鿴
	{
		QYDJ_CZXX.setRECID(RECID);
		QYDJ_CZXX.setOPENO(OPENO);
		vf.setData(QYDJ_CZXX.getData());
		vf.setFormData("COUNTRY_TEXT", icms.getSysDm("COUNTRY",QYDJ_CZXX.getCOUNTRY()));
		vf.setUserFunction("setInIitem()");
	}
	else
	{
	//	vf.setFormData("POSBRFORM","03");		
	}
	if(opetype.equals("20")&&sENTTYPE.equals("GS")){//�����Ǽǵ�ʱ�����ʹ�˾�ɶ���Ϣ�����������͡�֤��/�����͡�֤��/�պ��벻���޸�
		if(QYDJ_CZXX.getINV().equals("")){
		
		}else{
			//vf.setUserFunction("invdis()");
		}	   
	}
	if(sENTTYPE.equals("GS")){//��˾�Ĺɶ���Ϣҳ����ݡ�Ͷ�������͡����жϳ���עӦ��д����ĸ
	   //vf.setUserFunction("doSetRemark()");
	}
 	out.print(vf.ValueDefaultScript());
%>