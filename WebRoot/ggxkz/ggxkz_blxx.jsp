<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<jsp:useBean id="GGGL_GGJY" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_GGJY"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id="GGGL_JYDW_JYQK" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JYQK"/>
<%
  	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	
  	String ADBULICNO=Page.getpageKey();
  	String blFlag=Page.getpageKey2();
	int INSYEAR=Page.getipageKey();
	GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();
	
	GGGL_JYDW_JYQK.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JYQK.setINSYEAR(INSYEAR);
	GGGL_JYDW_JYQK.doSelect();

  	String SIGN = Page.getpageKey1();
 %>
<html>
<head>
<title>������Ϣ��¼</title>
</head>
<body>
<form name="form1" method="POST" action='ggxkz_blxx_action.jsp' target="editframe">
<input type="hidden" name="PRIPID" value=<%=ADBULICNO%>>
<input type="hidden" name="ANCHEYEAR" value=<%=INSYEAR%>>
<input type="hidden" name="DJJG">
<input type="hidden" name="ENTTYPE" value="ZGJC">
<%if("1".equals(blFlag)) {//������¼�ļ�¼��״̬Ĭ��Ϊ��Ԥ��ͨ����%>
<input type="hidden" name="STATUS" value="2">
<%} %>
<br>
<table border="1" width="100%" cellpadding="0" cellspacing="0">
<CAPTION>��Ӫ��Ϣ��¼</CAPTION>
   <tr>
   	<td width="80px" class="lc1" rowspan="4">�������</td>
    <td class="lc1" nowrap="nowrap">��λ����</td>   
	<td class="lc2"><input type="text" name="ENTNAME" title="��λ����"  maxlength=50 style="width:200px;">&nbsp;<!--  font color=red>*</font --></td> 
   
    <td class="lc1" nowrap="nowrap">��澭Ӫ���֤��</td>   
	<td class="lc2"><input type="text" name="ENTREGNO" title="Ӫҵִ��ע���(���澭Ӫ���֤��)"  maxlength=15>&nbsp;<!--  font color=red>*</font --></td> 
	<td class="lc1">����������(������)</td>
    <td class="lc2">
       <input type="text" name="LEGREFEREE" title="����������(������)"  maxlength=25 >&nbsp;<!--  font color=red>*</font -->
    </td>
   </tr>
   <tr>
     <td class="lc1">ע���ʱ�</td>   
	<td class="lc2">
	<input type="text" name="REGCAPITAL" id="REGCAPITAL" title="ע���ʱ�" size="15" maxlength=14  datatype=NUM>��Ԫ&nbsp;<!--  font color=red>*</font --></td>  
	<td class="lc1">ס��</td>   
	<td class="lc2" colspan=3>
	<input type="text" name="ENTADRESS" title="ס��"  maxlength=100 style="width:350px;">&nbsp;<!--  font color=red>*</font --></td> 	
	</tr>
   <tr>    	
	<td class="lc1">��λ����</td>   
	<td class="lc2">
	<select id="ENTTYPE" name="ENTPRO"  title="��λ����" style="width:100px;">
	<option value=""></option>	
	<option value="1">������ҵ</option>
    <option value="2">������ҵ</option>
    <option value="3">������ҵ</option>
    <option value="4">������ҵ</option>   
    <option value="5">˽Ӫ��ҵ</option>  
    <option value="6">���幤�̻�</option>  
    <option value="7">����Ͷ����ҵ</option>  
    <option value="8">����</option>
	</select>&nbsp;<!--  font color=red>*</font -->
	</td>
	
    <td class="lc1">��λ����</td>   
	<td class="lc2">
	<select id="ENTCLASS" name="ENTCLASS"  title="��λ����" style="width:100px;">
	<option value=""></option>
    <option value="30">����̨</option>
    <option value="40">�㲥��̨</option>
    <option value="50">����</option>
    <option value="60">�ڿ���</option>
    <option value="70">��վ</option>
    <option value="80">����</option>
	</select>&nbsp;<!--  font color=red>*</font -->
	</td>
	 <td class="lc1" nowrap="nowrap" >�����ҵ���ʵȼ�</td>   
	<td class="lc2" colspan=2><input type="text" name="QUAGRADE" title="�����ҵ���ʵȼ�" maxlength=25></td> 
	</tr>
	<tr>
	<td class="lc1">��ϵ��</td>
    <td class="lc2">
       <input type="text" name="LINKMAN" title="��ϵ��"  maxlength=25 >&nbsp;<!--  font color=red>*</font -->
    </td>
    
	<td class="lc1">��ϵ�˵绰</td>   
	<td class="lc2"><input type="text" name="FILLTEL" title="��ϵ�˵绰" size="15" maxlength=20  >&nbsp;<!--  font color=red>*</font --></td> 
	
	<td class="lc1">��������</td>   
	<td class="lc2"><input type="text" name="POSTCODE" title="��������" datatype=int size="15" maxlength=6 >&nbsp;<!--  font color=red>*</font --></td> 
   </tr></table>
   <br/>
   <table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr>
    <td width="80px" class="lc1" rowspan="7">��澭Ӫ��</td>
    <td class="lc1">ҩƷ��Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="MEDI" id="jye1" title="ҩƷ��Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
	
	<td class="lc1">ʳƷ��Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="FOOD" id="jye2" title="ʳƷ��Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
  
    <td class="lc1">����ʳƷ��Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="HTHFOOD" id="jye3" title="����ʳƷ��Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>  
   </tr>
   <tr>   
    <td class="lc1">��ױƷ��Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="MAQUI" id="jye4" title="��ױƷ��Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
	
	<td class="lc1">����ҵ��Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="BEACUL" id="jye5" title="����ҵ��Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
   
    <td class="lc1">ҽ����е��Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="MEDAPP" id="jye6" title="ҽ����е��Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>  
   </tr>
   <tr>  
    <td class="lc1">ҽ�Ʒ���Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="HTHCARPRO" id="jye7" title="ҽ�Ʒ���Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
	
	<td class="lc1">�̲ݾ�Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="TOBACCO" id="jye8" title="�̲ݾ�Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
   
    <td class="lc1">���ྭӪ��</td>   
	<td class="lc2">
	<input type="text" name="WINE" id="jye9" title="���ྭӪ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
   </tr>
   <tr>  
    <td class="lc1">������Ƹ��Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="ADMREC" id="jye10" title="������Ƹ��Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
	
	<td class="lc1">���ز���Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="REAEST" id="jye11" title="���ز���Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
   
    <td class="lc1">ũ�ʾ�Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="AGRMAT" id="jye12" title="ũ�ʾ�Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>  
   </tr>
   <tr>
    <td class="lc1">����ҵ��Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="SERVICE" id="jye13" title="����ҵ��Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
	
	<td class="lc1">��Ϣ��ҵ��Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="INFORIND" id="jye14" title="��Ϣ��ҵ��Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
   
    <td class="lc1">���ڱ��վ�Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="FININS" id="jye15" title="���ڱ��վ�Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
   </tr>
   <tr>
    <td class="lc1">������Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="AUTOMAN" id="jye16" title="������Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
	
	<td class="lc1">���õ�����Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="CONEQU" id="jye17" title="���õ�����Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
  
    <td class="lc1">��װ���ξ�Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="CLOTH" id="jye18" title="��װ���ξ�Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>  
   </tr>
   <tr>
    <td class="lc1">������Ӫ��</td>   
	<td class="lc2">
	<input type="text" name="ELSBUSTUR" id="jye19" title="������Ӫ��" size="15" maxlength=14 datatype=NUM onblur="sumjye()">��Ԫ</td>
   
    <td class="lc1">��澭Ӫ��ϼ�</td>   
	<td class="lc2" colspan=3>
	<input type="text" name="BUSTUR" id="BUSTUR" title="��澭Ӫ��ϼ�" size="15" maxlength=14 datatype=NUM  disabled>��Ԫ&nbsp;<!--  font color=red>*</font --></td>   
   </tr>
  </table><br/>
   <table border="1" width="100%" cellpadding="0" cellspacing="0">
     <tr>
		<td class="lc1">�̶���ʽӡˢƷ��Ӫ��</td>   
		<td class="lc2">
		<input type="text" name="PRETION" title="�̶���ʽӡˢƷ��Ӫ��" size="15" maxlength=14 datatype=NUM>��Ԫ</td>  
	    
	    <td class="lc1">�����澭Ӫ��</td>   
		<td class="lc2">
		<input type="text" name="OUTAD" title="�����澭Ӫ��" size="15" maxlength=14 datatype=NUM>��Ԫ</td>
	
		<td class="lc1">�����˰��</td>   
		<td class="lc2">
		<input type="text" name="RATAL" title="�����˰��" size="15" maxlength=14 datatype=NUM >��Ԫ&nbsp;<!--  font color=red>*</font --></td>
     </tr>
     <tr>
		<td class="lc1">���Ӫҵ����</td>   
		<td class="lc2">
		<input type="text" name="OPRAINCOME" title="���Ӫҵ����" size="15" maxlength=14 datatype=NUM >��Ԫ&nbsp;<!--  font color=red>*</font --></td>
	
	    <td class="lc1">������Ӫҵ����</td>   
		<td class="lc2" colspan=3>
		<input type="text" name="OUTOPRAINCOME" title="������Ӫҵ����" size="15" maxlength=14 datatype=NUM>��Ԫ</td>  
     </tr>
   </table><br/>
   <table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr>
    <td width="80px" class="lc1" rowspan="3">�����Ļ�����ý����</td>
	<td class="lc1">չʾ��</td>   
	<td class="lc2">
	<input type="text" name="SHOWCARD" id="mj1" title="չʾ��" size="15" datatype=INT onblur="summjnum()">��</td>

    <td class="lc1">����</td>   
	<td class="lc2">
	<input type="text" name="LIGHTBOX" id="mj2" title="����" size="15" datatype=INT onblur="summjnum()">��</td>
	
	<td class="lc1">������ʾ��</td>   
	<td class="lc2">
	<input type="text" name="ELECSIGNS" id="mj3" title="������ʾ��" size="15" datatype=INT onblur="summjnum()">��</td>
   </tr>
   <tr>
	<td class="lc1">�޺��</td>   
	<td class="lc2">
	<input type="text" name="NENOLIGHT" id="mj4" title="�޺��" size="15" datatype=INT onblur="summjnum()">��</td>

    <td class="lc1">��ͨ����</td>   
	<td class="lc2">
	<input type="text" name="VEHICLE" id="mj5" title="��ͨ����" size="15" datatype=INT onblur="summjnum()">��</td>
	
	<td class="lc1">����</td>   
	<td class="lc2">
	<input type="text" name="OTHERNUM" id="mj6" title="����" size="15" datatype=INT onblur="summjnum()">��</td>
   </tr>
   <tr>
	<td class="lc1">������ý������ܼ�</td>   
	<td class="lc2" colspan=5>
	<input type="text" name="MEDINUM" id="MEDINUM" title="������ý������ܼ�" size="15" datatype=INT  disabled>��&nbsp;<!--  font color=red>*</font --></td>
  </tr></table><br/>
  <table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr>
    <td width="80px" class="lc1" rowspan="2">��ҵ��Ա</td>
    <td class="lc1">������Ա</td>   
	<td class="lc2">
	<input type="text" name="MANNUM" id="ry1" title="������Ա" size="15" datatype=INT onblur='sumrynum()'>��</td>
	
	<td class="lc1">ҵ����Ա</td>   
	<td class="lc2">
	<input type="text" name="WORNUM" id="ry2" title="ҵ����Ա" size="15" datatype=INT onblur='sumrynum()'>��</td>
	
	<td class="lc1">������Ա</td>   
	<td class="lc2">
	<input type="text" name="ELSEMPNUM" id="ry3" title="������Ա" size="15" datatype=INT onblur='sumrynum()'>��</td>
   </tr>
    <tr>
	<td class="lc1">��ҵ��Ա�ϼ�</td>   
	<td class="lc2" colspan=5>
	<input type="text" name="EMPNUM" id="EMPNUM" title="��ҵ��Ա�ϼ�" size="15" datatype=INT  disabled>��&nbsp;<!--  font color=red>*</font --></td>
   </tr></table>
   <br/><table border="1" width="100%" cellpadding="0" cellspacing="0">
   <tr>   
    <td width="80px" class="lc1" nowrap="nowrap">������</td>   
	<td class="lc2"><input type="text" name="MANAGER" title="������"  maxlength=25>&nbsp;<!--  font color=red>*</font --></td>
	
	<td class="lc1" nowrap="nowrap">�����</td>   
	<td class="lc2"><input type="text" name="FILLMAN" title="�����"  maxlength=25>&nbsp;<!--  font color=red>*</font --></td> 
    
    <td class="lc1" nowrap="nowrap">�����</td>   
	<td class="lc2">
	<input type="text" name="FILLDAT" title="�����"  maxlength=10 datetype=DATE onclick="dropdowndate(this)">&nbsp;<!--  font color=red>*</font --></td> 
   </tr>
<tr>
	<td class="lc2" colspan="6">
	<p align="left" style="font-color: #000080;font-size: 9pt;">˵����
    1���к�ɫ<font color=red >*</font>��ʾ����ĿΪ�����<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2����澭Ӫ��ϼơ�������ý������ܼơ���ҵ��Ա�ϼƵȣ��������д����Ϣ�Զ����㣬�����ֹ���д��
	<br>
	</p></td>   
 </tr>
</table>
<br>
<%
if(SIGN.equals("1")){

}else{
%>
<table border="1" width="100%">
	<tr>
		<td align=center>
		<input name="btSave" type="submit" value="��  ��" class="butontType"></td>
	</tr>
</table>
<%}%>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
<script type="text/javascript">
//�����ҵ��Ա�ϼ�=������Ա+ҵ����Ա+������Ա
function sumrynum()
{
	var rysum=0;//��ҵ��Ա�ϼ�
	for(var i=1;i<=3;i++){
	  var sid="ry"+i;
	  var rynum=document.getElementById(sid).value;
	  var columname=document.getElementById(sid).title;
	  if(rynum!=null&&rynum!="")
	  {
	   if (fucCheckNUM(rynum))
	   {
		 if(rynum<0){
		    alert(columname+'�����������Ǹ�ֵ��');
			return false;
		  }
		 if (Math.abs(rynum)>999999999999)
		  {
			alert(columname+'��������ϵͳ��󾫶ȣ�');
			return false;
		  }
	   }else
	    {
		   alert(columname+'����ӦΪ���֣�');
		   return false;
	    }
	  rysum=parseInt(rysum)+parseInt(rynum);
	}
	}
	document.getElementById("EMPNUM").value=rysum;	
}
//���㷢���Ļ�����ý�����ϼ�=չʾ��+����+������ʾ��+�޺��+��ͨ����+������
function summjnum()
{
	var mjsum=0;//������ý��ϼ�
	for(var i=1;i<=6;i++){
	  var sid="mj"+i;
	  var mjnum=document.getElementById(sid).value;
	  var columname=document.getElementById(sid).title;
	  if(mjnum!=null&&mjnum!="")
	  {
	   if (fucCheckNUM(mjnum))
	   {
		 if(mjnum<0){
		    alert(columname+'�����������Ǹ�ֵ��');
			return false;
		  }
		 if (Math.abs(mjnum)>999999999999)
		  {
			alert(columname+'��������ϵͳ��󾫶ȣ�');
			return false;
		  }
	   }else
	    {
		   alert(columname+'����ӦΪ���֣�');
		   return false;
	    }
	  mjsum=parseInt(mjsum)+parseInt(mjnum);
	}
	}
	document.getElementById("MEDINUM").value=mjsum;	
}
//�����澭Ӫ��ϼ�=ҩƷ+ʳƷ+����ʳƷ+��ױƷ+����ҵ+...
function sumjye(){
    var jyesum=0;//��澭Ӫ��ϼ�
	for(var i=1;i<=19;i++){
	  var sid="jye"+i;
	  var jyenum=document.getElementById(sid).value;
	  var columname=document.getElementById(sid).title;
	  if(jyenum!=null&&jyenum!="")
	  {
	   if (fucCheckNUM(jyenum))
	   {
		 if(jyenum<0){
		    alert(columname+'�������Ǹ�ֵ��');
			return false;
		  }
		 if (Math.abs(jyenum)>999999999999)
		  {
			alert(columname+'����ϵͳ��󾫶ȣ�');
			return false;
		  }
	   }else
	    {
		   alert(columname+'ӦΪ���֣�');
		   return false;
	    }
	  jyesum=parseFloat(jyesum)+parseFloat(jyenum);
	}
	}
	document.getElementById("BUSTUR").value=jyesum.toFixed(3);	
}
function checkEMPNUM(){
   var empnum=document.getElementById("EMPNUM").value;
   if(empnum==null||empnum==""||empnum==0){
    	alert('������Ա��ҵ����Ա��������Ա�ϼƲ���Ϊ0��');
    	return false;
   }
}
</script>
</body>
</html>	
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
    ec.setUserFunction("checkEMPNUM()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%	
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	GGGL_GGJY.setPRIPID(ADBULICNO);
	GGGL_GGJY.setANCHEYEAR(INSYEAR);
	if(GGGL_GGJY.doCount()){
	   vf.setData(GGGL_GGJY.getData());
	}else{
	   vf.setFormData("ENTNAME",GGGL_JYDW_JBXX.getADBUENT());//��λ����
	   vf.setFormData("ENTREGNO",GGGL_JYDW_JBXX.getADBULICNO());//��澭Ӫ���֤��
	   vf.setFormData("ENTADRESS",GGGL_JYDW_JBXX.getDOM());//ס��
	   vf.setFormData("LEGREFEREE",GGGL_JYDW_JBXX.getLEREP());//����������
	   vf.setFormData("REGCAPITAL",GGGL_JYDW_JBXX.getREGCAP());//ע���ʱ�
	   //vf.setFormData("ENTCLASS",GGGL_JYDW_JBXX.getADTYPE());//���벻��Ӧ
	   vf.setFormData("FILLTEL",GGGL_JYDW_JBXX.getTEL());//��ϵ�绰
	   vf.setFormData("POSTCODE",GGGL_JYDW_JBXX.getPOLCODE());//��������
	   vf.setFormData("DJJG",GGGL_JYDW_JBXX.getREGORG());
	    
	   vf.setFormData("RATAL",GGGL_JYDW_JYQK.getRATAL());//��˰��
	   vf.setFormData("OPRAINCOME",GGGL_JYDW_JYQK.getADOPEINC());//���Ӫҵ����
	   vf.setFormData("OUTOPRAINCOME",GGGL_JYDW_JYQK.getHWBUSINC());//������Ӫҵ����
	   vf.setFormData("SHOWCARD",GGGL_JYDW_JYQK.getEXHPLAQUAN());//·�� չʾ��
	   vf.setFormData("LIGHTBOX",GGGL_JYDW_JYQK.getLAMPBOXQUAN());//����
	   vf.setFormData("ELECSIGNS",GGGL_JYDW_JYQK.getEDISUQUAN());//������ʾ��
	   vf.setFormData("NENOLIGHT",GGGL_JYDW_JYQK.getNELQUAN());//�޺��
	   vf.setFormData("OTHERNUM",GGGL_JYDW_JYQK.getOTHQUAN());//����  
	  
	   vf.setFormData("EMPNUM","0");
	   vf.setFormData("MEDINUM","0");
	   vf.setFormData("BUSTUR","0");
	}		
	
 	out.print(vf.ValueDefaultScript());
%>