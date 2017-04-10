<%@page import="com.macrosoft.icms.mcgl.DOMCCC"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<%@page import="com.macrosoft.icms.gsnw.MCGL_ZHJY_ZS"%>
<%@ include file="/jspheader.inc"%>
<%@ page import="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS" %>
<html>
	<head>
		<title>
			名称预查
		</title>
<SCRIPT language="javascript">
function zhChange(){
	document.getElementById("hiddenframe").contentWindow.location.href="mc_gethypy.jsp?ENTTRA="+document.form1.ENTTRA.value;
}
function doSub(){
	var lx=document.form1.lx.value;
	var zh=document.form1.ENTTRA.value;
	var zhpy=document.form1.TRADPINY.value;	
	if(zh==""){
		alert("请录入字号！");
		return false;
	}
	if(zh.length<2){
		alert("字号长度不能小于两位！");
		return false;
	}
	if(zhpy==""){
		alert("请录入字号拼音！");
		return false;
	}
	var dgzhpy=zhpy.split(" ");
	if(dgzhpy.length<2){
		alert("字号拼音直接应有空格！如XING HUA。不能是XINGHUA！");
		return;
	}
	for(var i=0;i<dgzhpy.length;i++){
		var parent=/^[A-Z]+$/;
		if(parent.test(dgzhpy[i])){
		
		}else{
			alert("字号拼音只能是大写字母！");
			return;
		}
	}
	
	if(document.form1.hy.value==""){
		alert("请录入字号行业！");
		return false;
	}
	if(document.form1.zzxs.value==""){
		alert("请录入字号组织形式！");
		return false;
	}
	document.form1.submit();
}
function choseOne(){
	var lx=document.form1.lx.value;
	var zh=document.form1.ENTTRA.value;
	var zhpy=document.form1.TRADPINY.value;
	//if(document.form1.xzqhjx.value==""){
	//	alert("请录入行政区划！");
	//	return false;
	//}
	if(zh==""){
		alert("请录入字号！");
		return false;
	}
	if(zh.length<2){
		alert("字号长度不能小于两位！");
		return false;
	}
	if(zhpy==""){
		alert("请录入字号拼音！");
		return false;
	}
	if(document.form1.hy.value==""){
		alert("请录入字号行业！");
		return false;
	}
	if(document.form1.zzxs.value==""){
		alert("请录入字号组织形式！");
		return false;
	}
	var qymc=document.form1.xzqhjx.value+""+document.form1.ENTTRA.value+""+document.form1.hy.value+""+document.form1.zzxs.value;
	window.opener.document.form1.NAMEIND.value=document.form1.hy.value;
	if(lx=="0"){
		window.opener.document.form1.TRADPINY.value=zhpy;
		window.opener.document.form1.ENTTRA.value=zh;
		window.opener.document.form1.ENTNAME.value=qymc;
		window.opener.document.form1.NAMEIND.value=document.form1.hy.value;
	}else if(lx=="1"){
		window.opener.document.form1.TRADPINY1.value=zhpy;
		window.opener.document.form1.SPANAME1.value=zh;
		window.opener.document.form1.ENTNAME1.value=qymc;
	}else if(lx=="2"){
		window.opener.document.form1.TRADPINY2.value=zhpy;
		window.opener.document.form1.SPANAME2.value=zh;
		window.opener.document.form1.ENTNAME2.value=qymc;
	}else if(lx=="3"){
		window.opener.document.form1.TRADPINY3.value=zhpy;
		window.opener.document.form1.SPANAME3.value=zh;
		window.opener.document.form1.ENTNAME3.value=qymc;
	}
	window.close();
}
</SCRIPT>		
	</head>
	<body bgcolor="#FFFFFF" style="margin-top: 0px; margin-bottom: 0; margin-left: 15px;">
	<%
	String nametype=SysUtility.doPreProcess(request.getParameter("nametype"));
	String hy=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("hy")));
	String lx=SysUtility.doPreProcess(request.getParameter("lx"));
	String PREREGORG=SysUtility.doPreProcess(request.getParameter("djjg"));
	String ENTCLASS=SysUtility.doPreProcess(request.getParameter("ENTCLASS"));
	
	String ENTTRA=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("ENTTRA")));
	String TRADPINY=SysUtility.doPreProcess(request.getParameter("TRADPINY"));
	String zzxs=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("zzxs")));
	if(zzxs.equals("")){
		if(ENTCLASS.equals("6")){
			zzxs="专业合作社";
		}
	}
	String xzqh=webuser.getXZQH();
	String xzqhjx=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("xzqhjx")));
	String xzqhjxDisabled="";
	if(xzqhjx.equals("")){
		if(xzqh.equals("3700")){
			xzqhjx="山东";
		}
		//区划命名规则 普通申请从代码表里取
		if(nametype.equals("1")){		
			xzqhjx=icms.getSysDm("REGORG_MC",PREREGORG);
		}else if(nametype.equals("2")){
			//冠市名统一
			xzqhjx=icms.getSysDm("REGORG",xzqh+"00").substring(0,2);
		}
		//个体户排除市名字样
		if(ENTCLASS.equals("5") && xzqhjx.length()>=4){
			xzqhjx=xzqhjx.substring(3);
		}
		//特殊处理
		if(xzqhjx.equals("淄博齐鲁")||xzqhjx.equals("齐鲁")){xzqhjx="临淄区";}
	}
	
	//xzqh不可改
	if(ENTCLASS.equals("5")){
		
	}else{
		if(!xzqhjx.equals("") && xzqh.equals("3703")){
			xzqhjxDisabled="disabled";
		}
	}
	String findWay="0";
	if(nametype.equals("2")){findWay="2";}

	String ttjc="";
	if(xzqhjx.equals("")){
		ttjc="山东";
	}else{
		ttjc=xzqhjx;		
	}
	if(ttjc.length()>2){
		ttjc=ttjc.substring(0,2);
	}
	%>
	<form name="form1" method="POST" action='zhcc.jsp'>
	<input type="hidden" name="model" value="model">
	<input type="hidden" name="lx" value="<%=lx%>">
	<input type="hidden" name="nametype" value="<%=nametype%>">
	<input type="hidden" name="djjg" value="<%=PREREGORG%>">
	<input type="hidden" name="findWay" value="<%=findWay%>">
	<input type="hidden" name="ENTCLASS" value="<%=ENTCLASS%>">
		<table width=500 border="0" align="center" cellpadding=0 cellspacing=0>
			<tr>
				<td>
					<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#A4BCC9" class="text1">
						<tr>
							<td colspan="1" align="right" style="font-size: 15px;color: red;">
								您申请的名称：
							</td>
							<td id="sqqymc" colspan="4" align="left" style="font-size: 15px;color: red;"></td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td align="center">
								行政区划
							</td>
							<td align="center">
								字号
							</td>
							<td align="center">
								字号拼音
							</td>
							<td align="center">
								行业
							</td>
							<td align="center">
								组织形式
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="xzqhjx" size="20" value="<%=xzqhjx%>" title="行政区划" disblank <%=xzqhjxDisabled%>/>
							</td>
							<td>
								<input type="text" name="ENTTRA" size="20" maxlength="4" value="<%=ENTTRA%>" id="ENTTRA" title="字号" disblank onchange="zhChange()"/>
							</td>
							<td>
								<input type="text" name="TRADPINY" size="20" value="<%=TRADPINY%>" id="TRADPINY" title="字号拼音" disblank/>
							</td>
							<td>
								<input type="text" name="hy" size="20" value="<%=hy%>" title="行业" id="hy" disblank/>
							</td>
							<td>
							    <input type="text" name="zzxs" size="20" value="<%=zzxs%>"  title="组织形式"id="zzxs" disblank style="width:100px">
                                  <div style="position:absolute;"> 
                                  <span style="margin-left:-35px;width:30px;overflow:hidden;position:absolute;left:10px;top:2px"> 
                                     <select style="width:53px;margin-left:-35px" onchange="zzxs.value=this.value"> 
                                        <option value=""></option>                                         
                                        <%
                                        if(ENTCLASS.equals("6")){
                                        %>
                                        <option value="专业合作社">专业合作社</option>
                                        <%	
                                        }else{
                                        %>
                                        <option value="有限公司">有限公司</option> 
                                        <option value="股份有限公司">股份有限公司</option>
                                        <%	
                                        }
                                        %>
                                     </select> 
                                     </span>
                                  </div> 
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td>
								<font color=blue>
									如：
									<%=ttjc%>。
								</font>
							</td>
							<td>
								<font color=blue>
									如:蓝凌。字号长度不能超过4个字，如有特殊情况，请到大厅查名。
								</font>
							</td>
							<td>
								<font color=blue>
									字号拼音可自动生成，不必手工录入。如果字号为多音字，请选择正确拼音。
								</font>
							</td>
							<td>
								<font color=blue>
									如:网络工程
								</font>
							</td>
							<td>
								<font color=blue>
									如:有限公司
								</font>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td colspan="5" align="center">
								<div style="text-align: left;"><font color="red">说明：</font><br/>
									<font size="2pt">
										&nbsp;&nbsp;&nbsp;&nbsp;1、名称应当由行政区划、字号、行业、组织形式依次组成。 例如：<%=ttjc%>东方科技有限公司。其中“<%=ttjc%>”是行政区划，“东方”是字号，“科技”是行业（经营特点），“有限公司”为组织形式。
										<br />&nbsp;&nbsp;&nbsp;&nbsp;2、字号拼音都为大写字母，字号拼音直接用空格隔开。
										<br />&nbsp;&nbsp;&nbsp;&nbsp;3、请按要求正确填写申请的企业名称，然后点击"查重"按钮。
									</font>
								</div>
								<input type="button" onclick="doSub()" id="query" value=" 查    重 " />
							</td>
						</tr>
					</table>
				</td>
			</tr>
	</table>
	</form>

<%
if(request.getParameter("model")!=null && !request.getParameter("model").equals("")){

String zh=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("ENTTRA")));
String zhpy=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("TRADPINY")));
DOMCCC domccc=new DOMCCC();
String info=domccc.CheckZh(PREREGORG, nametype, zh, zhpy, xzqhjx, hy, zzxs);
out.println(info);
}
%>

<%--
//MCGL_JBXX_ZS jbxx=new MCGL_JBXX_ZS();
MCGL_ZHJY_ZS zhjy=new MCGL_ZHJY_ZS();
String zhjySql = " where BANLETTER like '%"+zh+"%' or BANLETTPINY like '%"+zhpy+"%'";//查询字号禁用
String jbxxSql = " where enttra like '%"+zh+"%' or tradpiny like '%"+zhpy+"%' ";//查询名称记录
String[] zhpyArr = zhpy.split(" ");
//根据名称类型和拟登记机关来进行名称查重
if("1".equals(nametype)){//贯地市名
	if(PREREGORG.endsWith("00")){//拟登记机关为市局
		if(zh.length()==3){
			zhjySql = " where (BANLETTER = '"+zh.substring(0,2)+"'"
			        +" or BANLETTER = '"+zh.substring(0,1)+zh.substring(2)+"'"
			        +" or BANLETTER = '"+zh.substring(1,3)+"'"
			        +" or BANLETTER = '"+zh+"'"
			        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
			        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[2]+"'"
			        +" or BANLETTPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+"'"
			        +" or BANLETTPINY = '"+zhpy+"') ";
			jbxxSql = " where (ENTTRA = '"+zh.substring(0,2)+"'"
			        +" or ENTTRA = '"+zh.substring(0,1)+zh.substring(2)+"'"
			        +" or ENTTRA = '"+zh.substring(1,3)+"'"
			        +" or ENTTRA = '"+zh+"'"
			        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
			        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[2]+"'"
			        +" or TRADPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+"'"
			        +" or TRADPINY = '"+zhpy+"')"
					+" and (NAMETYPE = '0' or NAMETYPE = '1')";
		}else if(zh.length()==4){
			zhjySql = " where (BANLETTER = '"+zh.substring(0,2)+"'"
			        +" or BANLETTER = '"+zh.substring(2,4)+"'"
			        +" or BANLETTER = '"+zh.substring(0,3)+"'"
			        +" or BANLETTER = '"+zh.substring(1,4)+"'"
			        +" or BANLETTER = '"+zh+"'"
			        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
			        +" or BANLETTPINY = '"+zhpyArr[2]+" "+zhpyArr[3]+"'"
			        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+" "+zhpyArr[2]+"'"
			        +" or BANLETTPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+" "+zhpyArr[3]+"'"
			        +" or BANLETTPINY = '"+zhpy+"') ";
			jbxxSql = " where (ENTTRA = '"+zh.substring(0,2)+"'"
			        +" or ENTTRA = '"+zh.substring(2,4)+"'"
			        +" or ENTTRA = '"+zh.substring(0,3)+"'"
			        +" or ENTTRA = '"+zh.substring(1,4)+"'"
			        +" or ENTTRA = '"+zh+"'"
			        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
			        +" or TRADPINY = '"+zhpyArr[2]+" "+zhpyArr[3]+"'"
			        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+" "+zhpyArr[2]+"'"
			        +" or TRADPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+" "+zhpyArr[3]+"'"
			        +" or TRADPINY = '"+zhpy+"')"
			        +" and (NAMETYPE = '0' or NAMETYPE = '1')";
		}
	}else{//拟登记机关为分局
		if(zh.length()==3){
			zhjySql = " where (BANLETTER = '"+zh.substring(0,2)+"'"
			        +" or BANLETTER = '"+zh.substring(0,1)+zh.substring(2)+"'"
			        +" or BANLETTER = '"+zh.substring(1,3)+"'"
			        +" or BANLETTER = '"+zh+"'"
			        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
			        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[2]+"'"
			        +" or BANLETTPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+"'"
			        +" or BANLETTPINY = '"+zhpy+"') ";
			jbxxSql = " where (ENTTRA = '"+zh.substring(0,2)+"'"
			        +" or ENTTRA = '"+zh.substring(0,1)+zh.substring(2)+"'"
			        +" or ENTTRA = '"+zh.substring(1,3)+"'"
			        +" or ENTTRA = '"+zh+"'"
			        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
			        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[2]+"'"
			        +" or TRADPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+"'"
			        +" or TRADPINY = '"+zhpy+"')"
			 		+" and ((NAMETYPE = '0' or NAMETYPE = '1')"
		        	+" or (NAMETYPE = '2' and PREREGORG='"+PREREGORG+"'))";
		}else if(zh.length()==4){
			zhjySql = " where (BANLETTER = '"+zh.substring(0,2)+"'"
			        +" or BANLETTER = '"+zh.substring(2,4)+"'"
			        +" or BANLETTER = '"+zh.substring(0,3)+"'"
			        +" or BANLETTER = '"+zh.substring(1,4)+"'"
			        +" or BANLETTER = '"+zh+"'"
			        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
			        +" or BANLETTPINY = '"+zhpyArr[2]+" "+zhpyArr[3]+"'"
			        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+" "+zhpyArr[2]+"'"
			        +" or BANLETTPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+" "+zhpyArr[3]+"'"
			        +" or BANLETTPINY = '"+zhpy+"') ";
			jbxxSql = " where (ENTTRA = '"+zh.substring(0,2)+"'"
			        +" or ENTTRA = '"+zh.substring(2,4)+"'"
			        +" or ENTTRA = '"+zh.substring(0,3)+"'"
			        +" or ENTTRA = '"+zh.substring(1,4)+"'"
			        +" or ENTTRA = '"+zh+"'"
			        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
			        +" or TRADPINY = '"+zhpyArr[2]+" "+zhpyArr[3]+"'"
			        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+" "+zhpyArr[2]+"'"
			        +" or TRADPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+" "+zhpyArr[3]+"'"
			        +" or TRADPINY = '"+zhpy+"')"
			 		+" and ((NAMETYPE = '0' or NAMETYPE = '1')"
		        	+" or (NAMETYPE = '2' and PREREGORG='"+PREREGORG+"'))";
		}
	}
}else if("2".equals(nametype)){//贯区县名
	if(zh.length()==3){
		zhjySql = " where (BANLETTER = '"+zh.substring(0,2)+"'"
		        +" or BANLETTER = '"+zh.substring(0,1)+zh.substring(2)+"'"
		        +" or BANLETTER = '"+zh.substring(1,3)+"'"
		        +" or BANLETTER = '"+zh+"'"
		        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
		        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[2]+"'"
		        +" or BANLETTPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+"'"
		        +" or BANLETTPINY = '"+zhpy+"')";
		jbxxSql = " where (ENTTRA = '"+zh.substring(0,2)+"'"
		        +" or ENTTRA = '"+zh.substring(0,1)+zh.substring(2)+"'"
		        +" or ENTTRA = '"+zh.substring(1,3)+"'"
		        +" or ENTTRA = '"+zh+"'"
		        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
		        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[2]+"'"
		        +" or TRADPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+"'"
		        +" or TRADPINY = '"+zhpy+"')"
				+" and PREREGORG='"+PREREGORG+"'";
	}else if(zh.length()==4){
		zhjySql = " where (BANLETTER = '"+zh.substring(0,2)+"'"
		        +" or BANLETTER = '"+zh.substring(2,4)+"'"
		        +" or BANLETTER = '"+zh.substring(0,3)+"'"
		        +" or BANLETTER = '"+zh.substring(1,4)+"'"
		        +" or BANLETTER = '"+zh+"'"
		        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
		        +" or BANLETTPINY = '"+zhpyArr[2]+" "+zhpyArr[3]+"'"
		        +" or BANLETTPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+" "+zhpyArr[2]+"'"
		        +" or BANLETTPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+" "+zhpyArr[3]+"'"
		        +" or BANLETTPINY = '"+zhpy+"') ";
		jbxxSql = " where (ENTTRA = '"+zh.substring(0,2)+"'"
		        +" or ENTTRA = '"+zh.substring(2,4)+"'"
		        +" or ENTTRA = '"+zh.substring(0,3)+"'"
		        +" or ENTTRA = '"+zh.substring(1,4)+"'"
		        +" or ENTTRA = '"+zh+"'"
		        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+"'"
		        +" or TRADPINY = '"+zhpyArr[2]+" "+zhpyArr[3]+"'"
		        +" or TRADPINY = '"+zhpyArr[0]+" "+zhpyArr[1]+" "+zhpyArr[2]+"'"
		        +" or TRADPINY = '"+zhpyArr[1]+" "+zhpyArr[2]+" "+zhpyArr[3]+"'"
		        +" or TRADPINY = '"+zhpy+"')"
				+" and PREREGORG='"+PREREGORG+"'";
	}
}

ArrayList jylist=zhjy.getList(zhjySql);
ArrayList list=jbxx.getList(jbxxSql);
if(jylist.size()<1&&list.size()<1){
%>
您所申请的名称字号目前无申请使用记录，如果确认用此字号，请点击<input type='button' value='用此字号申请名称' onclick='choseOne();'/> 继续填写其他申请信息。
<%
}else{
%>
<font color="red">警告！您所申请的名称中的字号存在以下申请使用记录，如果用此字号申请名称，将有可能驳回您的此次申请，确定仍然用此字号申请名称请点击
<input type='button' value='用此字号申请名称' onclick='choseOne();'/> 继续填写其他申请信息。</font>
<br/><br/>
<table width="100%" border="1">
<caption>禁用字号</caption>
<tr class="tc">
<td>字号</td>
<td>字号拼音</td>
<td>保护/禁用说明</td>
<td>保护/禁用类型</td>
</tr>
<%
for(int i=0;i<jylist.size();i++){
	zhjy=(MCGL_ZHJY_ZS)jylist.get(i);
%>
<tr class="lc1">
<td><%=zhjy.getBANLETTER() %></td>
<td><%=zhjy.getBANLETTPINY() %></td>
<td><%=zhjy.getBANEXP() %></td>
<td><%=icms.getSysDm("BANTYPE",zhjy.getBANTYPE()) %></td>
</tr>
<%
}
%>
</table>
<br><br>
<table width="100%" border="1">
<caption>相似相近名称</caption>
<tr class="tc">
<td>字号</td>
<td>字号拼音</td>
<td>企业名称</td>
</tr>
<%
for(int i=0;i<list.size();i++){
jbxx=(MCGL_JBXX_ZS)list.get(i);
%>
<tr class="lc1">
<td><%=jbxx.getENTTRA() %></td>
<td><%=jbxx.getTRADPINY() %></td>
<td><%=jbxx.getENTNAME() %></td>
</tr>
<%
}
%>
</table>

<%}
}
%>		
--%>
	
<IFRAME HEIGHT="0" WIDTH="0" SRC="" NAME="hiddenframe" id="hiddenframe"></IFRAME>
	</body>
</html>
 <%--
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	vf.setData(request);
	out.print(vf.ValueDefaultScript());
--%>
