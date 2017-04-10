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
<title>税务信息补充</title>
<%
	String OPENO = Page.getOPENO();
	String SIGN = Page.getSIGN(); //1查看，2修改   
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
				<td class="yxsm" colspan="6">&nbsp;基本信息</td>
			</tr>
			<tr>
				<td class="lc1" colspan="1">纳税人识别号</td>
				<td class="lc2"><input type="text" name="NSRSBH" size="30"
					title='纳税人识别号' maxlength='15' value="<%=SW_JBXX.getNSRSBH()%>"
					disabled="disabled"></td>
				<td class="lc1" colspan="1" style="width:150px;">批准设立机关</td>
				<td class="lc2"><input type="text" name="PZSLJG" size="35"
					title='批准设立机关' maxlength='50' value="<%=SW_JBXX.getPZSLJG()%>"
					disabled="disabled"></td>
				<td class="lc1" colspan="1" style="width:150px;">批准设立证明或文件号</td>
				<td class="lc2"><input type="text" name="PZSLZM" size="35"
					title='批准设立证明或文件号' maxlength='1000' value="<%=SW_JBXX.getPZSLZM()%>"
					disabled="disabled"></td>
			</tr>
			<tr>
				<td class="lc1">适用会计制度</td>
				<td class="lc2" colspan="5">
					 <select size="1" name="SYKJZD" title="适用会计制度" disblank style="width:192px; ">
	 				 <option value=''>请选择适用会计制度</option>
	 				 <%=icms.getSysDmList("KJZD")%>
	 				 </select>
	 				 &nbsp;<font color=red>*</font>  
	 			</td>
			</tr>
			<tr>
				<td class="lc1" nowrap >实际生产经营地址</td>   
			 	<td class="lc2" colspan="5">
									<select name="PROVINCE" title="省"  onchange="writeDOM()">
										<option value='370000'>山东省</option>
									</select>（省/直辖市/自治区）
			 		               <select name="CITY" id="CITY" title="市" maxlength=20>
										<!--div id="CITYOPT" width='100'></div-->
										<option value='<%=XZQH+"00"%>'><%=XZQHJC%></option>
									</select>（市/地区/盟/自治州）
									<select name="COUNTY" id="COUNTY" onchange="writeDOM()" title="县" maxlength=20>
										<!--div id="COUNTYOPT" width='100'></div-->
										<%=icms.getSysDmListByRemark("DISCOUS",XZQH) %>
									</select>（区/县/县级市/旗）
									 <input type="text" name="TOWN" title="乡" size="23" maxlength=25 onchange="writeDOM()">（乡/民族乡/镇/街道）
			 		                <input type="text" name="VILLAGE" title="村" size="23" maxlength=25 onchange="writeDOM()">（路/村/社区）
			 		                <input type="text" name="HOUSENUMBER" title="号" size="10" maxlength=25 onchange="writeDOM()">（号） 
			 		                <font color=red>*</font>
									<br>
									您录入的实际生产经营地址为：<input type="text" name="SCJYDZ" id="SCJYDZ" maxlength="100" disblank style="width:380px" title="实际生产经营地址" >
			 		&nbsp;<font color=red>*</font>
									<font color="red">说明：</font>实际生产经营地址住所地请按上面的格式填写，系统会自动合并。<br/>
			 	</td>  
			</tr>
			<tr>
				<td class="lc1" colspan="1">经营地邮政编码</td>
				<td class="lc2"><input type="text" name="JYDYZBM" size="20" datatype="INT"
					title='经营地邮政编码' maxlength='6' disblank>
					&nbsp;<font color=red>*</font></td>
				<td class="lc1" colspan="1">经营地联系电话</td>
				<td class="lc2"><input type="text" name="JYDLXDH" size="35"
					title='经营地联系电话' maxlength='30' disblank>
					&nbsp;<font color=red>*</font></td>
				<td class="lc1">核算方式</td>
				<td class="lc2" colspan="5">
					 <select size="1" name="HSFS" title="核算方式" disblank style="width:192px; ">
	 				 <option value=''>请选择核算方式</option>
	 				 <%=icms.getSysDmList("HSFS")%>
	 				 </select>
	 				 &nbsp;<font color=red>*</font>  
	 			</td>
			</tr>
			<tr>
				<td class="lc1" colspan="1">自然人投资比例</td>
				<td class="lc2"><input type="text" name="ZRRTZBL" size="20" datatype="NUM"
					title='自然人投资比例' maxlength='5' disblank>%
					&nbsp;<font color=red>*</font></td>
				<td class="lc1" colspan="1">外资投资比例</td>
				<td class="lc2"><input type="text" name="WZTZBL" size="20" datatype="NUM"
					title='外资投资比例' maxlength='5' disblank>%
					&nbsp;<font color=red>*</font></td>
				<td class="lc1" colspan="1">国有投资比例</td>
				<td class="lc2"><input type="text" name="GYTZBL" size="20" datatype="NUM"
					title='国有投资比例' maxlength='5'>%
					</td>
			</tr>
			<tr>
				<td class="lc1" nowrap >网站网址</td>   
			 	<td class="lc2" colspan="5">
					<input type="text" name="WZWZ" id="WZWZ" maxlength="500" style="width:380px" title="网站网址" >
			 	</td>  
			</tr>
			<tr>
				<td class="yxsm" colspan="6">&nbsp;总机构信息</td>
			</tr>
			<tr>
				<td class="lc1" colspan="1">总机构名称</td>
				<td class="lc2"><input type="text" name="ZJGMC" size="40"
					title='总机构名称' maxlength='100'></td>
				<td class="lc1" colspan="1" style="width:150px;">总机构纳税人识别号</td>
				<td class="lc2" colspan="3"><input type="text" name="ZJGSBH" size="40"
					title='总机构纳税人识别号' maxlength='15' datatype="NUM"></td>
			</tr>
			<tr>
				<td class="lc1" nowrap >总机构注册地址</td>   
			 	<td class="lc2" colspan="5">
					<input type="text" name="ZJGDZ" id="ZJGDZ" maxlength="100" style="width:380px" title="总机构注册地址" >
			 	</td>  
			</tr>
			<tr>
				<td class="lc1" nowrap >总机构经营范围</td>   
			 	<td class="lc2" colspan="5">
					<textarea rows="3" cols="100" name="ZJGJYFW" title="总机构经营范围" maxlength="1000"></textarea>
			 	</td>  
			</tr>
			<tr>
				
				<td class="lc1" colspan="1">总机构法定代表人</td>
				<td class="lc2"><input type="text" name="ZJGFDDBR" size="35"
					title='总机构法定代表人' maxlength='50'></td>
				<td class="lc1" colspan="1">总机构联系电话</td>
				<td class="lc2"><input type="text" name="ZJGLXDH" size="35"
					title='总机构联系电话' maxlength='30' datatype="TEL"></td>
	 			<td class="lc1" colspan="1">总机构邮政编码</td>
				<td class="lc2"><input type="text" name="ZJGYZBM" size="20" datatype="INT"
					title='总机构邮政编码' maxlength='6'>
			</tr>
		</table>
		<br />
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td align=center>
<%
		if (!SIGN.equals("1")) //1 查看
		{
%>
		<input name="btSave" type="submit" style="cursor: pointer;" value="保  存" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
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

