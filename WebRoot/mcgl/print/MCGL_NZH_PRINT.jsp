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
<%@ page contentType="text/html;charset=GBK"%>
<%@page import="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ" %>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="MCGL_JBXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>
<jsp:useBean id="MCGL_TZRXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ"/>

<%	
	
	//String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	String OPENO =MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	
	MCGL_JBXX.setOPENO(OPENO);
	MCGL_JBXX.doSelect();
	
	
	
	//String WTYW="√设立□变更□注销□备案□";
	//String checkBox = "□";
    //String selected = "√";
%>
<html>
	<head>
		<link style="text/css" rel="stylesheet" href="css/print.css"/>
		<%out.print(pageshow.pagesetup_default()); %>
		<title>农民专业合作社名称预先核准申请书</title>
	</head>
	<body onload="pagesetup_default()" style="width:100%;height: 100%;">
	<div style="text-align: right; " class="noPrint">
		<div>
			<input type="button" value="打印申请书" onclick="window.print();">
			<input name=back type="button" value="关   闭" onclick="window.close();">
		</div>
		<div>
			<font color="red" style="font-size: 9pt;">
				(请用A4纸打印,在打印之前请在IE->文件->页面设置“中将”页眉"和“页脚”清空)
			</font>
		</div>
	</div>
	<div style="width:100%;height: 100%;text-align: center;">
		<div class="title">
			农民专业合作社名称预先核准申请书
		</div>
		<div class="printWidth">
			<table>
				<tbody>
					<tr>
						<td class="tdLabel">
							申请名称
						</td>
						<td class="tdContent">
							<%=MCGL_JBXX.getENTNAME() %>
						</td>
					</tr>	
					<tr>
						<td class="tdLabel" rowspan="2">
							备选名称<br/>
							（请选用不同字号）
						</td>
						<td class="tdContent">
							<font style="float: left">1.</font><%=MCGL_JBXX.getENTNAME1() %>
						</td>
					</tr>	
					<tr>
						<td class="tdContent">
							<font style="float: left">2.</font><%=MCGL_JBXX.getENTNAME2() %>
						</td>
					</tr>	
					<tr>
						<td class="tdLabel" style="height: 150px;">
							业务范围
						</td>
						<td class="tdContent" style="text-align: left;vertical-align: top;">
							<%=MCGL_JBXX.getBUSSCOPE() %>
							<%-- <table class="noBorder">
								<tr>
									<td>
										许可经营项目：<%=MCGL_JBXX.getABUITEMCO() %>
									</td>
								</tr>
								<tr>
									<td>
										一般经营项目：<%=MCGL_JBXX.getCBUITEM() %>
									</td>
								</tr>
							</table> --%>
						</td>
					</tr>
					<tr>
						<td class="tdLabel" style="height: 60px;">
							住所
						</td>
						<td class="tdContent">
							<%=MCGL_JBXX.getDOM() %>
						</td>
					</tr>
				</tbody>
			</table>
			<table style="width: 100%">
				<tr>
					<td colspan="3" style="border-top:solid #000 0px;">
						设立人
					</td>
				</tr>
				<tr>
					<td style="width:40%;">
						姓名或名称
					</td>
					<td style="width:20%;">
						成员类型
					</td>
					<td style="width:40%;">
						证照类别及号码
					</td>
				</tr>
				<% 
				 	List tzrxx=MCGL_TZRXX.getList(" WHERE OPENO='"+OPENO+"'"); 
					for(int i = 0;i<tzrxx.size();i++){ 
						MCGL_TZRXX_SQ bean = (MCGL_TZRXX_SQ)tzrxx.get(i);
				%>
				<tr>
					<td>
						<%=bean.getINV() %>
					</td>
					<td>
						<%=icms.getSysDm("MEMTYPE",bean.getINVTYPE())  %>
					</td>
					<td>
					<%
					if(bean.getINVTYPE().equals("21") ||bean.getINVTYPE().equals("22")){
						out.println(icms.getSysDm("CERTYPE",bean.getCERTYPE()) +"：<br/>"+bean.getCERNO());
					}else{
						out.println(icms.getSysDm("BLICTYPE",bean.getBLICTYPE()) +"：<br/>"+bean.getBLICNO());
					}
					%>						
					</td>
				</tr>
				<%} %>
			</table>
			<br/>
			<div style="text-align: left;"><div style="margin-left: 20px;">经办人签名：</div></div>
			<br/>
			<br/>
			<div style="float: right;">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</div>
			<br/>
			<br/>
			<br/>
			<div style="float: left;" class="note">注：经办人为农民专业合作社全体设立人指定代表或者委托代理人。</div>
			<br/>
			<div class="PageNext"></div>
			<br/>
			<div class="title">
			填写农民专业合作社名称预先核准申请书须知
			</div>
			<div>
				<p>
					&nbsp;&nbsp;1.农民专业合作社申请名称预先核准，应当向其住所所在地的登记机关提交：全体设立人指定代表或者委托代理人签署的《农民专业合作社名称预先核准申请书》；全体设立人签署的《指定代表或者委托代理人的证明》（见申请类1.10）。
					<br/>&nbsp;&nbsp;2. 农民专业合作社名称依次由行政区划、字号、行业、组织形式组成。名称中的行政区划是指农民专业合作社住所所在地的县级以上（包括市辖区）行政区划名称。名称中的字号应当由2个以上的汉字组成，可以使用农民专业合作社成员的姓名作字号，不得使用县级以上行政区划名称作字号。名称中的行业用语应当反映农民专业合作社的业务范围或者经营特点。名称中的组织形式应当标明 “专业合作社”字样。名称中不得含有“协会”、“促进会”、“联合会”等具有社会团体性质的字样。
					<br/>&nbsp;&nbsp;3. 农民专业合作社的业务范围包括：农业生产资料的购买，农产品的销售、加工、运输、贮藏以及与农业生产经营有关的技术、信息等服务。
					<br/>&nbsp;&nbsp;4. 农民专业合作社的住所是其主要办事机构所在地，填写住所应当标明住所所在县（市、区）、乡（镇）及村、街道的门牌号码。
					<br/>&nbsp;&nbsp;5. 农民专业合作社设立时自愿成为该社成员的人为设立人；设立人写不下的，可另备页面载明。
					<br/>&nbsp;&nbsp;6.农民专业合作社的成员应当符合《农民专业合作社登记管理条例》第十三条、第十四条的规定。成员类型：分为农民成员、非农民成员、单位成员（企业、事业单位或者社会团体）三类。
					<br/>&nbsp;&nbsp;7.证照类别：农民成员为农业人口户口薄；非农民成员为居民身份证；单位成员为其登记机关颁发的企业营业执照或者登记证书。
					<br/>&nbsp;&nbsp;8.应当使用钢笔、毛笔或签字笔工整地填写表格或签名。
				</p>	
			</div>
		</div>
	</div>
	
	</body>
</html>