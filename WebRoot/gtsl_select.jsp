<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="SYS_DMDZ" scope="page"  class="com.macrosoft.icms.util.SYS_DMDZ"/>
<%
String CDDL=SysUtility.doPreProcess(request.getParameter("CDDL"));
String OPETYPE=SysUtility.doPreProcess(request.getParameter("OPETYPE"));
String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));
String SIGN=SysUtility.doPreProcess(request.getParameter("SIGN"));
String MCID="";
String ENTTYPE="";
String ENTCLASS="";
String ENTNAME=""; 
String IFELEC ="";
if(OPENO.equals("")){OPENO=Page.getOPENO();}
if(!OPENO.equals("") && Page.getENTNAME().equals("")){
GTDJ_JBXX_SQ jbxx=new GTDJ_JBXX_SQ();
jbxx.setOPENO(OPENO);
jbxx.doSelect();
Page.setMCXH(jbxx.getMCXH());
Page.setXGBH(jbxx.getSPANAME1());
Page.setENTNAME(jbxx.getTRANAME());
Page.setIFELEC(jbxx.getIFELEC());
Page.setENTCLASS("5");
Page.setENTTYPE("GT");
}
MCID=Page.getXGBH();
ENTTYPE=Page.getENTTYPE();
ENTCLASS=Page.getENTCLASS();
ENTNAME=Page.getENTNAME(); 
IFELEC= Page.getIFELEC();
String XZQH=webuser.getXZQH();
boolean ifDzh=SYS_DMDZ.ifDzh(XZQH);
%>
<html>
<head>
<title>ѡ����ҵ����</title>
</head>
<script language='javascript'>
function ifmc(lx){
	if(lx=="Y"){
		document.getElementById("y_mc").style.display="";
		document.getElementById("n_mc").style.display="none";		
		document.getElementById("radio_y_mc").checked="checked";
		//document.getElementById("radio_y_mc_gt").checked="checked";
	}else{
		document.getElementById("y_mc").style.display="none";
		document.getElementById("n_mc").style.display="";		
		document.getElementById("radio_n_mc").checked="checked";
		//document.getElementById("radio_y_mc_gt").checked="checked";
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

function body_load(){
	var OPENO="<%=OPENO%>";
	var ENTNAME="<%=ENTNAME%>";
	var MCID="<%=MCID%>";
	var IFELEC="<%=IFELEC%>";
	if(ENTNAME==""){
		ifmc('Y');
	}else{
		if(MCID==""){
			ifmc('N');
		}else{
			ifmc('Y');
			document.myform.qyname1.value=ENTNAME;
			document.myform.mcid.value=MCID;
		}		
	}
	if(IFELEC=="1"){
		document.getElementById("ifelec_y").checked=true;
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
	var ifDzh="<%=ifDzh%>";
	if(ifDzh==="true"){
		var ifelec_y = document.getElementById("ifelec_y").checked;
		var ifelec_n = document.getElementById("ifelec_n").checked;
		var ifagree = document.getElementById("ifagree").checked;
	}
	if(document.getElementById("radio_y_mc").checked){
		if(document.myform.mcid.value==""){
			alert("��¼������Ԥ�Ⱥ�׼֪ͨ���ĺţ�");return;
		}
		if($.trim(document.myform.mcid.value).length<0){
			alert("����Ԥ�Ⱥ�׼֪ͨ���ĺŲ�ӦС��4λ��");return;
		}
		if(document.myform.qyname1.value==""){
			alert("��¼���ֺ����ƣ�");return;
		}
		document.myform.ENTNAME.value=document.myform.qyname1.value;
	}else{
		/*if(document.myform.qyname.value==""){
			alert("��¼���ֺ�����");
			return;
		}*/
		document.myform.ENTNAME.value=document.myform.qyname2.value;
	}

	if(ifelec_y==false && ifelec_n==false){
		alert("��ѡ���Ƿ�ȫ�̵��ӻ���");return;
	}
	if(ifelec_y==true && ifagree==false){
		alert("��ѡ��ͬ�����Ϸ���Э�����");return;
	}
	document.getElementById("subid").disabled=true;
	document.getElementById("waitdiv").style.display="";
	myform.submit();
}
</script>
<BODY style="margin: 0px" onload="body_load()">
<%@include file="top.inc"%>
<%
StepShow stepShow= new StepShow();
%>
<%=stepShow.getStep("1",Page.getDL()+Page.getOPETYPE(),Page.getOPENO())%>
<table border='1' width='100%' align='center'>
<tr>
<td class="yxsm">
&nbsp;ҵ�����˵��
</td>
</tr>
<tr><td class=lc2 valign='top'>
&nbsp;&nbsp;&nbsp;
һ����������������ĸ��幤�̻���Ҫ����ǰ����ɣ�����<strong>���Ƿ������ƺ�׼�顿</strong>һ���е��<font color='red' style='font-size:15px;'><strong>��</strong></font>��
<br/>&nbsp;&nbsp;&nbsp;&nbsp;��������������������ǲ���Ҫ����ǰ����ɵĸ��幤�̻�������<strong>���Ƿ������ƺ�׼�顿</strong>һ���е��<font color='red' style='font-size:15px;'><strong>�ޡ�</strong></font> <br>&nbsp;&nbsp;&nbsp;&nbsp;��������Ԥ�Ⱥ�׼֪ͨ���ĺţ���ϵͳ������ĺ��磨ɽ���Ǽ�����Ԥ����[2011]��01xxx6�ţ�ֻҪ��д01xxx6����;������ϵͳ������ĺ���ȫ�����롣<br>&nbsp;&nbsp;&nbsp;&nbsp;�ġ��ֺ����ƣ��ֺ�����Ӧ��д��������дʱӦʹ�ð�����롣
<br></td></tr></table>

<FORM NAME="myform" METHOD="POST" ACTION="web/sl_select_action.jsp" target="editframe">
<input type="hidden" name="DL" value="GTDJ">
<input type="hidden" name="ENTCLASS" value="5">
<input type="hidden" name="QYLX" value="GT">
<input type="hidden" name="ENTNAME">
<table border="1" width="100%" cellspacing='0' cellpadding='0' align="center" >
  <tr>
    <td colspan="3" class="yxsm">һ����ѡ���Ƿ����ֺ�����</td>
  </tr>
  <tr>
    <td class="lc1" width="180px">�Ƿ����ֺ�����</td>
    <td colspan="2" class="lc2">
      �У�<input type="radio" name="radio_mc" id="radio_y_mc" value="1" onClick="ifmc('Y')"/>
	  �ޣ�<input type="radio" name="radio_mc" id="radio_n_mc" value="2" onClick="ifmc('N')"/>	</td>
  </tr>
</table>

   <div id="y_mc">
   <table border="1" width="100%" cellspacing='0' cellpadding='0' align="center" style="border-top-width: 0px">
   <tr>
    <td colspan="3" class="yxsm">������¼��������Ϣ</td>
  </tr>
  <tr>
    <td class="lc1" width="180px">����Ԥ�Ⱥ�׼֪ͨ���ĺ�: </td>
    <td colspan="2" class="lc2">��
      <input type="text" name="mcid" id="mcid" />
    ��
    </td>
  </tr>
  <tr>
    <td class="lc1" width="180px">�ֺ�����: </td>
    <td colspan="2" class="lc2"><input type="text" name="qyname1" id="qyname1" size="40"/></td>
  </tr>
  <tr>
  	 <td class="lc2" colspan="3"><font color="red" style="font-size:15px"><STRONG>˵��:</STRONG></font>
  	 ��׼ȷ��д<STRONG>������Ԥ�Ⱥ�׼֪ͨ���ĺš�</STRONG>��<STRONG>���ֺ����ơ�</STRONG>,��������Ϣ��ʵ����Ϣ������ҵ����Ա��<STRONG>����</STRONG>����</td>
  </tr>
  </table>
  
   </div>
   <div id="n_mc">
   <input type="hidden" name="qyname2" id="qyname2" size="40" value="****"/>
   <table border="1" width="100%" cellspacing='0' cellpadding='0' align="center" id="n_mc" style="border-top-width: 0px">
   <tr>
    <td colspan="3" class="yxsm">�������ֺŸ��廧����</td>
  </tr>  
  <%--tr>
    <td class="lc1" width="180px">�ֺ�����: </td>
    <td colspan="2" class="lc2"></td>
  </tr>
  <tr>
  	 <td class="lc2" colspan="3"><font color="red" style="font-size:15px"><STRONG>˵��:</STRONG></font>
  	 ��׼ȷ��д<STRONG>���ֺ����ơ�</STRONG>,��������Ϣ������Ҫ��ҵ����Ա��<STRONG>����</STRONG>����</td>
  </tr--%>
  </table></div>
  <%if(ifDzh){ %>
  <div id="iffullelec">
				<table border="1" width="100%" cellspacing='0' cellpadding='0'
					align="center" style="border-top-width: 0px">
					<tr>
					<tr>
						<td colspan="3" class="yxsm">
							������ѡ���Ƿ�ȫ�̵��ӻ�
						</td>
					</tr>
					<tr>
						<td colspan="3"  style="text-align: center;" width="100%">
							<font color="red" > �����Ŷӣ����ٰ�ᣡѡ��ȫ�̵��ӻ����ϰ���Ǽǣ������ݣ��Ƿ�ѡ��
							</font>
						</td>
					</tr>
					<tr>
                    <td class="lc1" width="22%">�Ƿ�ȫ�̵��ӻ���</td>
                    <td colspan="2" class="lc2">
	                  <input type="radio" name="ifelec" id="ifelec_y" title="�Ƿ�ȫ�̵��ӻ�" value="1"  onclick="IsFullElec()">��
	                 <input type="radio" name="ifelec" id="ifelec_n" title="�Ƿ�ȫ�̵��ӻ�" value="0"  onclick="IsFullElec()">��
                     </td>
                    </tr>					
				</table>
			</div>
      <br/>
  <div id="Elecxx"  style="display:none; height:200px; overflow:auto;">
     <%@include file="elec_info.jsp"%>
  </div>
  <%} %>
  <CENTER>
    <div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
  <br/>
  ���ݲ�ѯ�У���ȴ�...<br/>&nbsp;
  </div>
  <%
  if(!OPENO.equals("")){
  %>
  <div class="subImgs" onclick="window.location.href='wsdj_tbxx.jsp'">��һ��</div>
  <%
  }else{
  %>
  <div class="subImgs" id="subid" onclick="doSub()">��һ��</div>  
  <%
  }
  %></CENTER>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>

<%@include file="bottom.inc"%>
</body>
</html>