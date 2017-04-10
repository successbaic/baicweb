<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="../jspheader.inc"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<html>
<head>
<title>广告发布登记申请相关说明</title>
<style type="text/css">
.yxsm {
	background-image: url(images/main/ywbltitleBG.jpg);
	background-repeat: repeat-x;
}
</style>

</head>
<body bgcolor="#eefbf7" style="margin-top: 0; margin-bottom: 0">
	<%@include file="../top.inc"%>

	<%
		StepShow stepShow = new StepShow();
	%>
	<%=stepShow.getStep("1", Page.getDL() + Page.getOPETYPE(), Page.getOPENO())%>
	<table width="100%" align="center" border="1">
		<tr>
			<td colspan="4" class="yxsm" align="center"
				style="font-size: 14pt; text-align: center; background-image: url('../images/main/ywbltitleBG.jpg');">
				广告发布登记申请相关说明</td>
		</tr>
		<tr>
			<td colspan="4" class="lc2" style="font-family: 宋体; font-size: 10pt;">
				1、从事广告发布业务的广播电台、电视台、报刊出版单位，依法办理广告发布登记。<br/>
				2、在签署文件和填表前，申请人应当已经阅读<font color="red"><b>《中华人民共和国行政许可法》、《中华人明共和国过广告法》、国家工商总局《广告发布登记管理规定》</b></font>等法律、法规和规章，确知相关权利和义务。
				<br /> 
				3、申请人对提交材料的合法性、有效性、真实性承担责任。 <br /> 
				4、广告发布登记有效期届满需要延续的，广告发布单位应当于有效期届满三十日向工商行政管理部门提出延续申请。
				<br/>
				5、<font color="red">申请人申请广告发布登记，除填写完整表单外，还需要提交下列申请材料：</font><br />
				&nbsp;&nbsp;&nbsp;&nbsp;（1) 法人资格证明； <br />
				&nbsp;&nbsp;&nbsp;&nbsp;（2）相关媒介批准文件； <br />
				&nbsp;&nbsp;&nbsp;&nbsp;（3）广告业务机构证明文件； <br />
				&nbsp;&nbsp;&nbsp;&nbsp;（4）广告负责人任命文件； <br />
				&nbsp;&nbsp;&nbsp;&nbsp;（5）广告从业人员和广告审查人员证明文件； <br />
				&nbsp;&nbsp;&nbsp;&nbsp;（6）具有广告发布相适应的场所证明文件。 <br />
		
				6、通过网上申请的，上述材料扫描后为图片后上传。 <br />
				7、对上述内容如有任何疑问请致电广告处，联系电话：<%=icms.getSysDm("GGDJDH",icms.getCURRENTUNIT()) %>。 <br />
				 附：
			</td>
		</tr>
		<br />
		<tr class="yxsm">
			<td align="center" width="10%">序号</td>
			<td align="center" width="35%">材料名称</td>
			<td align="center" width="40%">说明</td>
			<td align="center" width="15%">份数</td>
		</tr>
		<tr>
			<td align="center">1</td>
			<td align="left">法人资格证明文件</td>
			<td align=""left"">原件复印件</td>
			<td align="center">1</td>
		</tr>
		<tr>
			<td align="center">2</td>
			<td align="left">媒介批准文件</td>
			<td align=""left"">原件复印件（媒介批准单位中的出版单位不具备法人资格的，应由其具有法人资格的主办单位提出申请。）</td>
			<td align="center">1</td>
		</tr>
		<tr>
			<td align="center">3</td>
			<td align="left">广告业务证明文件及其负责人任命文件</td>
			<td align=""left"">已有证正式文件的提供原件复印件；无正式文件的提供关于广告业务机构及其负责人的情况说明，由申请单位盖章确认（原件）。</td>
			<td align="center">1</td>
		</tr>
		<tr>
			<td align="center">4</td>
			<td align="left">广告从业人员和广告审查人员证明文件</td>
			<td align=""left"">单位出具的广告从业人员和广告审查人员证明文件（原件复印件）</td>
			<td align="center">1</td>
		</tr>
		<tr>
			<td align="center">5</td>
			<td align="left">场地使用证明文件</td>
			<td align=""left"">经营产所产权证明或租赁合同（原件复印件）</td>
			<td align="center">1</td>
		</tr>
	</table>
	<br />
	<CENTER>
		<%
			String url = "ggdj_slxx.jsp";
		%>
		<div class="subImgs" onclick="window.location.href='<%=url%>'">我了解</div>
	</CENTER>
	<%@include file="../bottom.inc"%>
</body>
</html>