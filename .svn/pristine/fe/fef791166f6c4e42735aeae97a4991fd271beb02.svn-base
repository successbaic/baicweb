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

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="pageshow" scope="page"  class="com.macrosoft.icms.system.PageShow"/>
<jsp:useBean id="MCGL_JBXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>

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
		<title>个体工商户名称预先核准申请书</title>
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
			个体工商户名称预先核准申请书
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
						<td class="tdLabel" rowspan="2" style="vertical-align: center;">
							经营者
						</td>
						<td class="tdContent">
							<div id="table">
								<ul>
									<li>姓名</li>
								</ul>
							<div>
								<%=MCGL_JBXX.getOWNERNAME() %>
							</div>
							</div>
						</td>
					</tr>	
						<tr>
						<td>
						<div id="table">
								<ul>
									<li>联系电话</li>
								</ul>
								<div>
								<%=MCGL_JBXX.getOWNERTEL() %>
							</div>
							</div>
						</td>
					</tr>	
					<tr>
						<td class="tdLabel" style="height: 150px;">
							经营范围
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
							经营场所
						</td>
						<td class="tdContent">
							<%=MCGL_JBXX.getDOM() %>
						</td>
					</tr>
					<tr>
						<td class="tdLabel" style="height: 350px;width: 100%;" colspan="2">
							<div>
							（经营者身份证复印件粘贴处）
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div style="text-align: left;"><div style="margin-left: 20px;">经营者签名：</div></div>
			<br/>
			<br/>
			<div style="float: right;">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</div>
		</div>
	</div>
	
	<br><p class="PageNext"></p> <br>

	<table style="width: 80%;" align="center" style="border-style:none;border-width:0px">
	<tr><td style="border-style:none;border-width:0px">		
	<center>
	<strong>
	填写个体工商户名称预先核准申请书须知</strong></center>
<p>&nbsp;&nbsp;&nbsp;&nbsp;1. 申请使用个体工商户名称的，应当依照《个体工商户条例》和国家工商总局《个体工商户名称登记管理办法》有关规定申请办理。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;2. 申请个体工商户名称预先核准的，应当向其经营场所所在地的登记机关提交：①经营者签署的《个体工商户名称预先核准申请书》；②经营者的身份证复印件。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;委托代理人办理的，还应当提交经营者签署的《委托代理人证明》及委托代理人身份证复印件。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;3. 个体工商户名称依次由行政区划、字号、行业、组织形式组成。其中：行政区划是指个体工商户经营场所所在县（市）和市辖区名称，行政区划之后可以缀以个体工商户经营场所所在地的乡镇、街道或者行政村、社区、市场名称；名称中字号应当由2个以上的汉字组成，可以使用个体工商户成员的姓名作字号，不得使用县级以上行政区划名称作字号；行业用语应当反映其主要经营活动内容或者经营特点；组织形式可以选用“厂”、“店”、“馆”、“部”、“行”、“中心”等字样，但不得使用“企业”、“公司”和“农民专业合作社”字样。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;4. 个体工商户的经营范围表述参照《国民经济行业分类》的中类、小类行业类别名称或具体经营项目。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;5. 个体工商户的经营场所是其营业所在地的详细地址，填写应当标明经营场所所在县（市、区）、乡（镇）及村、街道的门牌号码。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;6. 应当使用钢笔、毛笔或签字笔工整地填写表格或签名，请勿使用圆珠笔。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;7. 提交的申请书与其它申请材料应当使用A4型纸。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;以上各项未注明提交复印件的，应当提交原件；提交复印件的，应当注明“与原件一致”并由个体工商户经营者或者由其委托的代理人签字。<br/>
	</td></tr></table>
	</body>
</html>