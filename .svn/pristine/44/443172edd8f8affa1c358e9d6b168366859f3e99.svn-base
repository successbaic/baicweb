<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="QYDJ_JBXX" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ" />
<jsp:useBean id="GTDJ_JBXX" scope="page"
	class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ" />
<%@page import="com.macrosoft.icms.ems.WEB_USER_EXPRESS"%>
<%@page import="com.macrosoft.icms.bean.ONLINE_ORDER_CFG"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page import="com.macrosoft.icms.util.*"%>
<jsp:useBean id="QYDJ_YWSB" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" />
<jsp:useBean id="DCDY_JBXX" scope="page"
	class="com.macrosoft.icms.htgl.DCDY_JBXX_SQ" />
<jsp:useBean id="ONLINE_ORDER_RECODER" scope="page"
	class="com.macrosoft.icms.bean.ONLINE_ORDER_RECODER" />
<jsp:useBean id="ONLINE_ORDER_RECODER_LS" scope="page"
	class="com.macrosoft.icms.bean.ONLINE_ORDER_RECODER_LS" />
<jsp:useBean id="ONLINE_ORDER_CFG" scope="page"
	class="com.macrosoft.icms.bean.ONLINE_ORDER_CFG" />
<jsp:useBean id="SYS_DMDZ" scope="page"
	class="com.macrosoft.icms.util.SYS_DMDZ" />
<html>
	<head>
		<!--media=print 这个属性可以在打印时有效-->
		<style media="print">
.Noprint {
	display: none;
}

.PageNext {
	page-break-after: always;
}
</style>
		<script type="text/javascript">
function showEmsMess(OPENO){
	var url = "web/addEmsMess.jsp?OPENO="+OPENO;
    var tmp=window.showModalDialog(url,window,"dialogHeight=500px;dialogWidth=500px;status:yes;scroll:yes;resizable:no;center:yes");
    if(tmp!=undefined){
    	window.location.reload();	
    }
}
//YYSTATUS 预约状态 0：未预约 1：已预约 2：预约过期
function doYy(OPENO,OPETYPE,ENTCLASS,YYSTATUS){
	var REGORG=document.getElementById("REGORG").value
	if(REGORG=="370100"){
		alert("登记机关是济南市工商局的暂不支持网上预约功能！");
		return;
	}
/*
	if(ENTCLASS == "5"||ENTCLASS == "6"){
		alert("系统目前对个体和农民专业户不提供预约服务，请携带相关材料到管辖工商所办理相关业务！");
		return;
	}
		*/
//YYSTATUS 预约
	if(YYSTATUS == "1"){
		if(!window.confirm("重新预约将取消当前预约，是否确定？")){
			return;
		}
	}
	var yyUrl = "wsyy/wsyy_qyxz.jsp?OPENO="+OPENO+"&STATUS=2&OPETYPE="+OPETYPE+"&ENTCLASS="+ENTCLASS+"&YYTYPE=2&&YYSTATUS="+YYSTATUS;
	var tmp=window.showModalDialog(yyUrl,window,"dialogHeight=560px;dialogWidth=610px;status:no;scroll:yes;resizable:no;center:yes");
    if(tmp!=undefined){
    	window.location.reload();	
    }
}
</script>

	<%
		String OPENO = SysUtility.doPreProcess(request
				.getParameter("OPENO"));
		String STATUS = SysUtility.doPreProcess(request
				.getParameter("STATUS"));
		String OPETYPE = SysUtility.doPreProcess(request
				.getParameter("OPETYPE"));
		String sENTTYPE = SysUtility.doPreProcess(request
				.getParameter("ENTTYPE"));

		String LX = "企业";
		String name = "";
		String regorg = "";
		String MORREGCNO="";
		if("DCDY".equals(sENTTYPE)){
			DCDY_JBXX.setOPENO(OPENO);
			DCDY_JBXX.doSelect();
			MORREGCNO=DCDY_JBXX.getMORREGCNO();
		}
		

		QYDJ_YWSB.setOPENO(OPENO);
		QYDJ_YWSB.doSelect();
		STATUS = QYDJ_YWSB.getSTATUS();
		name = QYDJ_YWSB.getENTNAME();
		regorg = QYDJ_YWSB.getREGORG();
		String YW = icms.getSysDm("OPETYPE", OPETYPE);
		String gtmc = "";
		if (sENTTYPE.equals("GT")) {
			GTDJ_JBXX.setOPENO(OPENO);
			GTDJ_JBXX.doSelect();
			//name=GTDJ_JBXX.getTRANAME();
			//regorg=GTDJ_JBXX.getREGORG();
			name = GTDJ_JBXX.getOPERNAME();
			LX = "个体户";
			gtmc = GTDJ_JBXX.getTRANAME().replaceAll("\\*","");
		} else {
			QYDJ_JBXX.setOPENO(OPENO);
			QYDJ_JBXX.doSelect();
			//name=QYDJ_JBXX.getENTNAME();
			//regorg=QYDJ_JBXX.getREGORG();
		}
		if (sENTTYPE.equals("HZS")) {
			LX = "农民专业合作社";
		}
		if (sENTTYPE.equals("HZSFZ")) {
			LX = "农民专业合作社分支";
		}
		String title = LX+YW+"通知书";
		if("3".equals(STATUS)||"5".equals(STATUS)){
			title = "驳回通知书";
		}
		title = "业务办理通知书";
		boolean YY = false;//是否有预约服务
		boolean KD = false;//是否有开快递服务
		boolean IFCANYY = false;//是否可以预约
		//			boolean ifCanYqYy = false;//是否可以逾期预约
		int yqcsMax = 0;//可以逾期预约的最大次数
		int yqTimes = 0;//已经逾期的次数
		boolean isInOrdering = false;//正常预约中
		boolean IFKD = false;//是否已经申请快递服务
		boolean isYQ = false;//是否已经逾期
		WEB_USER_EXPRESS mes = null;
		//审核已经通过
		if (STATUS.equals("2") || STATUS.equals("4") || STATUS.equals("7")
				|| STATUS.equals("8") || STATUS.equals("9")
				|| STATUS.equals("10")) {
			int num = QYDJ_YWSB
					.getColumnValueBySql("select count(*) from com_param_cfg t where param='WSDJKDFW' and t.constrains1='"
							+ QYDJ_YWSB.getREGORG()
							+ "' and t.paramvalue='1'");
			if (num > 0) {
				KD = true;
			}
			mes = new WEB_USER_EXPRESS();
			if (KD) {
				if (KD) {
					mes
							.doSelectBySql("SELECT * FROM WEB_USER_EXPRESS WHERE OPENO='"
									+ OPENO + "'");
					if (!mes.getOPENO().equals("")) {
						IFKD = true;
					}
				}
			}
			if (!IFKD) {

				//目前个体和工商户不进行预约服务
				/*
				if ("5".equals(QYDJ_YWSB.getENTCLASS())
						|| "6".equals(QYDJ_YWSB.getENTCLASS())) {
					YY = false;
				} else {
					List<ONLINE_ORDER_CFG> listOrdercfg = ONLINE_ORDER_CFG
							.getList(" WHERE regorg='"
									+ QYDJ_YWSB.getREGORG()
									+ "' AND INSTR(businesstype,'2')>0 AND flag = '1'");
					if (listOrdercfg.size() > 0) {//查询该登记机关是否有预约
						YY = true;
					}
				}
				*/
				List<ONLINE_ORDER_CFG> listOrdercfg = ONLINE_ORDER_CFG
							.getList(" WHERE regorg='"
									+ QYDJ_YWSB.getREGORG()
									+ "' AND INSTR(businesstype,'2')>0 AND flag = '1'");
					if (listOrdercfg.size() > 0) {//查询该登记机关是否有预约
						YY = true;
					}
				if (YY) {//如果有预约服务
					ONLINE_ORDER_RECODER.setOPENO(OPENO);
					boolean hasYyRecoder = ONLINE_ORDER_RECODER.doCount();
					//如果有预约记录
					if (hasYyRecoder) {
						ONLINE_ORDER_RECODER.doSelect();
						//是否逾期
						boolean isYQNow = DateUtils
								.checkDateAfterToday(ONLINE_ORDER_RECODER
										.getORDERDATE()
										+ " "
										+ ONLINE_ORDER_RECODER.getENDTIME());
						if (!isYQNow) {
							//如果已经逾期，则将记录表的数据移动到历史表中
							BeanUtils.copyProperties(
									ONLINE_ORDER_RECODER_LS,
									ONLINE_ORDER_RECODER);
							//设置入表时间
							ONLINE_ORDER_RECODER_LS
									.setRECORDERDATE(DateUtils
											.getTodayStr("yyyy-MM-dd HH:mm:ss"));
							//设置预约的记录的状态为逾期
							ONLINE_ORDER_RECODER_LS.setRECODERTYPE("10");
							//将记录添加到历史表中
							ONLINE_ORDER_RECODER_LS.doAdd();
							//将记录表中的记录删除
							ONLINE_ORDER_RECODER.doDelete();
							//QYDJ_YWSB.setSTATUS("10");
							//QYDJ_YWSB.doModify();
							STATUS = "10";
						} else {
							//正常预约中
							isInOrdering = true;
						}
					}
					try {
						//最大逾期次数
						yqcsMax = Integer.parseInt(icms.getSysRemark(
								"WSDJ_CFG", "YYYQCS"));
						//已经逾期次数
						yqTimes = ONLINE_ORDER_RECODER_LS.getYqTimes(OPENO);
						//查询最后一次的逾期记录
						if (yqTimes > 0) {
							isYQ = true;
							ONLINE_ORDER_RECODER_LS = ONLINE_ORDER_RECODER_LS
									.getLastRecoder(OPENO);
						}
						//如果逾期次数未超过最大逾期次数(名称核准通过或者逾期的状态)则可以继续逾期预约
						if (yqcsMax <= yqTimes) {
							IFCANYY = false;
						} else {
							IFCANYY = true;
						}
					} catch (Exception e) {
						IFCANYY = false;
						e.printStackTrace();
					}

				}
			}
		}
	%>
	<title><%=title %></title>
	</head>
	<body>
	<input type="hidden" id="REGORG" name="REGORG" value="<%=QYDJ_YWSB.getREGORG()%>">
	<table border="0" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<caption style="text-align: center;">
				<font size="4pt"><%=title %>
			</caption>
			<tr>
				<td width="100%" colspan="2" align="left" class='lc2'><%=SysSystem.toUnderlineStr(name, "center", 30)%>:
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;你的申请号：<font size="2" style="font-weight: bolder;"><%if("DCDY".equals(sENTTYPE)){%><%=MORREGCNO%><%}else{ %><%=OPENO%><%} %></font> 的网上<%=YW%>申请
					<%
					if("GT".equals(sENTTYPE)){
						out.print(",名称为："+gtmc);
					}
						
					%>
					<%
						if (STATUS.equals("2") || STATUS.equals("4"))//预审通过
						{
							if(SYS_DMDZ.ifDzh(webuser.getXZQH())){//全程电子化修改1014
							%>
							<font color="#FF0000">
							【已通过】</font>
							<%			
							}else{
							%>
							<font color="#FF0000">
							【已通过】</font>，请在
							<font color="#FF0000">
							<%
							if(ONLINE_ORDER_RECODER.getSTARTTIME().equals("")){
							out.println("七个工作日");
							}else{
							out.println("预约时间");
							}
							 %>
							</font>内携带本通知书及<%=YW%>申请书以及下列提交材料到
							<font color="#FF0000"><%=QYDJ_YWSB.getCLBSDD()%></font>，办理相关手续。
							<%
							}
						}
						if (STATUS.equals("3"))//预审驳回
						{
					%>
					<font color="#FF0000">【被驳回】</font>，请根据预审意见重新修改后，重新提交申请。
					<%
						} else if (STATUS.equals("7")) {//已办结
					%>
					<font color="#FF0000">【已经办结】</font>。
					<%
						} else if (STATUS.equals("8")) {//已经预约
					%>
					<font color="#FF0000">【已经预约】，请在预约时间到大厅办理业务，如果逾期则可能无法再次预约。</font>。
					<%
						} else if (STATUS.equals("9")) {//已申请快递服务
							if(SYS_DMDZ.ifDzh(webuser.getXZQH())){//全程电子化修改1014
							%>
							<font color="#FF0000">【已经申请快递服务】，请耐心等待。</font>
							<%			
							}else{
							%>
							<font color="#FF0000">【已经申请快递服务】，请耐心等待，如有问题请咨询 &nbsp;<%=icms.getSysRemark("WSDJ_CFG", "KDFWTEL")%>。</font>。
							<%
							}
						} else if (STATUS.equals("10")) {//已不可预约
					%>
					<font color="#FF0000">【预约已经逾期】。</font>
					<%
						}
					%>
				</td>
				<br>

			</tr>
			</table>

		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580">
			
			<tr>
				<td class='lc1'>
					审批结果
				</td>
				<td class='lc2'>
						<%
						if ("3".equals(STATUS)) {
							out.print("预审驳回");
						} else if("5".equals(STATUS)) {
							out.print("核准驳回");
						}else{
							out.print("审批通过");
						}
					%>
				</td>
			</tr>
			<tr>
				<td class='lc1'>
					<%
						if ("3".equals(STATUS)||"5".equals(STATUS)) {
							out.println("驳回原因");
						} else {
							out.println("审批意见");
						}
					%>
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getAPPROPIN().replaceAll("&b", "\n")%></td>
			</tr>
			<%
				String SUBDOC = QYDJ_YWSB.getSUBDOC();
				if (!SUBDOC.equals("")) {
					SUBDOC = SUBDOC.replaceAll("&b", "<br/>");
			%>
			<tr>
				<td class='lc1'>
					提交材料
				</td>
				<td class='lc2'><%=SUBDOC%></td>
			</tr>
			<%
				}
				if (!QYDJ_YWSB.getCLBSDD().equals("")) {
			%>
			<tr>
				<td class='lc1'>
					材料报送地址
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getCLBSDD()%></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td class='lc1' width="20%">
					<%
						if (STATUS.equals("3")) {
							out.println("驳回日期");
						} else {
							out.println("审批日期");
						}
					%>
				</td>
				<td class='lc2'><%=QYDJ_YWSB.getAPPRDATE()%></td>
			</tr>
			<%--tr>
				<td class='lc1' width="20%">
					备 &nbsp; 注
				</td>
				<td class='lc2'>
					<%
						if (!QYDJ_YWSB.getSTATUS().equals("3")) {
							//out.print("预审人员工号："+QYDJ_YWSB.getAPPRPID());
						}
					%>
				</td>
			</tr> --%>
			<%
			if(webuser.getXZQH().equals("3701")){
			 %>
			</table>
			
			
			<table border="0" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<tr>
			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;声明：<br/>
&nbsp;&nbsp;&nbsp;&nbsp;企业（个体工商户）网上登记是一项便民措施，不是具体行政行为。本通知书并不代表登记机关做出受理、审查、决定的登记行为。您应当按照本通知书的要求，向我局正式提交材料齐全、符合法定形式的书面申请材料，经我局审查核准后，方可领取《营业执照》。<br/>

&nbsp;&nbsp;&nbsp;&nbsp;备注：<br/>
&nbsp;&nbsp;&nbsp;&nbsp;1.网上登记申请信息自预审通过之日起保留1个月，逾期网上登记申请信息将自动清除。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;2.预审通过的股东会（董事会、监事会）决议、章程，向我局提交时，应当经股东（董事、监事）签字、盖章后方可有效。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;3.向我局提交的材料中，复印件应当注明“与原件一致”并由股东或指定代表（委托代理人）加盖公章或签字。<br/>
&nbsp;&nbsp;&nbsp;&nbsp;4.本次预审系由我局工号为 <%=QYDJ_YWSB.getAPPRPID() %> 的工作人员预审。<br>
				
			</td>
			</tr>
			<%} %>
			
			<tr>
		<%if(webuser.getXZQH().equals("3713")){ %>	
		<td  class='lc1' width="20%">备 &nbsp; 注</td>		
		<td  class='lc2' >
				<%
				//if(!QYDJ_YWSB.getSTATUS().equals("3")){
					out.print("预审人员工号："+QYDJ_YWSB.getAPPRPID());
				//}
				%>
			</td>
		</tr>
		<%} %>
			<tr>
				<td width="100%" align="center" colspan="2" class="fc">
				<%if(SYS_DMDZ.ifDzh(webuser.getXZQH())){//全程电子化修改1014
				%>	
					&nbsp;&nbsp;&nbsp;&nbsp;
				<%}else{ %>
					<INPUT name="print" type=button value="打 印"
						onClick="window.focus();window.print();" class="NOPRINT">
					<INPUT name="close" type=button value="关 闭"
						onClick="javascript:window.close();" class="NOPRINT">
				<%} %>
				</td>
			</tr>
		</table>
		<br />
		<%
			if (isInOrdering) {
		%>
		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<tr>
				<td class="lc2">

					<%
						out.println("&nbsp;&nbsp;&nbsp;&nbsp;您已经进行了网上预约，预约时间："
									+ ONLINE_ORDER_RECODER.getORDERDATE()
									+ ONLINE_ORDER_RECODER.getSTARTTIME() + " "
									+ ONLINE_ORDER_RECODER.getENDTIME() + "，预约号："
									+ ONLINE_ORDER_RECODER.getORDERNO());
					%>
					请按时携带相关材料到工商局办理业务，如果不能预期在预约时间内办理您可以选择
					<a href='#'
						onclick="doYy('<%=OPENO%>','<%=QYDJ_YWSB.getOPETYPE()%>','<%=QYDJ_YWSB.getENTCLASS()%>','1')">
						<img border=0 src='images/icon/icon_edit.gif' alt='重新预约'>重新预约</a>
				</td>
			</tr>
		</table>
		<%
			} else if (isYQ) {
		%>
		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<tr>
				<td class="lc2">
					<%
						//out.println("&nbsp;&nbsp;&nbsp;&nbsp;您已经进行了网上预约，预约时间：" +
							//ONLINE_ORDER_RECODER_LS.getORDERDATE() +
							//ONLINE_ORDER_RECODER_LS.getSTARTTIME() + " " +
							//ONLINE_ORDER_RECODER_LS.getENDTIME() + "，预约号：" +
							//ONLINE_ORDER_RECODER_LS.getORDERNO());
					%>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;您的预约已过期，系统预约最多可预约&nbsp;<%=yqcsMax%>&nbsp;次，当前已经逾期
					&nbsp;<%=yqTimes%>
					&nbsp;次。
					<%
						if (IFCANYY&&(!SYS_DMDZ.ifDzh(webuser.getXZQH()))) {//全程电子化修改1014
					%>
						您可以选择
						<a href='#'
							onclick="doYy('<%=OPENO%>','<%=QYDJ_YWSB.getOPETYPE()%>','<%=QYDJ_YWSB.getENTCLASS()%>','2')">
							<img border=0 src='images/icon/icon_edit.gif' alt='逾期预约'>逾期预约</a>
						<br />
					<%
						} else {
					%>
						您可以选择去工商局办理
					<%
						}
					%>
					<%
						if (KD) {
					%>
						<br />
						&nbsp;&nbsp;&nbsp;&nbsp;选择
						<a href='#' onclick="showEmsMess('<%=OPENO%>')"><img border=0
								src='images/icon/ems.gif' alt='快递服务'>快递服务</a>。
						<br />
						<%if(SYS_DMDZ.ifDzh(webuser.getXZQH())){//全程电子化修改1014
						%>
						温馨提示：<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;您好，请务必填写真实邮寄地址，并将所填写邮寄地址具体到门牌号，
                         						我们会在审核通过后向制卡单位反馈并及时向您单位邮寄电子营业执照，<br/>
                        						如在邮寄后3-4个工作日还未收到电子营业执照，请拨打窗口咨询电话：8191311转8231到窗口领取。
						<%
						}else{
						%>
						&nbsp;&nbsp;&nbsp;&nbsp;通过快递服务，您可以将申请材料送达工商机关，业务办理完成后会将材料通过快递的方式寄送(到付)你处。
						<%} %>
						<br />

					<%
						}
					%>
				</td>
			</tr>
		</table>
		<%
			} else if (IFKD) {
		%>
		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580">
			<tr>
				<td class="lc2">
					&nbsp;&nbsp;&nbsp;&nbsp;您已经选择了快递服务，快递信息如下
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;联系人：<%=mes.getNAME()%><br />
					&nbsp;&nbsp;&nbsp;&nbsp;联系电话：<%=mes.getTEL()%><br />
					&nbsp;&nbsp;&nbsp;&nbsp;联系地址：<%=mes.getADDRESS()%>
				</td>
			</tr>
		</table>
		<%
			} else if (YY || KD) {
		%>
		<table border="1" align="center" cellpadding="0" cellspacing="0"
			width="580" class="NOPRINT">
			<tr>
				<td class="lc2">
					<font color="red">说明：</font>
					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;您可以根据需要，选择相关服务
					<br />
					<%
						if (YY&&(!SYS_DMDZ.ifDzh(webuser.getXZQH()))) {//全程电子化修改1014
					%>
						&nbsp;&nbsp;&nbsp;&nbsp;选择
						<a href='#'
							onclick="doYy('<%=OPENO%>','<%=QYDJ_YWSB.getOPETYPE()%>','<%=QYDJ_YWSB.getENTCLASS()%>','0')">
							<img border=0 src='images/icon/icon_edit.gif' alt='网上预约'>网上预约</a>
						<br />
						&nbsp;&nbsp;&nbsp;&nbsp;通过网上预约，可以节省您来现场工商局大厅具体业务的时间。
						<br />
					<%
						}
					%>
					<%
						if (KD) {
					%>
						&nbsp;&nbsp;&nbsp;&nbsp;选择
						<a href='#' onclick="showEmsMess('<%=OPENO%>')"><img border=0
								src='images/icon/ems.gif' alt='快递服务'>快递服务</a>。
						<br />
						<%if(SYS_DMDZ.ifDzh(webuser.getXZQH())){//全程电子化修改1014
						%>
						温馨提示：<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;您好，请务必填写真实邮寄地址，并将所填写邮寄地址具体到门牌号，
                         						我们会在审核通过后向制卡单位反馈并及时向您单位邮寄电子营业执照，
                         						如在邮寄后3-4个工作日还未收到电子营业执照，请拨打窗口咨询电话：8191311转8231到窗口领取。
						<%
						}else{
						%>
						&nbsp;&nbsp;&nbsp;&nbsp;通过快递服务，您可以将申请材料送达工商机关，业务办理完成后会将材料通过快递的方式寄送(到付)你处。
						<%} %>
						<br />
					<%
						}
							if (isYQ && KD) {
					%>
						&nbsp;&nbsp;&nbsp;&nbsp;网上预约、快递服务只能选择一项。
					<%
						}
					%>
				</td>
			</tr>
		</table>
		<%
			}
		%>
	</body>
</html>
<%
	dbc.close();
%>