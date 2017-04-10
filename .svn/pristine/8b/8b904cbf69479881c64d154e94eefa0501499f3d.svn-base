<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="../jspheader.inc"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<html>
<head>
<%
	if ("30".equals(Page.getOPETYPE())) {
%>
<title>广告发布变更申请相关说明</title>
<%
	} else if ("50".equals(Page.getOPETYPE())) {
%>
<title>广告发布注销申请相关说明</title>
<%
	}
%>

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
	<%=stepShow.getStep("2", Page.getDL() + Page.getOPETYPE(), Page.getOPENO())%>
	<table width="100%" align="center" border="1">
		<tr>
			<td colspan="4" class="yxsm" align="center"
				style="font-size: 14pt; text-align: center; background-image: url('../images/main/ywbltitleBG.jpg');">
				<%
					if ("30".equals(Page.getOPETYPE())) {
				%> 广告发布变更申请相关说明 <%
					} else if ("50".equals(Page.getOPETYPE())) {
				%> 广告发布注销申请相关说明 <%
					}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="lc2" style="font-family: 宋体; font-size: 10pt;">
				1、在签署文件和填表前，申请人应当已经阅读<font color="red"><b>《中华人民共和国行政许可法》、《中华人明共和国过广告法》、国家工商总局《广告发布登记管理规定》</b></font>等法律、法规和规章，确知相关权利和义务。
				<br /> 2、申请人对提交材料的合法性、有效性、真实性承担责任。 <br /> <%
 	if ("30".equals(Page.getOPETYPE())) {
 %> 3、广告发布登记有效期届满需要延续的，广告发布单位应当于有效期届满三十日向工商行政管理部门提出延续申请。<br />
				4、申请人申请变更广告业务登记，除填写完整 本表外，还需要提交与变更事项相关的证明文件。<br />
				5、通过网上申请的，上述材料扫描后为图片后上传。<br> 6、对上述内容如有任何疑问请致电广告处，联系电话：<%=icms.getSysDm("GGDJDH", icms.getCURRENTUNIT())%>。
				<br /> 附：
		<tr class="yxsm">
			<td align="center" width="10%">序号</td>
			<td align="center" width="35%">材料名称</td>
			<td align="center" width="40%">说明</td>
			<td align="center" width="15%">份数</td>
		</tr>
		<tr>
			<td align="center">1</td>
			<td align="left">变更后的法人资格证明文件</td>
			<td align=""left"">原件复印件</td>
			<td align="center">1</td>
		</tr>
		<tr>
			<td align="center">2</td>
			<td align="left">变更后的媒介批准文件</td>
			<td align=""left"">原件复印件</td>
			<td align="center">1</td>
		</tr>
		<tr>
			<td align="center">3</td>
			<td align="left">变更的场所使用证明文件</td>
			<td align=""left"">经营场所产权证或租赁合同（原件复印件）</td>
			<td align="center">1</td>
		</tr>
		<tr>
			<td align="center">4</td>
			<td align="left">仅办理减少广告发布媒介的变更</td>
			<td align=""left"">只需填表，无需提交材料</td>
			<td align="center">1</td>
		</tr>
		<%
			} else if ("50".equals(Page.getOPETYPE())) {
		%>
		3、申请人申请注销广告业务登记，需填写单位基本情况及申请注销登记原因，无需提交其他材料。
		<br> 4、对上述内容如有任何疑问请致电广告处，联系电话：<%=icms.getSysDm("GGDJDH", icms.getCURRENTUNIT())%>。
		<br />
		<%
			}
		%>
		</td>
		</tr>

	</table>
	<br />
	<CENTER>
		<%
			String url = "ggdj_control.jsp";
		%>
		<div class="subImgs" onclick="window.location.href='<%=url%>'">我了解</div>
	</CENTER>
	<%@include file="../bottom.inc"%>
</body>
</html>