<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="SW_JBXX" scope="page"
	class="com.macrosoft.icms.bean.SW_JBXX" />
<jsp:useBean id="SW_FZJG" scope="page"
	class="com.macrosoft.icms.bean.SW_FZJG" />
<html>
<head>
<title>˰����Ϣ����</title>
<%
	String OPENO = Page.getOPENO();
	String SIGN = Page.getSIGN(); //1�鿴��2�޸�   
	String ENTTYPE = Page.getENTTYPE();
	String XZQH = webuser.getXZQH();
	String XZQHJC = "";
			if (XZQH.equals("3700")) {
			} else {
				XZQHJC = icms.getSysDm("REGORG", XZQH + "00");
				if (XZQHJC.length() > 3) {
					XZQHJC = XZQHJC.substring(0, 3);
				}
			}
%>
<style type="text/css">
.checkbox {
	vertical-align: middle;
}
</style>
<script type="" src="<%=request.getContextPath()%>/support/basic.js"></script>
<script type="text/javascript">
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
	 if(document.getElementById("SCJYDZ")!=null){
		document.getElementById("SCJYDZ").value = Address;
		 }
	}
}
</script>
</head>
<body>
	<%@include file="top.inc"%>
	<%
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
	%>
	<form name="form1" method="POST" action='web/wsdj_sw_jbxx_action.jsp'
		target="hiddenframe">
		<input type="hidden" name="OPENO" value="<%=OPENO%>"> 
		<input type="hidden" name="PRIPID"> 
		<input type="hidden" name="SCJX"> 
		<input type="hidden" name="LSGX"> 
		<input type="hidden" name="ZGGSSWJ"> 
		<input type="hidden" name="ZGGSSWS"> 
		<input type="hidden" name="ZGDSSWJ"> 
		<input type="hidden" name="ZGDSSWS"> 
		<input type="hidden" name="GGH"> 
		<input type="hidden" name="FBS"> 

		<table width="100%" border=1 cellpadding="0" cellspacing="0">
			<tr>
				<td class="yxsm" colspan="6">&nbsp;������Ϣ</td>
			</tr>
			<tr>
				<td class="lc1" colspan="1">��˰��ʶ���</td>
				<td class="lc2"><input type="text" name="NSRSBH" size="30"
					title='��˰��ʶ���' maxlength='15' value="<%=SW_JBXX.getNSRSBH()%>"
					disabled="disabled"></td>
				<td class="lc1" colspan="1" style="width:150px;">��׼��������</td>
				<td class="lc2"><input type="text" name="PZSLJG" size="35"
					title='��׼��������' maxlength='50' value="<%=SW_JBXX.getPZSLJG()%>"
					disabled="disabled"></td>
				<td class="lc1" colspan="1" style="width:150px;">��׼����֤�����ļ���</td>
				<td class="lc2"><input type="text" name="PZSLZM" size="35"
					title='��׼����֤�����ļ���' maxlength='1000' value="<%=SW_JBXX.getPZSLZM()%>"
					disabled="disabled"></td>
			</tr>
			<tr>
				<td class="lc1">���û���ƶ�</td>
				<td class="lc2" colspan="5">
					 <select size="1" name="SYKJZD" title="���û���ƶ�" disblank style="width:192px; ">
	 				 <option value=''>��ѡ�����û���ƶ�</option>
	 				 <%=icms.getSysDmList("KJZD")%>
	 				 </select>
	 				 &nbsp;<font color=red>*</font>  
	 			</td>
			</tr>
			<tr>
				<td class="lc1" nowrap >ʵ��������Ӫ��ַ</td>   
			 	<td class="lc2" colspan="5">
									<select name="PROVINCE" title="ʡ"  onchange="writeDOM()">
										<option value='370000'>ɽ��ʡ</option>
									</select>��ʡ/ֱϽ��/��������
			 		               <select name="CITY" id="CITY" title="��" maxlength=20>
										<!--div id="CITYOPT" width='100'></div-->
										<option value='<%=XZQH+"00"%>'><%=XZQHJC%></option>
									</select>����/����/��/�����ݣ�
									<select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="��" maxlength=20>
										<!--div id="COUNTYOPT" width='100'></div-->
										<%=icms.getSysDmListByRemark("DISCOUS",XZQH) %>
									</select>����/��/�ؼ���/�죩
									 <input type="text" name="TOWN" title="��" size="23" maxlength=25 onchange="writeDOM()">����/������/��/�ֵ���
			 		                <input type="text" name="VILLAGE" title="��" size="23" maxlength=25 onchange="writeDOM()">��·/��/������
			 		                <input type="text" name="HOUSENUMBER" title="��" size="10" maxlength=25 onchange="writeDOM()">���ţ� 
			 		                <font color=red>*</font>
									<br>
									��¼���ʵ��������Ӫ��ַΪ��<input type="text" name="SCJYDZ" id="SCJYDZ" maxlength="100" disblank style="width:380px" title="ʵ��������Ӫ��ַ" >
			 		&nbsp;<font color=red>*</font>
									<font color="red">˵����</font>ʵ��������Ӫ��ַס�����밴����ĸ�ʽ��д��ϵͳ���Զ��ϲ���<br/>
			 	</td>  
			</tr>
			<tr>
				<td class="lc1" colspan="1">��Ӫ����������</td>
				<td class="lc2"><input type="text" name="JYDYZBM" size="20" datatype="INT"
					title='��Ӫ����������' maxlength='6' disblank>
					&nbsp;<font color=red>*</font></td>
				<td class="lc1" colspan="1">��Ӫ����ϵ�绰</td>
				<td class="lc2"><input type="text" name="JYDLXDH" size="35"
					title='��Ӫ����ϵ�绰' maxlength='30' disblank>
					&nbsp;<font color=red>*</font></td>
				<td class="lc1">���㷽ʽ</td>
				<td class="lc2" colspan="5">
					 <select size="1" name="HSFS" title="���㷽ʽ" disblank style="width:192px; ">
	 				 <option value=''>��ѡ����㷽ʽ</option>
	 				 <%=icms.getSysDmList("HSFS")%>
	 				 </select>
	 				 &nbsp;<font color=red>*</font>  
	 			</td>
			</tr>
			<tr>
				<td class="lc1" colspan="1">��Ȼ��Ͷ�ʱ���</td>
				<td class="lc2"><input type="text" name="ZRRTZBL" size="20" datatype="NUM"
					title='��Ȼ��Ͷ�ʱ���' maxlength='5' disblank>%
					&nbsp;<font color=red>*</font></td>
				<td class="lc1" colspan="1">����Ͷ�ʱ���</td>
				<td class="lc2"><input type="text" name="WZTZBL" size="20" datatype="NUM"
					title='����Ͷ�ʱ���' maxlength='5' disblank>%
					&nbsp;<font color=red>*</font></td>
				<td class="lc1" colspan="1">����Ͷ�ʱ���</td>
				<td class="lc2"><input type="text" name="GYTZBL" size="20" datatype="NUM"
					title='����Ͷ�ʱ���' maxlength='5'>%
					</td>
			</tr>
			<tr>
				<td class="lc1" nowrap >��վ��ַ</td>   
			 	<td class="lc2" colspan="5">
					<input type="text" name="WZWZ" id="WZWZ" maxlength="500" style="width:380px" title="��վ��ַ" >
			 	</td>  
			</tr>
			<tr>
				<td class="yxsm" colspan="6">&nbsp;�ܻ�����Ϣ</td>
			</tr>
			<tr>
				<td class="lc1" colspan="1">�ܻ�������</td>
				<td class="lc2"><input type="text" name="ZJGMC" size="40"
					title='�ܻ�������' maxlength='100'></td>
				<td class="lc1" colspan="1" style="width:150px;">�ܻ�����˰��ʶ���</td>
				<td class="lc2" colspan="3"><input type="text" name="ZJGSBH" size="40"
					title='�ܻ�����˰��ʶ���' maxlength='15' datatype="NUM"></td>
			</tr>
			<tr>
				<td class="lc1" nowrap >�ܻ���ע���ַ</td>   
			 	<td class="lc2" colspan="5">
					<input type="text" name="ZJGDZ" id="ZJGDZ" maxlength="100" style="width:380px" title="�ܻ���ע���ַ" >
			 	</td>  
			</tr>
			<tr>
				<td class="lc1" nowrap >�ܻ�����Ӫ��Χ</td>   
			 	<td class="lc2" colspan="5">
					<textarea rows="3" cols="100" name="ZJGJYFW" title="�ܻ�����Ӫ��Χ" maxlength="1000"></textarea>
			 	</td>  
			</tr>
			<tr>
				
				<td class="lc1" colspan="1">�ܻ�������������</td>
				<td class="lc2"><input type="text" name="ZJGFDDBR" size="35"
					title='�ܻ�������������' maxlength='50'></td>
				<td class="lc1" colspan="1">�ܻ�����ϵ�绰</td>
				<td class="lc2"><input type="text" name="ZJGLXDH" size="35"
					title='�ܻ�����ϵ�绰' maxlength='30' datatype="TEL"></td>
	 			<td class="lc1" colspan="1">�ܻ�����������</td>
				<td class="lc2"><input type="text" name="ZJGYZBM" size="20" datatype="INT"
					title='�ܻ�����������' maxlength='6'>
			</tr>
		</table>
		<br />
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td align=center>
<%
		if (!SIGN.equals("1")) //1 �鿴
		{
%>
		<input name="btSave" type="submit" style="cursor: pointer;" value="��  ��" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
<%
		}
		%>
		</td>
	</tr>
</table>
	</form>
<iframe HEIGHT="0" WIDTH="0" SRC="" NAME="hiddenframe" id="hiddenframe"></iframe>
<br/>
<iframe id="infoIframe" name="infoIframe" style="width:100%;height: 250px;" src="wsdj_sw_lxrxx_list.jsp">
</iframe>
	<%@include file="bottom.inc"%>
<iframe height="0" width="0" name="editframe" src="" id="editframe"
		scrolling="no" border="1" align='center' frameborder="0"></iframe>
</body>
</html>

<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());

	ValueDefault vf = new ValueDefault();
	vf.setFormName("form1");
	SW_JBXX.setOPENO(OPENO);
	//vf.setFormData("ENTNAME", GA_ZJXX.getENTNAME());

	vf.setData(SW_JBXX.getData());

	out.print(vf.ValueDefaultScript());
%>

