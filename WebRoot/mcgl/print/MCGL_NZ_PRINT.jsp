<%@ page contentType="text/html;charset=GBK"%>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="/error.jsp"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@page import="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ" %>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="MCGL_JBXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>
<jsp:useBean id="MCGL_TZRXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>

<%	
	
	//String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	MCGL_JBXX.setOPENO(OPENO);
	MCGL_JBXX.doSelect();
	
	QYDJ_SQWT.setOPENO(OPENO);
	QYDJ_SQWT.doSelect();
	String checkBox = "□";
    String selected = "√";
%>
<html>
	<head>
		<link style="text/css" rel="stylesheet" href="css/print.css"/>
		<style>table{border-collapse: collapse;}
</style>
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-before: always;}
tr{font-size: 12pt;}
.tr9{font-size: 9pt;}
.tdprint{text-align: left;text-indent: 2;}
</style>
		<%out.print(pageshow.pagesetup_default()); %>
		<title>企业名称预先核准申请书</title>
	</head>
	<body onload="pagesetup_default()" style="width:100%;height: 100%;">
	<CENTER>
	<font style="text-align: right; " class="noPrint">
			<input type="button" value="打印申请书" onclick="window.print();"  class="noPrint">
			<input name=back type="button" value="关   闭" onclick="window.close();"  class="noPrint">
		</font>
			<font color="red" style="font-size: 9pt;" class="noPrint">
				(请用A4纸打印,在打印之前请在IE->文件->页面设置“中将”页眉"和“页脚”清空)
			</font>
	</CENTER>
	
	<CENTER>
		<span class="title" >
			企业名称预先核准申请书
		</span>
		<br/>
		<font style="text-align: center;font-size:9pt;">注：请仔细阅读本申请书《填写说明》，按要求填写。</font>
		</CENTER>
		
			<table frame=void width="100%" align="center" bordercolor="#000000">
				<tr>
				<td colspan="4" style="font-size: 14pt;" class="title">
					√ 企业设立名称预先核准
				</td>
				
				</tr>
					<tr>
						<td>
							申请企业名称
						</td>
						<td colspan="3">
							<%=MCGL_JBXX.getENTNAME() %>
						</td>
					</tr>	
					<tr>
						<td rowspan="3">
							备选<br/>企业字号
						</td>
						<td  colspan="3">
							<font style="float: left">1.</font><%=MCGL_JBXX.getENTNAME1() %>
						</td>
					</tr>	
					<tr>
						<td colspan="3"> 
							<font style="float: left">2.</font><%=MCGL_JBXX.getENTNAME2() %>
						</td>
					</tr>	
					<tr>
						<td colspan="3">
							<font style="float: left">3.</font><%=MCGL_JBXX.getENTNAME3() %>
						</td>
							<tr>
						<td>
							企业住所地
						</td>
						<td colspan="3">
					 <%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",MCGL_JBXX.getPROVINCE().length()==6?MCGL_JBXX.getPROVINCE():MCGL_JBXX.getPROVINCE()+"00"),"center",6)%>（市/自治区）<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",MCGL_JBXX.getCITY()),"center",6)%>（地区/盟/自治州）<%=SysSystem.toUnderlineStr(icms.getSysDm("DISCOUS",MCGL_JBXX.getCOUNTY()),"center",8)%> （自治县/旗/自治旗/市/区）
						</td>
					</tr>
					
						<tr>
						<td>
							注册资本（金）
						</td>
						<td>
						<font style="float: right"></font><%=MCGL_JBXX.getREGCAP() %>（万元）
						</td>
						<td>
							企业类型
						</td>
						<td>
						<%= icms.getSysDm("ENTTYPE",MCGL_JBXX.getENTTYPE()) %>
						</td>
					</tr>
				<tr>
						<td style="height: 150px;">
							经营范围
						</td>
						<td colspan="3" style="font-size:12px">
					
						<%=MCGL_JBXX.getBUSSCOPE() %>
						
						</td>
					</tr>
			
				<tr>
				 <td> 投资人 </td>
				 <td colspan="3" style="border-style:none;border-width:0px;">
				 <table border="0" style="border-style:none;border-width:0px;">
				 <tr>
				 <td>
						姓名或名称
					</td>
					<td colspan="2">
						证照号码
					</td>
				 </tr>
				 
					<%
					 List tzrxx=MCGL_TZRXX.getList(" WHERE OPENO='"+OPENO+"'");
					 int temp = tzrxx.size();
					for(int i = 0 ;i<tzrxx.size();i++){
					MCGL_TZRXX_SQ bean = (MCGL_TZRXX_SQ)tzrxx.get(i);
					%>
					<tr>
						<td>
						<%=bean.getINV() %>
						</td>
						<td colspan="2">
						<%
						if(bean.getINVTYPE().equals("20") || bean.getINVTYPE().equals("21") || bean.getINVTYPE().equals("22") ||bean.getINVTYPE().equals("35") ||bean.getINVTYPE().equals("36")){
							out.println(bean.getCERNO());
						}else{
							out.println(bean.getBLICNO());
						}
						%>							
						</td>
				   
					</tr>
				
	 <%}
	            if(8-temp>0){
	            
				for(int j=0;j<8-temp;j++){
					out.print("<tr><td></td><td></td></tr>");
				 }
} %> 
				 </table>
				 </td>
				 </tr>
			</table>
			
	<br><p class="PageNext"></p> <br>
	
<table style="width: 100%;" >
				<tr>
				<td colspan="6" style="font-size: 14pt;text-align: center;height:22px;" class="title">
			□已核准名称项目调整（投资人除外）
				</td>
				</tr>
				<tr> 
				
				<td colspan="2" style="width:15%;height:22px">已核准名称</td>
				
				<td colspan="2" style="width:35%">  </td>
				<td style="width:15%">通知书文号</td>
				
				<td style="width:35%">  </td>
				</tr>
				<tr> 
				<td colspan="2" style="height:22px;">拟调整项目</td>
				
				<td colspan="2">原申请内容</td>
				<td colspan="2">拟调整内容</td>
				
				</tr>
				
				<tr>
				<td colspan="2" style="height:22px;"></td><td colspan="2"></td><td colspan="2"></td>
				
			
				</tr>
				<tr>
				<td colspan="2"></td><td colspan="2"></td><td colspan="2"></td>
				
			
				</tr>
				<tr>
				<td colspan="2"></td><td colspan="2"></td><td colspan="2"></td>
				
			
				</tr>
				
						<tr>
				<td colspan="6" style="font-size: 14pt;height:22px;" class="title">
			□已核准名称延期
				</td>
				</tr>
				<tr> 
				
				<td colspan="2" style="height:22px;">已核准名称</td>
				
				<td colspan="2">  </td>
				<td>通知书文号</td>
				
				<td>  </td>
				
				
				</tr>
					<tr> 
				
				<td colspan="2" style="height:22px;">原有效期</td>
				
				<td colspan="2">  </td>
				<td height=20>有效期延至</td>
				
				<td nowrap>___年___月 ___日 </td>
				
				
				</tr>
							<tr>
				<td colspan="6" style="font-size: 14pt;heigth:22px" class="title">
			指定代表或者共同委托代理人
				</td>
				</tr>
					<%
					 List sqwt=QYDJ_SQWT.getList(" WHERE OPENO='"+OPENO+"'");
					com.macrosoft.icms.qydj.QYDJ_SQWT_SQ bean = (com.macrosoft.icms.qydj.QYDJ_SQWT_SQ)sqwt.get(0);
					%>
				<tr>
				<td style="width:15%">具体经办人姓名</td>
				<td style="width:18%"><%=bean.getCONSIGNER() %></td>
				<td style="width:15%">身份证件号码</td>
				<td style="width:18%"><%=bean.getCERNO() %></td>
			    <td style="width:15%">联系电话</td>
				<td style="width:18%"><%=bean.getTEL()%></td>
				</tr>
				<tr>
				<td>授权期限</td>
				<td colspan="5"> 自<%=bean.getCONFROM() %>至<%=bean.getCONTO() %></td>
				</tr>
				<tr>
				<td colspan="6" style="text-align:left;">
	授权权限     &nbsp;&nbsp;&nbsp;1.同意<%if("1".equals(bean.getIFLICENSE1())){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(bean.getIFLICENSE1())){out.print(selected);}else{out.print(checkBox);}%> 核对登记材料中的复印件并签署核对意见；
	<br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.同意<%if("1".equals(bean.getIFLICENSE3())){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(bean.getIFLICENSE3())){out.print(selected);}else{out.print(checkBox);}%> 修改有关表格的填写错误；
	<br>
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.同意<%if("1".equals(bean.getIFLICENSE2())){out.print(selected);}else{out.print(checkBox);}%>  不同意<%if("2".equals(bean.getIFLICENSE2())){out.print(selected);}else{out.print(checkBox);}%> 《企业名称预先核准通知书》。
	
         </td>
         </tr>
         <tr>
         <td colspan="6" style="height:285px;" align="right">
         <p align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（指定代表或委托代理人、具体经办人身份证件复印件粘贴处）</p>
         </td>
         </tr>
				<tr>
				<td style="height:40px;">
				申请人<br>签字或盖章
				</td>
				<td colspan="5" align="right"> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				年 &nbsp;&nbsp; 月  &nbsp;&nbsp;  日</td>
				</tr>
	</table>

<p class="PageNext"></p>

	<table style="width: 80%;" align="center" style="border-style:none;border-width:0px">
	<tr><td style="line-height:25px;border-style:none;border-width:0px">	
	
	<center>
	<p><strong>企业名称预先核准申请书填写说明</strong></p></center>
<p><strong>注：</strong>以下“说明”供填写申请书参照使用，不需向登记机关提供。<br/>
1、	本申请书适用于所有内资企业的名称预先核准申请、名称项目调整（投资人除外）、名称延期申请等。<br/>
2、	向登记机关提交的申请书只填写与本次申请有关的栏目。<br/>
3、	申请人应根据《企业名称登记管理规定》和《企业名称登记管理实施办法》有关规定申请企业名称预先核准，所提供信息应真实、合法、有效。<br/>
4、	 “企业类型”栏应根据以下具体类型选择填写：有限责任公司、股份有限公司、分公司、非公司企业法人、营业单位、企业非法人分支机构、个人独资企业、合伙企业。<br/>
5、	“经营范围”栏只需填写与企业名称行业表述相一致的主要业务项目，应参照《国民经济行业分类》国家标准及有关规定填写。<br/>
6、	申请企业设立名称预先核准、对已核准企业名称项目进行调整或延长有效期限的，申请人为全体投资人。其中，自然人投资的由本人签字，非自然人投资的加盖公章。<br/>
7、	在原核准名称不变的情况下，可以对已核准名称项目进行调整，如住所、注册资本（金）等，变更投资人项目的除外。<br/>
8、	《企业名称预先核准通知书》的延期应当在有效期期满前一个月内申请办理，申请延期时应缴回《企业名称预先核准通知书》原件。投资人有正当理由，可以申请《企业名称预先核准通知书》有效期延期六个月，经延期的《企业名称预先核准通知书》不得再次申请延期。<br/>
9、	指定代表或委托代理人、具体经办人应在粘贴的身份证件复印件上用黑色钢笔或签字笔签字确认“与原件一致”。<br/>
10、	“投资人”项及“已核准名称项目调整（投资人除外）”项可加行续写或附页续写。<br/>
11、	申请人提交的申请书应当使用A4型纸。依本表打印生成的，使用黑色钢笔或签字笔签署；手工填写的，使用黑色钢笔或签字笔工整填写、签署。<br/>
	</td></tr></table>
</body></html>
